using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Validator;

namespace Library_H4_TrashPlusPlus.Users
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
        public IUser CreateUser(string mail, string username, string password)   
        {
            // Run validation
            DefaultValidators.ValidateMailException(mail);
            DefaultValidators.ValidatePasswordException(password);
            DefaultValidators.ValidateUsernameException(username);

            // Create user object
            IUser user = new User(mail, username, password);

            try
            {
                // Create use via repository.
                user = this.userRepository.CreateUser(user);
            }
            catch(SqlException e)
            {
                // An error occured while creating via Database.
                throw e;
            }
            catch(ArgumentException e)
            {
                // An error occured while created via Database.
                throw e;
            }
            catch (Exception e)
            {
                // An unkown error occured.
                throw e;
            }

            return user;
        }

        /// <summary>
        /// Authenticate user by login credentials.
        /// Returns IUser object if successfull.
        /// </summary>
        /// <param name="email">Email to be used for quthentication.</param>
        /// <param name="password">Password to be used for quthentication.</param>
        /// <returns>IUser Object, Null if IUser could not be authenticated.</returns>
        public IUser Authenticate(string mail, string password)
        {
            // Run validation
            DefaultValidators.ValidateMailException(mail);
            DefaultValidators.ValidatePasswordException(password);

            IUser user = this.userRepository.Authenticate(mail, password);

        }

        //            var user = _context.Users.SingleOrDefault(x => x.Username == model.Username && x.Password == model.Password);

        //            // return null if user not found
        //            if (user == null) return null;

        //            // authentication successful so generate jwt and refresh tokens
        //            var jwtToken = generateJwtToken(user);
        //            var refreshToken = generateRefreshToken(ipAddress);

        //            // save refresh token
        //            user.RefreshTokens.Add(refreshToken);
        //            _context.Update(user);
        //            _context.SaveChanges();

        //            return new AuthenticateResponse(user, jwtToken, refreshToken.Token);





        /// <summary>
        /// Creates a user with the repository async.
        /// </summary>
        /// <param name="mail">the users mail</param>
        /// <param name="password">the users password</param>
        /// <returns>the created user</returns>
        public async Task<IUser> CreateUserAsync(string mail, string username, string password)
        {
            var task = Task.Run(() => this.CreateUser(mail, username, password));
            return await task;
        }

    }
}
