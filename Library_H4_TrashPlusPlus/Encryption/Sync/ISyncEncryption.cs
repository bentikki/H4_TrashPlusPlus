using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    public interface ISyncEncryption : IEncryption
    {
        byte[] GetKey();
        byte[] GetIV();
        void SetKey(byte[] key);
        void SetIV(byte[] iv);
    }
}
