using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.Trash.Models;

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
            ITrash returnedTrash;
            string barcode = new Random().Next(10000, int.MaxValue).ToString();

            // Act
            returnedTrash = this.trashServiceDB.GetTrashByBarcode(barcode);

            // Assert
            Assert.IsNull(returnedTrash);
        }

        [Test]
        public void GetTrashByBarcode_ValidBarcode_ShouldReturnITrash()
        {
            // Arrange
            ITrash returnedTrash;
            string barcode = new Random().Next(10000, int.MaxValue).ToString();
            int binTypeID = new Random().Next(2, 11);

            CreateTrashRequest request = new CreateTrashRequest(barcode, binTypeID, 235);
            ITrash createdTrash = this.trashServiceDB.CreateTrash(request);

            // Act
            returnedTrash = this.trashServiceDB.GetTrashByBarcode(barcode);

            // Assert
            Assert.IsNotNull(returnedTrash);
            Assert.IsNotNull(returnedTrash.Id);
        }

        [TestCase("")]
        [TestCase("123 qweqw e")]
        public void CreateTrash_InvalidBarcode_ShouldThrowArgumnetExeception(string barcodeValue)
        {
            // Arrange
            string barcode = barcodeValue;
            int binTypeID = 2;

            CreateTrashRequest request = new CreateTrashRequest(barcode, binTypeID);

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.trashServiceDB.CreateTrash(request); });
        }

        [TestCase(0)]
        [TestCase(-1296)]
        public void CreateTrash_InvalidBinType_ShouldThrowArgumnetExeception(int binTypeValue)
        {
            // Arrange
            string barcode = new Random().Next(10000, int.MaxValue).ToString();
            int binTypeID = binTypeValue;

            CreateTrashRequest request = new CreateTrashRequest(barcode, binTypeID);

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.trashServiceDB.CreateTrash(request); });
        }

        [Test]
        public void CreateTrash_NullBarcode_ShouldThrowArgumnetNullExeception()
        {
            // Arrange
            string barcode = null;
            int binTypeID = new Random().Next(2, 11);

            CreateTrashRequest request = new CreateTrashRequest(barcode, binTypeID);

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => { this.trashServiceDB.CreateTrash(request); });
        }

        [Test]
        public void CreateTrash_Valid_ShouldReturnITrashObject()
        {
            // Arrange
            string barcode = new Random().Next(10000, int.MaxValue).ToString();
            int binTypeID = new Random().Next(2, 11);

            CreateTrashRequest request = new CreateTrashRequest(barcode, binTypeID, 235);

            // Act
            ITrash trash = this.trashServiceDB.CreateTrash(request);

            // Assert
            Assert.IsNotNull(trash);
            Assert.IsNotNull(trash.Barcode);
            Assert.AreNotEqual(0, trash.Id);
        }
    }
}