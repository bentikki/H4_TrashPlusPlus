using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    public interface IEncryption
    {
        string Encrypt(string rawText);
        byte[] Encrypt(byte[] rawBytes);
        string Decrypt(string encryptedText);
        byte[] Decrypt(byte[] encryptedBytes);
    }
}
