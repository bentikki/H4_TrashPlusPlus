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
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class LoginViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;
        private IChangePage _pageChanger;

        private string mail;
        private string password;
        private bool saveChecked;

        public bool SaveChecked
        {
            get { return saveChecked; }
            set
            {
                saveChecked = value;
                NotifyPropertyChanged("SaveChecked");
            }
        }
        public string Password
        {
            get { return password; }
            set
            {
                password = value;
                LoginFailed = false;
                NotifyPropertyChanged("Password");
                NotifyPropertyChanged("LoginFailed");
            }
        }
        public string Mail
        {
            get { return mail; }
            set
            {
                mail = value;
                LoginFailed = false;
                NotifyPropertyChanged("Mail");
                NotifyPropertyChanged("LoginFailed");
            }
        }

        public bool LoginFailed { get; set; }

        public ICommand ChangeStateCommand { get; set; }
        public ICommand ChangeToSignUpCommand { get; set; }
        public ICommand LoginCommand { get; set; }

        public LoginViewModel(IChangePage pageChanger, IUserService userService)
        {
            _userService = userService;
            _pageChanger = pageChanger;
            ChangeStateCommand = new Command(() => SaveChecked = !SaveChecked);
            ChangeToSignUpCommand = new Command(() => _pageChanger.ChangePage(new SignUpPage(_userService)));
            LoginCommand = new Command(() => LoginAsync());
        }

        public async Task LoginAsync()
        {
            AuthenticateResponse response = null;
            using (UserDialogs.Instance.Loading("Logging in..."))
            {
                response = await _userService.AuthenticateAsync(Mail, Password, "0.0.0.0");
            }
            if (response != null)
            {
                _pageChanger.ChangePage(new HomePage(_userService));
            }
            else
            {
                LoginFailed = true;
                NotifyPropertyChanged("LoginFailed");
            }

        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
