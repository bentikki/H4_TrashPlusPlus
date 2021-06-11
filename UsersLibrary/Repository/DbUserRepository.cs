using System;
using System.Collections.Generic;
using System.Text;
using UsersLibrary.Models;

namespace UsersLibrary.Repository
{
    /// <summary>
    /// User Repository used while dealing with Database
    /// </summary>
    public class DbUserRepository : IUserRepository
    {
        /// <summary>
        /// Creates new user in the database, based on provided IUser object.
        /// </summary>
        /// <param name="userToCreate">IUser object to create user entity from</param>
        /// <returns>Created user entity as IUser object</returns>
        public IUser CreateUser(IUser userToCreate)
        {
            throw new NotImplementedException();
        }
    }
}
