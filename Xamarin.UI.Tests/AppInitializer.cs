using System;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace Xamarin.UI.Tests
{
    public class AppInitializer
    {
        public static IApp StartApp(Platform platform)
        {
            if (platform == Platform.Android)
            {
                //return ConfigureApp.Android.StartApp();
                return ConfigureApp.Android.InstalledApp("com.companyname.xamarin_h4_trashplusplus").EnableLocalScreenshots().StartApp();
            }

            return ConfigureApp.iOS.StartApp();
        }
    }
}