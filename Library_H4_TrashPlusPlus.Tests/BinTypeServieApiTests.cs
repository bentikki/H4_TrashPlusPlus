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

    }
}