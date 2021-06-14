using System;
using System.Security.Cryptography;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption.Async
{
    /// <summary>
    /// Encryptes and decryptes using RSA,
    /// </summary>
    internal class RSAEncryptor : IAsyncEncryption
    {
        readonly RSACryptoServiceProvider rsa;

        /// <summary>
        /// Creates a rsa encryption with 2048bit key size
        /// </summary>
        internal RSAEncryptor()
        {
            rsa = CreateRSA();
        }

        /// <summary>
        /// Creates a rsa encrpytion with the given key size
        /// </summary>
        /// <param name="bitsAmount">The key size</param>
        internal RSAEncryptor(int bitsAmount)
        {
            rsa = CreateRSA(bitsAmount);
        }


        private RSACryptoServiceProvider CreateRSA(int bitAmount = 2048)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(bitAmount);
            rsa.PersistKeyInCsp = false;
            return rsa;
        }

        /// <summary>
        /// Decrypes the string with utf-8 encoding format
        /// </summary>
        /// <param name="encryptedData">The encoded message in base64 format</param>
        /// <returns>The decrypted message in utf-8 encding format</returns>
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

        /// <summary>
        /// Encryptes the string with utf-8 encoding format
        /// </summary>
        /// <param name="plainText">The Text To encrypt</param>
        /// <returns>The encryped message in base64 format</returns>
        public string Encrypt(string plainText)
        {
            return Convert.ToBase64String(Encrypt(Encoding.UTF8.GetBytes(plainText)));
        }

        /// <summary>
        /// Encrypts the byte array
        /// </summary>
        /// <param name="rawData">The byte array to encrypt</param>
        /// <returns>The encrypted byte array</returns>
        public byte[] Encrypt(byte[] rawData)
        {
            try
            {

            byte[] encryptedData;
            encryptedData = rsa.Encrypt(rawData, true);
            return encryptedData;
            }
            catch (CryptographicException)
            {
                throw new ArgumentOutOfRangeException(nameof(rawData),"the given data was to long for the given rsa key");
            }
        }

        /// <summary>
        /// Decryptes the byte array
        /// </summary>
        /// <param name="encryptedData">The byte array to decrypt</param>
        /// <returns>The decrypted byte array</returns>
        public byte[] Decrypt(byte[] encryptedData)
        {
            try
            {
                byte[] decryptedData;
                decryptedData = rsa.Decrypt(encryptedData, true);

                return decryptedData;
            }
            catch (CryptographicException)
            {
                throw new ArgumentOutOfRangeException(nameof(encryptedData), "the given data was not able to be decrypted with the given rsa key");
            }
        }

        /// <summary>
        /// Gets the public key in XML format
        /// </summary>
        /// <returns></returns>
        public string GetPublicKey()
        {
            return rsa.ToXmlString(false);
        }

        /// <summary>
        /// Gets the public key from the xmlkey
        /// </summary>
        /// <param name="key">XML public key</param>
        public void SetPublicKey(string key)
        {
            rsa.FromXmlString(key);
        }
    }
}
