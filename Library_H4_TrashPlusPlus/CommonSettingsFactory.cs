using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus
{

    public static class CommonSettingsFactory
    {
        internal static SqlConnection GetDBConnectionString()
        {
            string connectionString = @"Server=172.16.21.93;Database=TrashPlusPlus;User Id=User;Password=Pa$$w0rd;";

            SqlConnection sqlConnection = new SqlConnection(connectionString);
            return sqlConnection;
        }
    }
}
