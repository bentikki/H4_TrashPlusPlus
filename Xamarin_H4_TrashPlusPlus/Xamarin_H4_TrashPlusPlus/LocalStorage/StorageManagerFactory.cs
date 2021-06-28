using System;
using System.Collections.Generic;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    class StorageManagerFactory
    {

        private static IStorageManager _localDBStorageManager;

        /// <summary>
        /// Gets or creates the Local database manager
        /// </summary>
        /// <returns>the local database manager</returns>
        internal static IStorageManager GetLocalDBManager()
        {
            if (_localDBStorageManager == null)
            {
                _localDBStorageManager = new LocalDBManager();
            }
            return _localDBStorageManager;
        }

        internal static Token CreateToken(string tokenValue, bool localSave = false)
        {
            return new Token() { token = tokenValue, save = localSave };
        }
    }
}
