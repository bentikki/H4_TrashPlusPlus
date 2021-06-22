using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using System.Collections.Generic;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class BinTypeServiceApiTests
    {
        private IBinTypeService binTypeServiceApi;

        [SetUp]
        public void Setup()
        {
            binTypeServiceApi = BinTypeServiceFactory.GetBinTypeServiceApi();
        }

        [Test]
        public void GetAllBinTypes_Valid_ShouldReturnIBinTypeList()
        {
            // Arrange
            List<IBinType> binTypeReturned;

            // Act
            binTypeReturned = this.binTypeServiceApi.GetAllBinTypes();

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
            Assert.Throws<ArgumentException>(() => { this.binTypeServiceApi.GetBinTypeById(id); });
        }

        [Test]
        public void GetBinTypeById_ValidId_ShouldReturnIBinType()
        {
            // Arrange
            IBinType binType;
            int id = 3;

            // Act
            binType = this.binTypeServiceApi.GetBinTypeById(id);

            // Assert
            Assert.IsNotNull(binType);
            Assert.IsNotNull(binType.Id);
        }

    }
}