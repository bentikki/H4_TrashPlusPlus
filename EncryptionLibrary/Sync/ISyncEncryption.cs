using System;
using System.Collections.Generic;
using System.Text;

namespace EncryptionLibrary
{
    public interface ISyncEncryption : IEncryption
    {
        byte[] GetKey();
        byte[] GetIV();
        void SetKey(byte[] key);
        void SetIV(byte[] iv);
    }
}
