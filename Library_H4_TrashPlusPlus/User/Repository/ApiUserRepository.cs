using System;
using System.Collections.Generic;
using System.Text;
using H4_TrashPlusPlus.Models;
using Library_H4_TrashPlusPlus.Api;
using Library_H4_TrashPlusPlus.Encryption;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    /// <summary>
    /// User Repository used while dealing with API
    /// </summary>
    public class ApiUserRepository : ApiRepositoryMaster, IUserRepository
    {
        private IAsyncEncryption asyncEncryption;


        /// <summary>
        /// User Repository used while dealing with API
        /// Takes the API url as string parameter.
        /// </summary>
        /// <param name="apiAddress">URL of requested API</param>
        public ApiUserRepository(string apiAddress) : base(apiAddress)
        {
            asyncEncryption = EncryptionFactory.GenerateAsyncEncryption();
        }

        public AuthenticateResponse Authenticate(string mail, string password, string ipAddress)
        {
            string apiPath = "user/Authenticate";
            AuthenticateRequest authenticateRequest = new AuthenticateRequest()
            {
                Username = mail,
                Password = password,
                PublicKey = asyncEncryption.GetPublicKey()
            };
            AuthenticateResponse apiResponseUser = this.apiRequester.PostApi<AuthenticateResponse>(apiPath, authenticateRequest);

            this.apiRequester.jwtToken = apiResponseUser.JwtToken;

            return apiResponseUser;

        }

        public IUser CreateUser(CreateUserRequest userToCreate)
        {
            try
            {
                string apiPath = "user/createuser";
                IUser apiResponseUser = this.apiRequester.PostApi<User>(apiPath, userToCreate);
                return apiResponseUser;
            }
            catch
            {
                return null;
            }
        }

        public IUser GetUserById(int id)
        {
            string apiPath = "user/" + id;

            IUser apiResponseUser = this.apiRequester.GetApi<User>(apiPath);

            return apiResponseUser;
        }

        public IUser GetUserByLoginName(string loginName)
        {
            throw new NotImplementedException();
        }

        public IUser GetUserByToken(string token)
        {
            throw new NotImplementedException();
        }

        public bool Logout(string token, string ipAddress)
        {
            try
            {
                string apiPath = "user/Logout";
                string message = this.apiRequester.PostApi<ReworkResponse>(apiPath, token).Message;
                return message.Length > 0;
            }
            catch
            {
                return false;
            }
        }

        public AuthenticateResponse RefreshToken(string token, string ipAddress)
        {
            string apiPath = "user/RefreshToken";
            this.apiRequester.SetCookie("refreshToken", token);
            AuthenticateResponse apiResponseUser = this.apiRequester.PostApi<AuthenticateResponse>(apiPath, null);

            this.apiRequester.jwtToken = apiResponseUser.JwtToken;

            return apiResponseUser;
        }
    }
}
