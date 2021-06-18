using System;
using System.Collections.Generic;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    class StorageManagerFactory
    {

        private static IStorageManager localDBStorageManager;

        /// <summary>
        /// Gets or creates the Local database manager
        /// </summary>
        /// <returns>the local database manager</returns>
        internal static IStorageManager GetLocalDBManager()
        {
            if (localDBStorageManager == null)
            {
                localDBStorageManager = new LocalDBManager();
            }
            return localDBStorageManager;
        }

        internal static Token CreateToken(string tokenValue)
        {
            return new Token() { token = tokenValue };
        }
    }
}
