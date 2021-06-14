using System;
using System.Collections.Generic;
using System.Text;

namespace EncryptionLibrary
{
    public interface IEncryption
    {
        string Encrypt(string rawText);
        byte[] Encrypt(byte[] rawBytes);
        string Decrypt(string encryptedText);
        byte[] Decrypt(byte[] encryptedBytes);
    }
}
