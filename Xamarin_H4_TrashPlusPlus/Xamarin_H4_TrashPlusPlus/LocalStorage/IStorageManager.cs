using System;
using System.Collections.Generic;
using System.Text;
using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    interface IStorageManager
    {
        void SaveToken(Token token);
        void DeleteToken();
        Token GetToken();
    }
}
