using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    public interface IEncryptionService
    {
        IAsyncEncryption GenerateAsyncEncryption();
        IAsyncEncryption GenerateAsyncEncryption(byte[] key);
        ISyncEncryption GenerateSyncEncryption();
        ISyncEncryption GenerateSyncEncryption(byte[] key, byte[] iv);
    }
}
