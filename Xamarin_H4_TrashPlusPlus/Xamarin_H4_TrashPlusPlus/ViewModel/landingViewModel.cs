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
    class landingViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;
        private IChangePage _pageChanger;

        public ICommand ChangeToLoginCommand { get; set; }
        public ICommand ChangeToHomeCommand { get; set; }

        public landingViewModel(IChangePage pageChanger, IUserService userService)
        {

            _userService = userService;
            _pageChanger = pageChanger;
            ChangeToLoginCommand = new Command(() => pageChanger.PushPage(new LoginPage()));
            ChangeToHomeCommand = new Command(() => pageChanger.PushPage(new HomePage()));
            Task.Run(Login);
        }

        private async Task Login()
        {
            if (StorageManagerFactory.GetLocalDBManager().GetToken() != null)
            {
                using (UserDialogs.Instance.Loading("Logging in..."))
                {
                    AuthenticateResponse response = await _userService.RefreshTokenAsync(StorageManagerFactory.GetLocalDBManager().GetToken().token, "0.0.0.0");
                    if (response != null)
                    {
                        UserDialogs.Instance.Toast("Success", TimeSpan.FromSeconds(1));
                        StorageManagerFactory.GetLocalDBManager().DeleteToken();
                        StorageManagerFactory.GetLocalDBManager().SaveToken(StorageManagerFactory.CreateToken(response.RefreshToken));
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

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
