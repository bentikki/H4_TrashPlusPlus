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
    public class BaseController : ControllerBase
    {
        // helper methods
        protected string GetCurrentUserToken()
        {
            var accessToken = Request.Cookies["refreshToken"];
            return accessToken;
        }

        /// <summary>
        /// Returns the current user, if one is logged in
        /// </summary>
        /// <param name="userService">IUserService to use</param>
        /// <returns>Current logged in user, or null</returns>
        protected IUser GetCurrentUser(IUserService userService)
        {
            IUser currentUser = null;
            try
            {
                currentUser = userService.GetUserByToken(this.GetCurrentUserToken());
            }
            catch (Exception)
            {
                currentUser = null;
            }
            return currentUser;
        }

    }
}
