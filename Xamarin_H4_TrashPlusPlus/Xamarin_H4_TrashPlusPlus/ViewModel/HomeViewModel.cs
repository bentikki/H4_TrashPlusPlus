using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Users;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.LocalStorage;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class HomeViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;
        private IChangePage _pageChanger;
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

        public HomeViewModel(IChangePage pageChanger, IUserService userService)
        {
            _pageChanger = pageChanger;
            _userService = userService;
            LoggedIn = StorageManagerFactory.GetLocalDBManager().GetToken() != null;
            LogInCommand = new Command(() => _pageChanger.ChangePage(new LoginPage(_userService)));
            LogOutCommand = new Command(LogOutAsync);
        }

        /// <summary>
        /// Logs out the user
        /// </summary>
        public async void LogOutAsync()
        {
            using (UserDialogs.Instance.Loading("Creating account..."))
            {
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

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
