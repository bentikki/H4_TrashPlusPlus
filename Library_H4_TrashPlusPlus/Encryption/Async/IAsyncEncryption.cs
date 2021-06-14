using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    public interface IAsyncEncryption : IEncryption
    {
        byte[] GetPublicKey();
        void SetPublicKey(byte[] key);
    }
}
