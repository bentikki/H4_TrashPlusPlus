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
        private IAsyncEncryption _asyncEncryption;
        // Servers Encryption
        private IAsyncEncryption _publicAsyncEncryption;
        private IAsyncEncryption PublicAsyncEncryption
        {
            get
            {
                if (_publicAsyncEncryption == null)
                {
                    GetPublicKey();
                }
                return _publicAsyncEncryption;
            }
        }


        /// <summary>
        /// User Repository used while dealing with API
        /// Takes the API url as string parameter.
        /// </summary>
        /// <param name="apiAddress">URL of requested API</param>
        public ApiUserRepository(string apiAddress) : base(apiAddress)
        {
            _asyncEncryption = EncryptionFactory.GenerateAsyncEncryption();
        }

        /// <summary>
        /// Sends a encryped post request to the api to authenticate
        /// </summary>
        /// <param name="mail">The mail for the user</param>
        /// <param name="password">The password for the user</param>
        /// <param name="ipAddress">Not used</param>
        /// <returns>The validated user</returns>
        public AuthenticateResponse Authenticate(string mail, string password, string ipAddress)
        {
            try
            {
                string apiPath = "user/Authenticate";
                AuthenticateRequest authenticateRequest = new AuthenticateRequest()
                {
                    Username = mail,
                    Password = password,
                    PublicKey = _asyncEncryption.GetPublicKey()
                };
                authenticateRequest = ObjectEncryptor.EcryptAuthenticateRequest(PublicAsyncEncryption, authenticateRequest);
                AuthenticateResponse apiResponseUser = this.apiRequester.PostApi<AuthenticateResponse>(apiPath, authenticateRequest);

                ApiRequester.jwtToken = apiResponseUser.JwtToken;

                return apiResponseUser;
            }
            catch
            {
                _publicAsyncEncryption = null;
                return null;
            }

        }

        /// <summary>
        /// Sends a encryped post request to the api
        /// </summary>
        /// <param name="userToCreate">The user to create</param>
        /// <returns>The created user</returns>
        public IUser CreateUser(CreateUserRequest userToCreate)
        {
            try
            {
                string apiPath = "user/createuser";

                userToCreate.PublicKey = _asyncEncryption.GetPublicKey();

                userToCreate = ObjectEncryptor.EncryptCreateUserRequest(PublicAsyncEncryption, userToCreate);

                IUser apiResponseUser = this.apiRequester.PostApi<User>(apiPath, userToCreate);

                apiResponseUser = ObjectDecrypter.DecryptIUser(_asyncEncryption, apiResponseUser);

                return apiResponseUser;
            }
            catch
            {
                _publicAsyncEncryption = null;
                return null;
            }
        }

        /// <summary>
        /// Gets the public key from the server
        /// </summary>
        private void GetPublicKey()
        {
            try
            {
                string apiPath = "encryption/getpublickey";
                ReworkResponse apiResponse = this.apiRequester.GetApi<ReworkResponse>(apiPath);
                _publicAsyncEncryption = EncryptionFactory.GenerateAsyncEncryption(apiResponse.Message);
            }
            catch
            {

            }
        }

        public IUser GetUserById(int id)
        {
            throw new NotImplementedException();
            //string apiPath = "user/" + id;

            //IUser apiResponseUser = this.apiRequester.GetApi<User>(apiPath);

            //return apiResponseUser;
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
            this.apiRequester.SetCookie("refreshToken", token);

            return RefreshToken();
        }
    }
}
