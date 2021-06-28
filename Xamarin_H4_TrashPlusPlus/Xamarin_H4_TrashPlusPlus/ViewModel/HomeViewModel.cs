using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.Users;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.LocalStorage;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class HomeViewModel : BaseViewModel
    {
        private IUserService _userService;
        private bool loggedIn;

        public bool LoggedIn
        {
            get { return loggedIn; }
            set { loggedIn = value;
                NotifyPropertyChanged("LoggedIn");
                NotifyPropertyChanged("LoggedOut");
            }
        }
        public bool LoggedOut
        {
            get { return !LoggedIn; }
            set { LoggedIn = !value;
                NotifyPropertyChanged("LoggedIn");
                NotifyPropertyChanged("LoggedOut");
            }
        }

        public ICommand LogOutCommand { get; set; }
        public ICommand LogInCommand { get; set; }
        public ICommand SkanCommand { get; set; }

        public HomeViewModel(IChangePage pageChanger, IUserService userService) : base(pageChanger)
        {
            _userService = userService;
            LoggedIn = StorageManagerFactory.GetLocalDBManager().GetToken() != null;
            LogInCommand = new Command(() => _pageChanger.PushPage(new LoginPage()));
            LogOutCommand = new Command(LogOutAsync);
            SkanCommand = new Command(() => _pageChanger.PushPage(new ScanningPage()));
        }

        /// <summary>
        /// Logs out the user
        /// </summary>
        public async void LogOutAsync()
        {
            using (UserDialogs.Instance.Loading("Loggger ud..."))
            {
                // Gives user the feeling of it is working
                await Task.Delay(100);
                if (await _userService.LogoutAsync(StorageManagerFactory.GetLocalDBManager().GetToken().token, "0.0.0.0"))
                {
                    StorageManagerFactory.GetLocalDBManager().DeleteToken();
                    LoggedIn = false;
                    UserDialogs.Instance.Toast("du er nu logged ud");
                }
                else
                {
                    UserDialogs.Instance.Alert("fejled med at logge ud");
                }
            }
        }
    }
}
