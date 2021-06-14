using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption.Sync
{
    /// <summary>
    /// Encryptes and decryptes using AES,
    /// </summary>
    internal class AESEncryptor : ISyncEncryption
    {

        private Aes aes;
        private byte[] key;
        private byte[] iv;

        /// <summary>
        /// Creates a AES with a key size on 256bit
        /// </summary>
        internal AESEncryptor()
        {
            aes = Aes.Create();
            GenerateSet(256);
        }

        /// <summary>
        /// Creates a AES with a key size as the given amount
        /// </summary>
        /// <param name="bitAmount">The key size</param>
        internal AESEncryptor(int bitAmount)
        {
            aes = Aes.Create();
            GenerateSet(bitAmount);
        }

        /// <summary>
        /// Generates the key and the iv
        /// </summary>
        /// <param name="keySize">The size of the key</param>
        private void GenerateSet(int keySize)
        {
            key = new byte[keySize / 8];

            // Generates the iv in the right size
            aes.GenerateIV();
            iv = aes.IV;

            // Generates the random key
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(key);
            }
        }

        /// <summary>
        /// Decrypes the string with utf-8 encoding format
        /// </summary>
        /// <param name="encryptedData">The encoded message in base64 format</param>
        /// <returns>The decrypted message in utf-8 encding format</returns>
        public string Decrypt(string encryptedText)
        {
            try
            {
                byte[] decryptedData;
                decryptedData = Decrypt(Convert.FromBase64String(encryptedText));

                return Encoding.UTF8.GetString(Decrypt(Convert.FromBase64String(encryptedText)));
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Decryptes the byte array
        /// </summary>
        /// <param name="encryptedData">The byte array to decrypt</param>
        /// <returns>The decrypted byte array</returns>
        public byte[] Decrypt(byte[] encryptedBytes)
        {
            byte[] rawData = new byte[encryptedBytes.Length];
            try
            {
                ICryptoTransform decryptor = aes.CreateDecryptor(key, iv);

                using (MemoryStream msDecrypt = new MemoryStream(encryptedBytes))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (BinaryReader br = new BinaryReader(csDecrypt))
                        {

                            int lenght = br.Read(rawData, 0, rawData.Length);
                            Array.Resize(ref rawData, lenght);
                        }
                    }
                }
            }
            catch { }
            return rawData;
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
        public byte[] Encrypt(byte[] rawBytes)
        {
            ICryptoTransform encryptor = aes.CreateEncryptor(key, iv);

            using (MemoryStream msEncrypt = new MemoryStream())
            {
                using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                {
                    using (BinaryWriter swEncrypt = new BinaryWriter(csEncrypt))
                    {
                        swEncrypt.Write(rawBytes);
                    }
                }
                return msEncrypt.ToArray();
            }
        }

        /// <summary>
        /// Gets the IV
        /// </summary>
        /// <returns>The iv in a byte array</returns>
        public byte[] GetIV()
        {
            return iv;
        }

        /// <summary>
        /// gets the key
        /// </summary>
        /// <returns>The key in a byte array</returns>
        public byte[] GetKey()
        {
            return key;
        }

        /// <summary>
        /// Sets the iv
        /// </summary>
        /// <param name="iv">The iv in a byte array</param>
        public void SetIV(byte[] iv)
        {
            this.iv = iv;
        }

        /// <summary>
        /// Sets the key
        /// </summary>
        /// <param name="key">The key in a byte array</param>
        public void SetKey(byte[] key)
        {
            this.key = key;
        }
    }
}
