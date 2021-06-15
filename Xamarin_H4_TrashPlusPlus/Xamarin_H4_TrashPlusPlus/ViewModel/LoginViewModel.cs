using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class LoginViewModel : INotifyPropertyChanged
    {
        private string mail;
        private string password;
        private bool saveChecked;

        public bool SaveChecked
        {
            get { return saveChecked; }
            set { saveChecked = value;
                NotifyPropertyChanged("SaveChecked");
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
        
        public ICommand ChangeStateCommand { get; set; }

        public LoginViewModel()
        {
            ChangeStateCommand = new Command(() => SaveChecked = !SaveChecked);
        }


        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
