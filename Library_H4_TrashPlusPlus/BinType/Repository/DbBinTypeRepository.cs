using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Dapper;
using Library_H4_TrashPlusPlus.BinType;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    class DbBinTypeRepository : IBinTypeRepository
    {

        /// <summary>
        /// Returns a list of all available bin types.
        /// </summary>
        /// <returns>List of available Bin Types</returns>
        public List<IBinType> GetAllBins()
        {
            List<IBinType> availableBinTypes;

            using (var conn = BinTypeServiceFactory.GetSqlConnectionAllSelect())
            {
                conn.Open();

                // Execute stored procedure to create new user with hashed password.
                var procedure = "[SPGetAllBinTypes]";
                //availableBinTypes = conn.Query<BinTypeEntity>(procedure, commandType: CommandType.StoredProcedure).AsList();
            }

            return availableBinTypes;
        }

        public IBinType GetBinById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
