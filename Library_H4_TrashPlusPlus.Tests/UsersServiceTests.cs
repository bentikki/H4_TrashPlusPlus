using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class UserServiceTests
    {
        private IUserService userServiceDb;
        private IUserService userServiceApi;

        [SetUp]
        public void Setup()
        {
            userServiceDb = new UserService(new DbUserRepository());
            userServiceApi = new UserService(new ApiUserRepository("1234"));
        }

        [Test]
        public void CreateUser_NullInput_ShouldThrowAgumentNullExeption()
        {
            // Arrange
            string mail = null;
            string username = null;
            string password = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => { this.userServiceDb.CreateUser(mail, username, password); });

        }

        [TestCase("")]
        [TestCase("mail test")]
        [TestCase("mail")]
        [TestCase("mail.com")]
        [TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        [TestCase("105 OR 1=1")]
        [TestCase("hello123rf@com'")]
        public void CreateUser_InvalidMailInput_ShouldThrowAgumenExeption(string mailInput)
        {

            // Arrange
            string mail = mailInput;
            string password = "12341231414143qwemkqwnelkqwe";
            string username = "Testusername";


            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.CreateUser(mail, username, password); });
        }

        [TestCase("")]
        [TestCase("mail test")]
        [TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        [TestCase("105 OR 1=1")]
        public void CreateUser_InvalidUsernameInput_ShouldThrowAgumenExeption(string invalidInput)
        {

            // Arrange
            string mail = "test1234@mail.com";
            string password = "12341231414143qwemkqwnelkqwe";
            string username = invalidInput;


            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.CreateUser(mail, username, password); });
        }

        [TestCase("")]
        [TestCase(" ")]
        [TestCase("password")]
        [TestCase("Password")]
        [TestCase("1234")]
        public void CreateUser_InvalidPasswordInput_ShouldThrowAgumenExeption(string passwordInput)
        {
            // Arrange
            string mail = "test@mail.com";
            string password = passwordInput;
            string username = "testUsername";

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.CreateUser(mail, username, password); });
        }

        [Test]
        public void CreateUserDB_ValidInput_ShouldReturnUser()
        {
            // Arrange
            IUser createdUser;
            long randomNumber = new Random().Next(0, 10000);

            // Act
            createdUser = this.userServiceDb.CreateUser("testmail" + randomNumber + "@mail.com", "testUsername", "12341234!weqwe");

            // Assert
            Assert.IsNotNull(createdUser);
            Assert.IsNotNull(createdUser.Mail);
            Assert.IsNotEmpty(createdUser.Mail);
        }

        [Test]
        public void CreateUserDB_InvalidInputEmailAlreadyExists_ShouldThrowArgumentError()
        {
            // Act & Assert
            Assert.Throws<DuplicateNameException>(() => { this.userServiceDb.CreateUser("testmail1@mail.com", "testUsername", "12341234!weqwe"); });

        }
    }
}