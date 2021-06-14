using System;
using System.Collections.Generic;
using System.Text;
using Library_H4_TrashPlusPlus.User.Models;

namespace Library_H4_TrashPlusPlus.User.Repository
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

        /// <summary>
        /// Sends a user to be created in the API, based on provided IUser object.
        /// </summary>
        /// <param name="userToCreate">IUser object to create user entity from</param>
        /// <returns>Created user entity as IUser object</returns>
        public IUser CreateUser(IUser userToCreate)
        {
            throw new NotImplementedException();
        }
    }
}
