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

        public UseCaseLoginTests(Platform platform)
        {
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void LoginWithValidCredentials()
        {
            string mail = "casper@this.thing";
            string password = "casper12";

            app.WaitForElement(c => c.Marked("Login"));
            app.Tap(c => c.Marked("Login"));

            app.WaitForElement(c => c.Marked("Mail"));

            app.EnterText(c => c.Marked("Mail"), mail);
            app.EnterText(c => c.Marked("Password"), password);

            app.Tap(c => c.Marked("login"));

            app.Screenshot("Welcome screen.");

        }
    }
}
