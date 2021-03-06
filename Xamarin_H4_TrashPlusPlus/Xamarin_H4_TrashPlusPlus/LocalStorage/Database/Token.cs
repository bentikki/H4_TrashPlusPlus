using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage.Database
{
    /// <summary>
    /// Token Class for the database
    /// </summary>
    class Token
    {
        [PrimaryKey]
        public string token { get; set; }
        public bool save { get; set; }
    }
}
