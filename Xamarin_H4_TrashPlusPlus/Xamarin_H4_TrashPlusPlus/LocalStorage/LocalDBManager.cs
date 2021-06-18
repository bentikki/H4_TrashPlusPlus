using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    class LocalDBManager : IStorageManager
    {
        private Database.Database database;
        public LocalDBManager()
        {
            database = new Database.Database(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "TrashToken.db3"));
        }


        /// <summary>
        /// Deletes all the tokens
        /// </summary>
        public void DeleteToken()
        {
            database.DeleteGroupAsync().Wait();
        }

        /// <summary>
        /// Gets the token
        /// </summary>
        /// <returns>The first token</returns>
        public Token GetToken()
        {
            List<Token> tokens = database.GetTokenAsync().Result;
            if (tokens.Count > 0)
            {
                return tokens[0];
            }
            return null;
        }

        /// <summary>
        /// saves the token
        /// </summary>
        /// <param name="token">The token to save</param>
        public void SaveToken(Token token)
        {
            database.SaveTokenAsync(token).Wait();
        }
    }
}
