using Library_H4_TrashPlusPlus.Encryption;
using Library_H4_TrashPlusPlus.Encryption.Async;
using Library_H4_TrashPlusPlus.Encryption.Sync;

namespace Library_H4_TrashPlusPlus
{
    /// <summary>
    /// Factory for Encryption classes
    /// </summary>
    public class EncryptionFactory
    {
        /// <summary>
        /// Creates a new Async Encryption with a new key
        /// </summary>
        /// <returns>Async encryption</returns>
        public static IAsyncEncryption GenerateAsyncEncryption()
        {
            return new RSAEncryptor(2048);
        }

        /// <summary>
        /// Creates a new async encryption with the public key given
        /// </summary>
        /// <param name="key">public key</param>
        /// <returns>Async encryption</returns>
        public static IAsyncEncryption GenerateAsyncEncryption(string key)
        {
            IAsyncEncryption asyncEncryption = new RSAEncryptor();
            asyncEncryption.SetPublicKey(key);
            return asyncEncryption;
        }

        /// <summary>
        /// Creates a new Sync encryption with new key
        /// </summary>
        /// <returns>Sync encryption</returns>
        public static ISyncEncryption GenerateSyncEncryption()
        {
            return new AESEncryptor();

        }

        /// <summary>
        /// Creates a new sync encryption with the geiven key and iv
        /// </summary>
        /// <param name="key">key for sync encryption</param>
        /// <param name="iv">iv for sync encryption</param>
        /// <returns>Sync encryption</returns>
        public static ISyncEncryption GenerateSyncEncryption(byte[] key, byte[] iv)
        {
            ISyncEncryption syncEncryption = new AESEncryptor();
            syncEncryption.SetKey(key);
            syncEncryption.SetIV(iv);

            return syncEncryption;
        }
    }
}
