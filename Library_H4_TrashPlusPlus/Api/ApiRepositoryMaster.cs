using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Api
{
    public abstract class ApiRepositoryMaster
    {
        protected ApiRequester apiRequester;
        protected string apiString;

        public ApiRepositoryMaster(string apidestination)
        {
            this.apiString = apidestination;
            this.apiRequester = new ApiRequester(apidestination);
        }

        public AuthenticateResponse RefreshToken()
        {
            string apiPath = "user/RefreshToken";
            AuthenticateResponse apiResponseUser = this.apiRequester.PostApi<AuthenticateResponse>(apiPath, null);

            ApiRequester.jwtToken = apiResponseUser.JwtToken;

            return apiResponseUser;
        }
    }
}
