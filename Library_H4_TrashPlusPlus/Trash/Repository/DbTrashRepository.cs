using Dapper;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    class DbTrashRepository : ITrashRepository
    {
        /// <summary>
        /// Creates trash in the database, based on given object.
        /// </summary>
        /// <param name="trash">Trash to create.</param>
        /// <returns>Created trash entity.</returns>
        public ITrash CreateTrash(CreateTrashRequest createTrashRequest)
        {
            ITrash createdTrash;

            using (var conn = TrashServiceFactory.GetSqlConnectionCreateTrash())
            {
                conn.Open();

                // Execute stored procedure to create new user with hashed password.
                var procedure = "[SPCreateTrash]";
                var values = new
                {
                    @Barcode = createTrashRequest.Barcode,
                    @BinTypeID = createTrashRequest.BinTypeID,
                    @UserID = createTrashRequest.UserID
                };
                createdTrash = conn.QuerySingle<TrashEntity>(procedure, values, commandType: CommandType.StoredProcedure);
            }

            return createdTrash;
        }

        /// <summary>
        /// Returns ITrash object matching the given barcore stirng.
        /// Returns null if no such obejct exists in the database.
        /// </summary>
        /// <param name="barcode">Barcode of requested trash entity.</param>
        /// <returns>ITrash object</returns>
        public ITrash GetTrashByBarcode(string barcode)
        {
            ITrash selectedTrash = null;

            using (var conn = TrashServiceFactory.GetSqlConnectionGetTrash())
            {
                conn.Open();

                // Execute stored procedure to create new user with hashed password.
                var procedure = "[SPGetTrashByBarcode]";
                var values = new
                {
                    @Barcode = barcode,
                };
                selectedTrash = conn.QuerySingleOrDefault<TrashEntity>(procedure, values, commandType: CommandType.StoredProcedure);
            }
            return selectedTrash;

        }
    }
}
