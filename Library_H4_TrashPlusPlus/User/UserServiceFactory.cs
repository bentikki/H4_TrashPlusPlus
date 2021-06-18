using Library_H4_TrashPlusPlus.Users.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users
{
    public static class UserServiceFactory
    {
        /// <summary>
        /// SqlConnection with permission to create new user via SPCreateNewUser
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionCreateUser()
        {
            string username = "UserCreator";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }

        /// <summary>
        /// SqlConnection with permission to basic select.
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionBasicReader()
        {
            string username = "UserBasicReader";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }

        /// <summary>
        /// SqlConnection with permission to complex select, including View and select SP.
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionComplexSelect()
        {
            string username = "UserComplexReader";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }

        public static IUserService GetUserServiceDB()
        {
            return new UserService(new DbUserRepository());
        }

        public static IUserService GetUserServiceApi()
        {
            string apiString = "https://627d672f1894.ngrok.io/";
            return new UserService(new ApiUserRepository(apiString));
        }

    }
}
