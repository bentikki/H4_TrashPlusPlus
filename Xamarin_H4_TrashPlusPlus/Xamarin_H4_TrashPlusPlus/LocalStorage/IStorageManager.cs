using Xamarin_H4_TrashPlusPlus.LocalStorage.Database;

namespace Xamarin_H4_TrashPlusPlus.LocalStorage
{
    /// <summary>
    /// Manager for storage
    /// </summary>
    interface IStorageManager
    {
        void SaveToken(Token token);
        void DeleteToken();
        bool ContainsLocalToken();
        Token GetToken();
    }
}
