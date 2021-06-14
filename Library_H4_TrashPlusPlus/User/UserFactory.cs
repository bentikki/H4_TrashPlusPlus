using Library_H4_TrashPlusPlus.Users.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users
{
    public static class UserFactory
    {
        internal static SqlConnection GetSqlConnection()
        {
            return CommonSettingsFactory.GetDBConnectionString();
        }
        public static UserService GetUserServiceDB()
        {
            return new UserService(new DbUserRepository());
        }

    }
}
