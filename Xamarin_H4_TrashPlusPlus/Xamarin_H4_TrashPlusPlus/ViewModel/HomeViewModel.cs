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
    class HomeViewModel : INotifyPropertyChanged
    {
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

        public HomeViewModel(IChangePage pageChanger)
        {
            LoggedIn = true;
            LogOutCommand = new Command(() => LoggedIn = false);
            LogInCommand = new Command(() => pageChanger.ChangePage(new LoginPage()));
        }
        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
