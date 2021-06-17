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

        //[TestCase("")]
        //[TestCase("mail test")]
        //[TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        //[TestCase("105 OR 1=1")]
        //public void CreateUser_InvalidUsernameInput_ShouldThrowAgumenExeption(string invalidInput)
        //{

        //    // Arrange
        //    string mail = "test1234@mail.com";
        //    string password = "12341231414143qwemkqwnelkqwe";
        //    string username = invalidInput;


        //    // Act & Assert
        //    Assert.Throws<ArgumentException>(() => { this.userServiceApi.CreateUser(mail, username, password); });
        //}

        //[TestCase("")]
        //[TestCase(" ")]
        //[TestCase("password")]
        //[TestCase("Password")]
        //[TestCase("1234")]
        //public void CreateUser_InvalidPasswordInput_ShouldThrowAgumenExeption(string passwordInput)
        //{
        //    // Arrange
        //    string mail = "test@mail.com";
        //    string password = passwordInput;
        //    string username = "testUsername";

        //    // Act & Assert
        //    Assert.Throws<ArgumentException>(() => { this.userServiceApi.CreateUser(mail, username, password); });
        //}

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

        //[Test]
        //public void CreateUserDB_InvalidInputEmailAlreadyExists_ShouldThrowArgumentError()
        //{
        //    // Act & Assert
        //    Assert.Throws<DuplicateNameException>(() => { this.userServiceApi.CreateUser("testmail1@mail.com", "testUsername", "12341234!weqwe"); });

        //}

        [Test]
        public void GetUserByIdDB_ValidId_ShouldReturnIUserObject()
        {
            // Arrange
            IUser createdUser;
            IUser requestedUser;
            AuthenticateResponse authenticateResponse;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";
            string password = "testpassword" + randomNumber;

            createdUser = this.userServiceApi.CreateUser(email, "testUsername", password);

            // Act
            authenticateResponse = this.userServiceApi.Authenticate(email, password, "0.0.0.0");

            requestedUser = this.userServiceApi.GetUserById(createdUser.Id);

            // Assert
            Assert.IsNotNull(requestedUser);
            Assert.IsNotNull(requestedUser.Id);
            Assert.AreNotEqual(0, requestedUser.Id);
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

        //[Test]
        //public void Authenticate_InvalidLogin_ShouldReturnNull()
        //{
        //    // Arrange
        //    AuthenticateResponse authenticateResponse;
        //    long randomNumber = new Random().Next(0, 10000);
        //    string email = "testmail" + randomNumber + "@mail.com";
        //    string password = "testpassword" + randomNumber;

        //    this.userServiceApi.CreateUser(email, "testUsername", password);

        //    // Act
        //    authenticateResponse = this.userServiceApi.Authenticate(email, password+"1", "0.0.0.0");

        //    // Assert
        //    Assert.IsNull(authenticateResponse);
        //}

        //[Test]
        //public void Logout_Valid_ShouldReturnTrue()
        //{
        //    // Arrange
        //    AuthenticateResponse authenticateResponse;
        //    long randomNumber = new Random().Next(0, 10000);
        //    string email = "testmail" + randomNumber + "@mail.com";
        //    string password = "testpassword" + randomNumber;

        //    this.userServiceApi.CreateUser(email, "testUsername", password);
        //    authenticateResponse = this.userServiceApi.Authenticate(email, password, "0.0.0.0");

        //    // Act
        //    bool logoutSuccess = this.userServiceApi.Logout(authenticateResponse.RefreshToken, "0.0.0.0");

        //    // Assert
        //    Assert.IsNotNull(authenticateResponse);
        //    Assert.IsNotNull(authenticateResponse.UserObject);
        //    Assert.IsNotNull(authenticateResponse.JwtToken);
        //    Assert.IsNotNull(authenticateResponse.RefreshToken);
        //    Assert.IsTrue(logoutSuccess);
        //}

        //[TestCase("")]
        //[TestCase("Token with space")]
        //public void Logout_InvalidToken_ShouldThrowArgumentException(string token)
        //{
        //    // Act & Assert
        //    Assert.Throws<ArgumentException>(() => { this.userServiceApi.Logout(token, "0.0.0.0"); });
        //}

        //[TestCase(null)]
        //public void Logout_InvalidToken_ShouldThrowArgumentNullException(string token)
        //{
        //    // Act & Assert
        //    Assert.Throws<ArgumentNullException>(() => { this.userServiceApi.Logout(token, "0.0.0.0"); });
        //}

    }
}