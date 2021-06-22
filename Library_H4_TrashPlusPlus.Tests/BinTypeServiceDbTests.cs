using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class BinTypeServiceDbTests
    {
        private IBinTypeService binTypeServiceDB;

        [SetUp]
        public void Setup()
        {
            binTypeServiceDB = BinTypeServiceFactory.GetBinTypeServiceDb();
        }

        [Test]
        public void GetAllBinTypes_Valid_ShouldReturnIBinTypeList()
        {
            // Arrange
            List<IBinType> binTypeReturned;

            // Act
            binTypeReturned = this.binTypeServiceDB.GetAllBinTypes();

            // Assert
            Assert.IsNotNull(binTypeReturned);
            Assert.IsNotEmpty(binTypeReturned);
        }

        [TestCase(0)]
        [TestCase(int.MinValue)]
        [TestCase(-123)]
        public void GetBinTypeById_InvalidIdValue_ShouldThrowAgumentExeption(int idValue)
        {
            // Arrange
            int id = idValue;

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.binTypeServiceDB.GetBinTypeById(id); });
        }

        [Test]
        public void GetBinTypeById_ValidId_ShouldReturnIBinType()
        {
            // Arrange
            IBinType binType;
            int id = 3;

            // Act
            binType = this.binTypeServiceDB.GetBinTypeById(id);

            // Assert
            Assert.IsNotNull(binType);
            Assert.IsNotNull(binType.Id);
        }

    }
}