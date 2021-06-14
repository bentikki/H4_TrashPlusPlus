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
           

            // Act

            // Assert
            Assert.Pass();
        }

        [TestCase("mail test")]
        [TestCase("mail")]
        [TestCase("mail.com")]
        [TestCase("hello123rf@com'")]
        public void AsyncEncryption_SharedPublicKey_ShouldDecryptBack(string testString)
        {

            // Arrange

            // Act

            // Assert

        }

        [TestCase(",.--12/()(/(&%&%(/,3-213123.comcncvfivnsdivnsdivndsivdsnbidsbndfsibldfnbikfdnidfbndfibnfdibnfdibfdnbidfnbifdbndfibbdfbdfbfdfdbfdbbfdfdbdbssdvvdsdvsvdsbfdbfddfbbsdbdsbvsdgvsdgsdv")]
        public void AsyncEncryption_ToLongMessage_ShouldThrowException(string testString)
        {

            // Arrange
            
            // Act

            // Assert
            Assert.Throws<ArgumentException>(() => { });
        }
    }
}
