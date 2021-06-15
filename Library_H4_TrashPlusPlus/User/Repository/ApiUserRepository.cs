using System;
using System.Collections.Generic;
using System.Text;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    /// <summary>
    /// User Repository used while dealing with API
    /// </summary>
    public class ApiUserRepository : IUserRepository
    {
        private string _apiAddress;

        /// <summary>
        /// User Repository used while dealing with API
        /// Takes the API url as string parameter.
        /// </summary>
        /// <param name="apiAddress">URL of requested API</param>
        public ApiUserRepository(string apiAddress)
        {
            _apiAddress = apiAddress;
        }

        public bool Authenticate(string mail, string password)
        {
            throw new NotImplementedException();
        }

        public AuthenticateResponse Authenticate(string mail, string password, string ipAddress)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Sends a user to be created in the API, based on provided IUser object.
        /// </summary>
        /// <param name="userToCreate">IUser object to create user entity from</param>
        /// <returns>Created user entity as IUser object</returns>
        public IUser CreateUser(IUser userToCreate)
        {
            throw new NotImplementedException();
        }

        public IUser CreateUser(CreateUserRequest userToCreate)
        {
            throw new NotImplementedException();
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
