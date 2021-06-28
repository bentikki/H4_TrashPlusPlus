using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    class LocalDBManager : IStorageManager
    {
        private Token _token;
        private Database.Database _database;
        public LocalDBManager()
        {
            _database = new Database.Database(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "TrashToken.db3"));
        }

        /// <summary>
        /// looks if there is a token saved
        /// </summary>
        /// <returns>if there is a token</returns>
        public bool ConaintsLocalToken()
        {
            return _token != null;
        }


        /// <summary>
        /// Deletes all the tokens
        /// </summary>
        public void DeleteToken()
        {
            _database.DeleteTokenAsync().Wait();
            _token = null;
        }

        /// <summary>
        /// Gets the token
        /// </summary>
        /// <returns>The first token</returns>
        public Token GetToken()
        {
            if(_token == null)
            {
                List<Token> tokens = _database.GetTokenAsync().Result;
                if (tokens.Count > 0)
                {
                    _token = tokens[0];
                    return tokens[0];
                }
            }
            else
            {
                return _token;
            }
            return null;
        }

        /// <summary>
        /// saves the token
        /// </summary>
        /// <param name="token">The token to save</param>
        public void SaveToken(Token token)
        {
            if (token.save)
            {
                _database.SaveTokenAsync(token).Wait();
            }
            else
            {
                this._token = token;
            }
        }
    }
}
