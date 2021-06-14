using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using Dapper;
using Dapper.Contrib.Extensions;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    /// <summary>
    /// User Repository used while dealing with Database
    /// </summary>
    public class DbUserRepository : IUserRepository
    {
        /// <summary>
        /// Authenticates user by login credentials.
        /// Returns true if credentials is correct,
        /// returns false if creadentials are not correct.
        /// </summary>
        /// <param name="mail">Mail to validate.</param>
        /// <param name="password">Password to validate.</param>
        /// <returns>Bool based on validation success.</returns>
        public bool Authenticate(string mail, string password)
        {
            bool userAuthenticateSuccess = false;
            using (var conn = UserFactory.GetSqlConnection())
            {
                conn.Open();
                userAuthenticateSuccess = conn.ExecuteScalar<bool>("SELECT count(*) FROM User WHERE Mail = @mail", new { @mail = mail });
            }

            return userAuthenticateSuccess;
        }

        /// <summary>
        /// Creates new user in the database, based on provided IUser object.
        /// </summary>
        /// <param name="userToCreate">IUser object to create user entity from</param>
        /// <returns>Created user entity as IUser object</returns>
        public IUser CreateUser(IUser userToCreate)
        {
            IUser user = null;

            if (!this.UserIsUnique(userToCreate))
                throw new DuplicateNameException("A user with these credentials already exist.");

            using (var conn = UserFactory.GetSqlConnection())
            {
                conn.Open();

                var identity = conn.Insert((User)userToCreate);
                user = conn.Get<User>(identity);
            }

            if (user == null)
                throw new Exception("An unexpected error occured. The user could not be created successfully.");

            return user;
        }

        /// <summary>
        /// Checks if a user with thise unique paramerters already exists in the database.
        /// </summary>
        /// <param name="userToCheck">IUser object to check.</param>
        /// <returns>Bool true if the user is unique, false if the user exists.</returns>
        private bool UserIsUnique(IUser userToCheck)
        {
            bool userIsUnique;

            using (var conn = UserFactory.GetSqlConnection())
            {
                conn.Open();

                var procedure = "[SPUserEmailIsUnique]";
                var values = new { @Email = userToCheck.Mail };
                var SPreturn = conn.ExecuteScalar(procedure, values, commandType: CommandType.StoredProcedure);

                conn.Close();

                if ((int)SPreturn == 1)
                    userIsUnique = false;
                else
                    userIsUnique = true;
            }


            return userIsUnique;
        }
    }
}
