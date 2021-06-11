﻿using System;
using System.Collections.Generic;
using System.Text;
using UsersLibrary.Models;
using UsersLibrary.Repository;
using ValidatorLibrary;

namespace UsersLibrary
{
    /// <summary>
    /// Facade used while communicating with user lib
    /// </summary>
    public class UserService : IUserService
    {

        private IUserRepository userRepository;

        public UserService(IUserRepository userRepository)
        {
            this.userRepository = userRepository;
        }

        /// <summary>
        /// Creates a user with the repository
        /// </summary>
        /// <param name="mail">the users mail</param>
        /// <param name="password">the users password</param>
        /// <returns>the created user</returns>

        public IUser CreateUser(string mail, string password)   
        {
            DefaultValidators.ValidateMailException(mail);
            DefaultValidators.ValidatePasswordException(password);
            return null;
        }

        
    }
}
