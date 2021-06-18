using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;
using Library_H4_TrashPlusPlus.Trash;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class TrashServiceTests
    {
        private ITrashService trashServiceDB;

        [SetUp]
        public void Setup()
        {
            trashServiceDB = TrashServiceFactory.GetTrashServiceDb();
        }

        [Test]
        public void GetTrashByBarcode_NullInput_ShouldThrowAgumentNullExeption()
        {
            // Arrange
            string barcode = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => { this.trashServiceDB.GetTrashByBarcode(barcode); });
        }

        [TestCase("")]
        [TestCase("123 qweqw e")]
        public void GetTrashByBarcode_InvalidBarcodeValue_ShouldThrowAgumentExeption(string barcodeValue)
        {
            // Arrange
            string barcode = barcodeValue;

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.trashServiceDB.GetTrashByBarcode(barcode); });
        }

        [Test]
        public void GetTrashByBarcode_NonRegisteredBarcode_ShouldReturnNull()
        {
            // Arrange
            // Act
            // Assert
            Assert.Fail();
        }

        [Test]
        public void GetTrashByBarcode_ValidBarcode_ShouldReturnITrash()
        {
            // Arrange
            // Act
            // Assert
            Assert.Fail();
        }

    }
}