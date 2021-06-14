using Library_H4_TrashPlusPlus.Encryption;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Tests
{
    class EncryptionTests
    {
        [SetUp]
        public void Setup()
        {

        }

        [TestCase("mail test")]
        [TestCase("mail.com")]
        [TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        [TestCase("hello123rf@com'")]
        public void AsyncEncryption_NewEncryptor_ShouldDecryptBack(string testString)
        {
            // Arrange
            IAsyncEncryption asyncEncryption = EncryptionFactory.GenerateAsyncEncryption();

            // Act
            string encrypted = asyncEncryption.Encrypt(testString);

            // Assert
            Assert.True(testString == asyncEncryption.Decrypt(encrypted));
        }

        [TestCase("mail test")]
        [TestCase("mail")]
        [TestCase("mail.com")]
        [TestCase("hello123rf@com'")]
        public void AsyncEncryption_SharedPublicKey_ShouldDecryptBack(string testString)
        {
            // Arrange
            IAsyncEncryption asyncEncryption = EncryptionFactory.GenerateAsyncEncryption();
            IAsyncEncryption asyncEncryption1 = EncryptionFactory.GenerateAsyncEncryption(asyncEncryption.GetPublicKey());

            // Act
            string encrypted = asyncEncryption1.Encrypt(testString);
            string newTestString = asyncEncryption.Decrypt(encrypted);
            // Assert
            Assert.True(testString == newTestString);

        }

        [TestCase(255)]
        public void AsyncEncryption_ToLongMessage_ShouldThrowException(int stringLength)
        {

            // Arrange
            string testString = "";
            for (int i = 0; i < stringLength; i++)
            {
                testString += "a";
            }
            IAsyncEncryption asyncEncryption = EncryptionFactory.GenerateAsyncEncryption();

            // Act & Assert
            Assert.Throws<ArgumentOutOfRangeException>(() => { string encrypted = asyncEncryption.Encrypt(testString); });
        }


        [TestCase("mail test")]
        [TestCase("mail.com")]
        [TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        [TestCase("hello123rf@com'")]
        public void SyncEncryption_NewEncryptor_ShouldDecryptBack(string testString)
        {
            // Arrange
            ISyncEncryption syncEncryption = EncryptionFactory.GenerateSyncEncryption();

            // Act
            string encrypted = syncEncryption.Encrypt(testString);

            // Assert
            Assert.True(testString == syncEncryption.Decrypt(encrypted));
        }

        [TestCase("mail test")]
        [TestCase("mail")]
        [TestCase("mail.com")]
        [TestCase("hello123rf@com'")]
        public void SyncEncryption_SharedPublicKey_ShouldDecryptBack(string testString)
        {
            // Arrange
            ISyncEncryption syncEncryption = EncryptionFactory.GenerateSyncEncryption();
            ISyncEncryption syncEncryption1 = EncryptionFactory.GenerateSyncEncryption(syncEncryption.GetKey(), syncEncryption.GetIV());

            // Act
            string encrypted = syncEncryption1.Encrypt(testString);
            string newTestString = syncEncryption.Decrypt(encrypted);
            // Assert
            Assert.True(testString == newTestString);
        }
    }
}
