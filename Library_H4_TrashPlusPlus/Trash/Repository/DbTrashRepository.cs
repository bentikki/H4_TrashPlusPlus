using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    class DbTrashRepository : ITrashRepository
    {
        public ITrash CreateTrash(ITrash trash)
        {
            throw new NotImplementedException();
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

            //using (var conn = UserServiceFactory.GetSqlConnectionCreateUser())
            //{
            //    conn.Open();

            //    // Execute stored procedure to create new user with hashed password.
            //    var procedure = "[SPCreateNewUser]";
            //    var values = new
            //    {
            //        @Username = CommonSettingsFactory.SyncEncrypter.Encrypt(userToCreate.Username),
            //        @Email = CommonSettingsFactory.SyncEncrypter.Encrypt(userToCreate.Mail),
            //        @Password = hashedUser.Password,
            //        @Salt = hashedUser.Salt
            //    };
            //    identity = conn.ExecuteScalar<int>(procedure, values, commandType: CommandType.StoredProcedure);
            //}
            return selectedTrash;

        }
    }
}
