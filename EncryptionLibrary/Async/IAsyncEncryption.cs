using System;
using System.Collections.Generic;
using System.Text;

namespace EncryptionLibrary
{
    public interface IAsyncEncryption : IEncryption
    {
        byte[] GetPublicKey();
        void SetPublicKey(byte[] key);
    }
}
