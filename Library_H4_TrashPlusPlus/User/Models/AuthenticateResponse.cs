using H4_TrashPlusPlus.Entities;
using Library_H4_TrashPlusPlus.Users.Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Users.Models
{
    public class AuthenticateResponse
    {
        public User UserObject { get; set; }
        public string JwtToken { get; set; }

        [JsonIgnore] // refresh token is returned in http only cookie
        public string RefreshToken { get; set; }

        public AuthenticateResponse(IUser user, string jwtToken, string refreshToken)
        {
            this.UserObject = (User)user;
            JwtToken = jwtToken;
            RefreshToken = refreshToken;
        }
    }
}
