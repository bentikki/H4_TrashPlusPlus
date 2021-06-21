using Library_H4_TrashPlusPlus.Trash.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash
{
    public static class TrashServiceFactory
    {
        /// <summary>
        /// ITrashService used for database interaction
        /// </summary>
        /// <returns>ITrashService used for database interaction</returns>
        public static ITrashService GetTrashServiceDb()
        {
            return new TrashService(new DbTrashRepository());
        }

        /// <summary>
        /// SqlConnection with permission to create new trash via SPCreateTrash
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionCreateTrash()
        {
            string username = "TrashCreator";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }

        /// <summary>
        /// SqlConnection with permission to get trash via SPGetTrashByBarcode
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionGetTrash()
        {
            string username = "TrashComplexReader";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }
    }
}
