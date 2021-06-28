using System;
using System.Collections.Generic;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    /// <summary>
    /// Factory for the storageManager
    /// </summary>
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

        /// <summary>
        /// Creates a token
        /// </summary>
        /// <param name="tokenValue">The value of the token</param>
        /// <param name="localSave">If it should be saved in localdb</param>
        /// <returns></returns>
        internal static Token CreateToken(string tokenValue, bool localSave = false)
        {
            return new Token() { token = tokenValue, save = localSave };
        }
    }
}
