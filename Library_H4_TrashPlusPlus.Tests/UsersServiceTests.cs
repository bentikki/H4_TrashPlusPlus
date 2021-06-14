using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.User;
using Library_H4_TrashPlusPlus.User.Repository;

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
            string password = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => { this.userServiceDb.CreateUser(mail, password); });

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

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.CreateUser(mail, password); });
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

            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.CreateUser(mail, password); });
        }

        [Test]
        public void CreateUser_validInput_ShouldReturnUser()
        {
            Assert.Fail();
        }
    }
}