using Library_H4_TrashPlusPlus.Trash.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.BinType
{
    public static class BinTypeServiceFactory
    {
        /// <summary>
        /// ITrashService used for database interaction
        /// </summary>
        /// <returns>ITrashService used for database interaction</returns>
        public static IBinTypeService GetBinTypeServiceDb()
        {
            return new BinTypeService(new DbBinTypeRepository());
        }
        /// <summary>
        /// ITrashService used for Api interaction
        /// </summary>
        /// <returns>ITrashService used for database interaction</returns>
        public static IBinTypeService GetBinTypeServiceApi()
        {
            return new BinTypeService(new ApiBinTypeRepository(CommonSettingsFactory.GetApiPath));
        }

        /// <summary>
        /// SqlConnection with permission to create new user via SPCreateNewUser
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionAllSelect()
        {
            string username = "BinTypeAllSelect";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }
    }
}
