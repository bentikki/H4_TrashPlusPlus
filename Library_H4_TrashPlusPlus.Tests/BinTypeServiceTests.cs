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
    public class BinTypeServiceTests
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


    }
}