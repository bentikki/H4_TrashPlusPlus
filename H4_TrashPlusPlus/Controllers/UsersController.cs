using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using H4_TrashPlusPlus.Models;
using Microsoft.AspNetCore.Http;
using System;
using Library_H4_TrashPlusPlus.Users;
using H4_TrashPlusPlus.Entities;
using System.Data;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Users.Entities;
using Microsoft.Net.Http.Headers;
using Library_H4_TrashPlusPlus.Encryption;
using Library_H4_TrashPlusPlus;

namespace H4_TrashPlusPlus.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        private IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        [HttpPost("CreateUser")]
        public IActionResult CreateUser([FromBody] CreateUserRequest model)
        {
            User response = null;
            try
            {
                response = (User)_userService.CreateUser(model.Mail, model.Username, model.Password);

            }
            catch (ArgumentException e)
            {
                return BadRequest((new { message = "Invalid input. User was not created" }));
            }
            catch (DuplicateNameException)
            {
                return BadRequest((new { message = "A user with these credentials already exists." }));
            }

            if (response == null)
                return BadRequest(new { message = "An unexpected error occured. User could not be created" });

            return Ok(response);
        }

        [AllowAnonymous]
        [HttpPost("Authenticate")]
        public IActionResult Authenticate([FromBody] AuthenticateRequest model)
        {
            AuthenticateResponse response = null;

            try
            {
                response = _userService.Authenticate(model.Username, model.Password, GetIpAddress());

                if (response == null)
                    return Unauthorized(new { message = "Username or password is incorrect" });

                // Encrypt response before send
                response = ObjectEncryptor.EncryptAuthenticateResponse(EncryptionFactory.GenerateAsyncEncryption(model.PublicKey), response);
                SetTokenCookie(response.RefreshToken);

                return Ok(response);

            }
            catch (Exception)
            {
                return BadRequest(new { message = "An unexpected error occured. User could not be created" });
            }

        }

        [AllowAnonymous]
        [HttpPost("RefreshToken")]
        public IActionResult RefreshToken()
        {
            var refreshToken = Request.Cookies["refreshToken"];

            if (string.IsNullOrEmpty(refreshToken))
                return Unauthorized(new { message = "Invalid token" });

            var response = _userService.RefreshToken(refreshToken, GetIpAddress());

            if (response == null)
                return Unauthorized(new { message = "Invalid token" });

            SetTokenCookie(response.RefreshToken);

            return Ok(response);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            try
            {
                // Get current logged in user Example
                IUser currentUser = this.GetCurrentUser();
                if (currentUser == null)
                    return Unauthorized(new { message = "Invalid token" });

                var user = _userService.GetUserById(id);
                if (user == null) return NotFound();

                return Ok(user);
            }
            catch (Exception)
            {
                return Unauthorized(new { message = "Invalid token" });
            }
        }

        [HttpPost("Logout")]
        public IActionResult Logout(string token)
        {
            // accept token from request body or cookie
            var tokenValue = token ?? Request.Cookies["refreshToken"];

            if (string.IsNullOrEmpty(tokenValue))
                return BadRequest(new { message = "Token is required" });

            bool logoutSuccess = false;

            try
            {
                // Logout via user service.
                logoutSuccess = _userService.Logout(tokenValue, GetIpAddress());
            }
            catch (ArgumentException e)
            {
                // Token could not be found.
                return NotFound(new { message = "Token not found" });
            }
            catch (Exception e)
            {
                // An unexpected error occured.
                return BadRequest(new { message = "An unexpected error occured." });
            }

            return Ok(new { message = "Token revoked" });

        }

        private string GetCurrentUserToken()
        {
            var accessToken = Request.Cookies["refreshToken"];
            return accessToken;
        }

        private IUser GetCurrentUser()
        {
            IUser currentUser = this._userService.GetUserByToken(this.GetCurrentUserToken());
            return currentUser;
        }

        // helper methods
        private void SetTokenCookie(string token)
        {
            var cookieOptions = new CookieOptions
            {
                HttpOnly = true,
                Expires = DateTime.UtcNow.AddDays(7)
            };
            Response.Cookies.Append("refreshToken", token, cookieOptions);
        }

        private string GetIpAddress()
        {
            if (Request.Headers.ContainsKey("X-Forwarded-For"))
                return Request.Headers["X-Forwarded-For"];
            else
                return HttpContext.Connection.RemoteIpAddress.MapToIPv4().ToString();
        }

    }
}
