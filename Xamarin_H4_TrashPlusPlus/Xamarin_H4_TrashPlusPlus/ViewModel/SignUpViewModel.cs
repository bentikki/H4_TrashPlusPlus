using Library_H4_TrashPlusPlus.Users;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class SignUpViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;
        private string username;
        private string mail;
        private string password;
        private string rePassword;

        public string RePassword
        {
            get { return rePassword; }
            set { rePassword = value;
                NotifyPropertyChanged("RePassword");
            }
        }
        public string Password
        {
            get { return password; }
            set { password = value;
                NotifyPropertyChanged("Password");
            }
        }
        public string Mail
        {
            get { return mail; }
            set { mail = value;
                NotifyPropertyChanged("Mail");
            }
        }
        public string Username
        {
            get { return username; }
            set { username = value;
                NotifyPropertyChanged("Username");
            }
        }

        public ICommand ChangeToLoginCommand { get; set; }

        public SignUpViewModel(IChangePage pageChanger, IUserService userService)
        {
            ChangeToLoginCommand = new Command(() => pageChanger.ChangePage(new LoginPage(_userService)));
            _userService = userService;
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
