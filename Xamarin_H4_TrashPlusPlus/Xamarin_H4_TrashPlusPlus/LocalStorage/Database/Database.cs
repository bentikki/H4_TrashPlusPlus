using SQLite;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage.Database
{
    class Database
    {
        readonly SQLiteAsyncConnection _database;

        public Database(string dbPath)
        {
            _database = new SQLiteAsyncConnection(dbPath);
            _database.CreateTableAsync<Token>().Wait();
            // _database.DeleteAllAsync<Group>().Wait();
        }

        /// <summary>
        /// Gets all tokens in the database
        /// </summary>
        /// <returns>A list of tokens</returns>
        public Task<List<Token>> GetTokenAsync()
        {
            return _database.Table<Token>().ToListAsync();
        }

        /// <summary>
        /// Saves the Token to the database
        /// </summary>
        /// <param name="token">The token to add</param>
        /// <returns>The number of rows added</returns>
        public Task<int> SaveTokenAsync(Token token)
        {
            return _database.InsertAsync(token);
        }

        /// <summary>
        /// Deletes all the Tokens from the database
        /// </summary>s
        /// <returns>The number of rows</returns>
        public Task<int> DeleteTokenAsync()
        {
            return _database.DeleteAllAsync<Token>();
        }
    }
}
