using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.UITest;

namespace Xamarin.UI.Tests
{
    [TestFixture(Platform.Android)]
    class UseCaseCreateUserTests
    {

        IApp app;
        Platform platform;

        public string testUsername;
        public string testMail;
        public string testPassword;

        public UseCaseCreateUserTests(Platform platform)
        {
            long randomNumber = new Random().Next(0, 10000);
            testUsername = "testUser" + randomNumber;
            testMail = "testUser " + randomNumber + "@mail.com";
            testPassword = "btotest1";
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void Create_WithValidCredentials_ShouldCreateUser()
        {

            this.Create(this.testUsername, this.testMail, this.testPassword, this.testPassword);
            Assert.Pass("User have been Created has been successfull");
        }


        private void Create(string username, string mail, string password, string rePassword)
        {
            this.EnterCredentials(username, mail, password, rePassword);

            app.Tap(c => c.Marked("automationCreateButton"));
            app.WaitForElement(c => c.Marked("Opretter bruger..."));

            app.WaitForElement(l => l.Marked("automationLoginButton"), timeout: TimeSpan.FromSeconds(30));
        }

        private void EnterCredentials(string username, string mail, string password, string rePassword)
        {
            // Goes to login
            app.WaitForElement(c => c.Marked("Login"));
            app.Tap(c => c.Marked("Login"));

            // Goes to Create user
            app.WaitForElement(c => c.Marked("CreateUserTextButton"));
            app.Tap(c => c.Marked("CreateUserTextButton"));

            app.WaitForElement(c => c.Marked("Opret"));

            // Inputs values
            app.EnterText(c => c.Marked("Username"), username);
            app.EnterText(c => c.Marked("Mail"), mail);
            app.EnterText(c => c.Marked("Password"), password);
            app.EnterText(c => c.Marked("RePassword"), rePassword);
            app.DismissKeyboard();
        }
    }
}
