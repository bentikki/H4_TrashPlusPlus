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
using System.Threading.Tasks;
using Library_H4_TrashPlusPlus.Logging;
using System.Data.SqlClient;

namespace H4_TrashPlusPlus.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class UserController : BaseController
    {
        private IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        [HttpPost("CreateUser")]
        public async Task<IActionResult> CreateUser([FromBody] CreateUserRequest model)
        {
            User response = null;
            try
            {
                model = ObjectDecrypter.DecryptCreateUserRequest(CommonSettingsFactory.AsyncEncrypter, model);

                IUser createdUser =  await _userService.CreateUserAsync(model.Mail, model.Username, model.Password);
                response = (User)ObjectEncryptor.EncryptIUser(EncryptionFactory.GenerateAsyncEncryption(model.PublicKey), createdUser);
            }
            catch (DuplicateNameException e)
            {
                // An error occured while creating via Database.
                return BadRequest((new { message = "A user with these credentials already exists." }));
            }
            catch (ArgumentNullException e)
            {
                // An error occured while created via Database.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.MINOR, "The inputted value can not be null.", e);
                return BadRequest((new { message = "Invalid input. User was not created" }));
            }
            catch (ArgumentException e)
            {
                // An error occured while created via Database.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.MINOR, "An inputted value was incorrect.", e);
                return BadRequest((new { message = "Invalid input. User was not created" }));
            }
            catch (SqlException e)
            {
                // An error occured while creating via Database.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.CRITICAL, "An error occured while contacting the database.", e);
                return BadRequest((new { message = "Invalid input. User was not created" }));
            }
            catch (Exception e)
            {
                // An unkown error occured.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.CRITICAL, "An unkown error occured.", e);
                return BadRequest((new { message = "Invalid input. User was not created" }));
            }

            if (response == null)
                return BadRequest(new { message = "An unexpected error occured. User could not be created" });

            return Ok(response);
        }

        [AllowAnonymous]
        [HttpPost("Authenticate")]
        public async Task<IActionResult> Authenticate([FromBody] AuthenticateRequest model)
        {
            AuthenticateResponse response = null;

            try
            {
                model = ObjectDecrypter.DecryptAuthenticateRequest(CommonSettingsFactory.AsyncEncrypter, model);
                response = await _userService.AuthenticateAsync(model.Username, model.Password, GetIpAddress());

                if (response == null)
                    return Unauthorized(new { message = "Username or password is incorrect" });

                // Encrypt response before send
                response = ObjectEncryptor.EncryptAuthenticateResponse(EncryptionFactory.GenerateAsyncEncryption(model.PublicKey), response);
                SetTokenCookie(response.RefreshToken);

                return Ok(response);
            }
            catch (SqlException e)
            {
                // An error occured while creating via Database.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.CRITICAL, "An error occured while contacting the database.", e);
                return BadRequest((new { message = "Invalid input. User was not validated." }));
            }
            catch (Exception e)
            {
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.CRITICAL, "An unexpected error occured. User could not be validated.", e);
                return BadRequest(new { message = "An unexpected error occured. User could not be validated." });
            }

        }

        [AllowAnonymous]
        [HttpPost("RefreshToken")]
        public async Task<IActionResult> RefreshToken()
        {
            var refreshToken = Request.Cookies["refreshToken"];

            if (string.IsNullOrEmpty(refreshToken))
                return Unauthorized(new { message = "Invalid token" });

            var response = await _userService.RefreshTokenAsync(refreshToken, GetIpAddress());

            if (response == null)
            {
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.MINOR, "A user tried to refresh an invalid token.");
                return Unauthorized(new { message = "Invalid token" });
            }

            SetTokenCookie(response.RefreshToken);

            return Ok(response);
        }

        [HttpPost("Logout")]
        public async Task<IActionResult> Logout(string token)
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
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.MINOR, "A user tried to logout an invalid token.", e);
                return NotFound(new { message = "Token not found" });
            }
            catch (Exception e)
            {
                // An unexpected error occured.
                await IncidentLogger.GetLogger.LogMessageAsync(IncidentLevel.CRITICAL, "An unexpected error occured.", e);
                return BadRequest(new { message = "An unexpected error occured." });
            }

            return Ok(new { message = "Token revoked" });

        }

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
