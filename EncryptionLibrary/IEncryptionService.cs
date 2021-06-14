using System;
using System.Collections.Generic;
using System.Text;

namespace EncryptionLibrary
{
    public interface IEncryptionService
    {
        IAsyncEncryption GenerateAsyncEncryption();
        IAsyncEncryption GenerateAsyncEncryption(byte[] key);
        ISyncEncryption GenerateSyncEncryption();
        ISyncEncryption GenerateSyncEncryption(byte[] key, byte[] iv);
    }
}
