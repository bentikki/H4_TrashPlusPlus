using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class UserServiceApiTests
    {
        private IUserService userServiceApi;

        [SetUp]
        public void Setup()
        {
            userServiceApi = UserServiceFactory.GetUserServiceApi();
        }

        [Test]
        public void CreateUser_NullInput_ShouldThrowAgumentNullExeption()
        {
            // Arrange
            string mail = null;
            string username = null;
            string password = null;

            // Act & Assert
            Assert.Throws<ArgumentNullException>(() => { this.userServiceApi.CreateUser(mail, username, password); });

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
            Assert.Throws<ArgumentException>(() => { this.userServiceApi.CreateUser(mail, username, password); });
        }

        [Test]
        public void CreateUserDB_ValidInput_ShouldReturnUser()
        {
            // Arrange
            IUser createdUser;
            long randomNumber = new Random().Next(0, 10000);

            // Act
            createdUser = this.userServiceApi.CreateUser("testmail" + randomNumber + "@mail.com", "testUsername", "12341234!weqwe");

            // Assert
            Assert.IsNotNull(createdUser);
            Assert.IsNotNull(createdUser.Mail);
            Assert.IsNotEmpty(createdUser.Mail);
        }

        [Test]
        public void Authenticate_ValidLogin_ShouldReturnAuthenticateResponseObject()
        {
            // Arrange
            AuthenticateResponse authenticateResponse;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";
            string password = "testpassword" + randomNumber;

            this.userServiceApi.CreateUser(email, "testUsername", password);

            // Act
            authenticateResponse = this.userServiceApi.Authenticate(email, password, "0.0.0.0");

            // Assert
            Assert.IsNotNull(authenticateResponse);
            Assert.IsNotNull(authenticateResponse.UserObject);
            Assert.IsNotNull(authenticateResponse.JwtToken);
            Assert.IsNotNull(authenticateResponse.RefreshToken);
        }

        [Test]
        public void Authenticate_InvalidLogin_ReturnNull()
        {
            // Arrange
            AuthenticateResponse authenticateResponse;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmaildasdasdsa" + randomNumber + "@mail.com";
            string password = "testxccccccccpassword" + randomNumber;

            // Act
            authenticateResponse = this.userServiceApi.Authenticate(email, password, "0.0.0.0");

            // Assert
            Assert.IsNull(authenticateResponse);
        }
    }
}