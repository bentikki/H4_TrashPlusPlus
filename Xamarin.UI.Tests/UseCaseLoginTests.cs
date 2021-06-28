using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries; 

namespace Xamarin.UI.Tests
{
    [TestFixture(Platform.Android)]
    //[TestFixture(Platform.iOS)]
    public class UseCaseLoginTests
    {
        IApp app;
        Platform platform;

        public string testUsername;
        public string testPassword;

        public UseCaseLoginTests(Platform platform)
        {
            testUsername = "btotestuser@mail.com";
            testPassword = "btotest1";
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void Login_WithValidCredentials_ShouldLogUserIn()
        {

            this.Login(this.testUsername, this.testPassword);
            Assert.Pass("Login has been successfull");
        }

        [TestCase("casper@this.thing", "casper12312312318568678678")]
        [TestCase("casper@this.thing", "")]
        [TestCase("", "casper12312312318568678678")]
        public void Login_WithInvalidCredentials_ShouldRefuseLoginAndShowErrorBorder(string mailValue, string passwordValue)
        {
            this.EnterCredentials(mailValue, passwordValue);

            app.Tap(c => c.Marked("automationLoginButton"));
            app.WaitForNoElement(c => c.Marked("Logger ind..."));

            app.WaitForElement(l => l.Marked("automationMailInput"), timeout: TimeSpan.FromSeconds(10));

            Assert.Pass("Login was successfully rejected");
        }


        [Test]
        public void LoginAndLogout_WithValidCredentials_ShouldLogUserIn()
        {
            Login(this.testUsername,this.testPassword);

            app.WaitForElement(l => l.Marked("automationGoToHome"), timeout: TimeSpan.FromSeconds(10));
            app.Tap(c => c.Marked("automationGoToHome"));

            app.WaitForElement(l => l.Marked("automationLogOutButton"), timeout: TimeSpan.FromSeconds(5));
            app.Tap(c => c.Marked("automationLogOutButton"));

            app.WaitForElement(l => l.Marked("automationLogInButton"), timeout: TimeSpan.FromSeconds(5));

            Assert.Pass("Login and logout has been successfull");
        }

        [Test]
        public void LoginWithRememberMe_WithValidCredentials_ShouldLogUserIn()
        {
            this.Login(this.testUsername, this.testPassword, true);
            app.Tap(c => c.Marked("automationGoToHome"));

            app.WaitForElement(l => l.Marked("automationLogOutButton"), timeout: TimeSpan.FromSeconds(5));
            app.Tap(c => c.Marked("automationLogOutButton"));

            app.WaitForElement(l => l.Marked("automationLogInButton"), timeout: TimeSpan.FromSeconds(5));

            Assert.Pass("Login has been successfull");
        }

        private void Login(string username, string password, bool rememberMe = false)
        {
            this.EnterCredentials(username, password, rememberMe);

            app.Tap(c => c.Marked("automationLoginButton"));
            app.WaitForElement(c => c.Marked("Logger ind..."));

            app.WaitForElement(l => l.Marked("automationGoToHome"), timeout: TimeSpan.FromSeconds(10));
        }

        private void EnterCredentials(string username, string password, bool rememberMe = false)
        {
            app.WaitForElement(c => c.Marked("Login"));
            app.Tap(c => c.Marked("Login"));

            app.WaitForElement(c => c.Marked("Mail"));

            app.EnterText(c => c.Marked("Mail"), username);
            app.EnterText(c => c.Marked("Password"), password);
            app.DismissKeyboard();

            if (rememberMe)
            {
                app.WaitForElement(l => l.Marked("automationRememberLogin"), timeout: TimeSpan.FromSeconds(10));
                app.Tap(c => c.Marked("automationRememberLogin"));
            }
        }
    }
}
