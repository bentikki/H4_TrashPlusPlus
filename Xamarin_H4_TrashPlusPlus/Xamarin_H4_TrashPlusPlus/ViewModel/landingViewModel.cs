using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Models;
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
    class landingViewModel : BaseViewModel
    {
        private IUserService _userService;

        public ICommand ChangeToLoginCommand { get; set; }
        public ICommand ChangeToHomeCommand { get; set; }
        public ICommand LoginCommand { get; set; }
        private bool loggedIn;

        public bool InvLoggedIn
        {
            get { return loggedIn; }
            set
            {
                loggedIn = value;
                NotifyPropertyChanged("InvLoggedIn");
            }
        }


        public landingViewModel(IChangePage pageChanger, IUserService userService) : base(pageChanger)
        {
            InvLoggedIn = true;
            _userService = userService;
            ChangeToLoginCommand = new Command(() => pageChanger.PushPage(new LoginPage()));
            ChangeToHomeCommand = new Command(() => pageChanger.PushPage(new HomePage()));
            LoginCommand = new Command(() => Task.Run(Login));
        }

        private async Task Login()
        {
            if (StorageManagerFactory.GetLocalDBManager().ConaintsLocalToken())
            {
                InvLoggedIn = false;
            }
            else if (StorageManagerFactory.GetLocalDBManager().GetToken() != null)
            {
                using (UserDialogs.Instance.Loading("Logging in..."))
                {
                    AuthenticateResponse response = await _userService.RefreshTokenAsync(StorageManagerFactory.GetLocalDBManager().GetToken().token, "0.0.0.0");
                    if (response != null)
                    {
                        UserDialogs.Instance.Toast("Success", TimeSpan.FromSeconds(1));
                        StorageManagerFactory.GetLocalDBManager().DeleteToken();
                        StorageManagerFactory.GetLocalDBManager().SaveToken(StorageManagerFactory.CreateToken(response.RefreshToken, true));
                        _pageChanger.PushPage(new HomePage());
                    }
                    else
                    {
                        UserDialogs.Instance.Alert("fejled med at logge ind");
                        StorageManagerFactory.GetLocalDBManager().DeleteToken();
                    }
                }
            }
        }
    }
}
