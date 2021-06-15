using NUnit.Framework;
using System;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Users.Models;
using System.Data;

namespace Library_H4_TrashPlusPlus.Tests
{
    public class UserServiceDBTests
    {
        private IUserService userServiceDb;

        [SetUp]
        public void Setup()
        {
            userServiceDb = new UserService(new DbUserRepository());
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
    
        [Test]
        public void GetUserByIdDB_ValidId_ShouldReturnIUserObject()
        {
            // Arrange
            IUser createdUser;
            IUser requestedUser;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";

            createdUser = this.userServiceDb.CreateUser(email, "testUsername", "12341234!weqwe");

            // Act
            requestedUser = this.userServiceDb.GetUserById(createdUser.Id);

            // Assert
            Assert.IsNotNull(requestedUser);
            Assert.IsNotNull(requestedUser.Id);
            Assert.AreNotEqual(0, requestedUser.Id);
            Assert.AreEqual(email, requestedUser.Mail);
        }

        [TestCase(0)]
        [TestCase(-1)]
        [TestCase(int.MinValue)]
        public void GetUserByIdDB_IllegalValue_ShouldThrowArgumentException(int idVal)
        {
            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.GetUserById(idVal); });
        }

        [Test]
        public void GetUserByIdDB_NonExistingId_ShouldReturnNull()
        {
            // Arrange
            IUser requestedUser;

            // Act
            requestedUser = this.userServiceDb.GetUserById(int.MaxValue);

            // Assert
            Assert.IsNull(requestedUser);
        }

        [Test]
        public void GetUserByLoginNameDB_ValidId_ShouldReturnIUserObject()
        {
            // Arrange
            IUser createdUser;
            IUser requestedUser;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";

            createdUser = this.userServiceDb.CreateUser(email, "testUsername", "12341234!weqwe");

            // Act
            requestedUser = this.userServiceDb.GetUserByLoginName(email);

            // Assert
            Assert.IsNotNull(requestedUser);
            Assert.IsNotNull(requestedUser.Id);
            Assert.AreNotEqual(0, requestedUser.Id);
            Assert.AreEqual(email, requestedUser.Mail);
            Assert.AreEqual(createdUser.Id, requestedUser.Id);
        }

        [TestCase("")]
        [TestCase("mail test")]
        [TestCase("mail")]
        [TestCase("mail.com")]
        [TestCase(",.--12/()(/(&%&%(/,3-213123.com")]
        [TestCase("105 OR 1=1")]
        [TestCase("hello123rf@com'")]
        public void GetUserByLoginNameDB_IllegalValue_ShouldThrowArgumentException(string loginNameVal)
        {
            // Act & Assert
            Assert.Throws<ArgumentException>(() => { this.userServiceDb.GetUserByLoginName(loginNameVal); });
        }

        [Test]
        public void GetUserByLoginNameDB_NonExistingLoginName_ShouldReturnNull()
        {
            // Arrange
            IUser requestedUser;
            long randomNumber = int.MaxValue;
            string email = "testmail" + randomNumber + "@mail.com";

            // Act
            requestedUser = this.userServiceDb.GetUserByLoginName(email);

            // Assert
            Assert.IsNull(requestedUser);
        }

        [Test]
        public void Authenticate_ValidLogin_ShouldReturnAuthenticateResponseObject()
        {
            // Arrange
            AuthenticateResponse authenticateResponse;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";
            string password = "testpassword" + randomNumber;

            this.userServiceDb.CreateUser(email, "testUsername", password);

            // Act
            authenticateResponse = this.userServiceDb.Authenticate(email, password, "0.0.0.0");

            // Assert
            Assert.IsNotNull(authenticateResponse);
            Assert.IsNotNull(authenticateResponse.UserObject);
            Assert.IsNotNull(authenticateResponse.JwtToken);
            Assert.IsNotNull(authenticateResponse.RefreshToken);
        }

        [Test]
        public void Authenticate_InvalidLogin_ShouldReturnNull()
        {
            // Arrange
            AuthenticateResponse authenticateResponse;
            long randomNumber = new Random().Next(0, 10000);
            string email = "testmail" + randomNumber + "@mail.com";
            string password = "testpassword" + randomNumber;

            this.userServiceDb.CreateUser(email, "testUsername", password);

            // Act
            authenticateResponse = this.userServiceDb.Authenticate(email, password+"1", "0.0.0.0");

            // Assert
            Assert.IsNull(authenticateResponse);
            //Assert.IsNull(authenticateResponse.UserObject);
            //Assert.IsNull(authenticateResponse.JwtToken);
            //Assert.IsNull(authenticateResponse.RefreshToken);
        }
    }
}