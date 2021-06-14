using System;
using System.Security.Cryptography;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption.Async
{
    class RSAEncryptor : IAsyncEncryption
    {
        readonly RSACryptoServiceProvider rsa;
        public RSAEncryptor()
        {
            rsa = CreateRSA();
        }
        public RSAEncryptor(int bitsAmount)
        {
            rsa = CreateRSA(bitsAmount);
        }

        private RSACryptoServiceProvider CreateRSA(int bitAmount = 2048)
        {
            return new RSACryptoServiceProvider(bitAmount);
        }

        public string Decrypt(string encryptedData)
        {
            try
            {
                byte[] decryptedData;
                //Decrypt the passed byte array and specify OAEP padding. 
                decryptedData = rsa.Decrypt(Convert.FromBase64String(encryptedData), true);

                return Encoding.UTF8.GetString(Decrypt(Convert.FromBase64String(encryptedData)));
            }
            catch
            {
                return null;
            }

        }

        public string Encrypt(string plainText)
        {
            return Convert.ToBase64String(Encrypt(Encoding.UTF8.GetBytes(plainText)));
        }

        public byte[] Encrypt(byte[] rawData)
        {
            try
            {
                byte[] encryptedData;
                encryptedData = rsa.Encrypt(rawData, true);
                return encryptedData;
            }
            catch
            {
                return null;
            }
        }

        public byte[] Decrypt(byte[] encryptedData)
        {
            try
            {
                byte[] decryptedData;
                decryptedData = rsa.Decrypt(encryptedData, true);

                return decryptedData;
            }
            catch
            {
                return null;
            }
        }

        public byte[] GetPublicKey()
        {
            return rsa.ExportCspBlob(false);
        }

        public void SetPublicKey(byte[] key)
        {
            rsa.ImportCspBlob(key);
        }
    }
}
