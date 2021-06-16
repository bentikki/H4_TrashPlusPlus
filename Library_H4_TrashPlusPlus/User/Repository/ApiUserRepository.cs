using System;
using System.Collections.Generic;
using System.Text;
using Library_H4_TrashPlusPlus.Api;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    /// <summary>
    /// User Repository used while dealing with API
    /// </summary>
    public class ApiUserRepository : ApiRepositoryMaster, IUserRepository
    {

        /// <summary>
        /// User Repository used while dealing with API
        /// Takes the API url as string parameter.
        /// </summary>
        /// <param name="apiAddress">URL of requested API</param>
        public ApiUserRepository(string apiAddress) : base(apiAddress) { }

        public AuthenticateResponse Authenticate(string mail, string password, string ipAddress)
        {
            throw new NotImplementedException();

        }

        public IUser CreateUser(CreateUserRequest userToCreate)
        {
            string apiPath = this.apiString + "user/createuser";

            IUser apiResponseUser = this.apiRequester.PostApi<User>(apiPath, userToCreate);
            
            return apiResponseUser;
        }

        public IUser GetUserById(int id)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }

        public AuthenticateResponse RefreshToken(string token, string ipAddress)
        {
            throw new NotImplementedException();
        }
    }
}
