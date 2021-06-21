using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Trash;
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
    class ScanningViewModel : INotifyPropertyChanged
    {
        private IChangePage _pageChanger;
        public ICommand BackCommand { get; set; }
        public ICommand ScanningCompletedCommand { get; set; }
        public ICommand NotAbleToScanCommand { get; set; }

        public ScanningViewModel(IChangePage pageChanger, IUserService userService)
        {
            BackCommand = new Command(() => _pageChanger.PushPage(new LoginPage()));
            ScanningCompletedCommand = new Command(LookupCodeAsync);
            NotAbleToScanCommand = new Command(() => _pageChanger.PushPage(new ScanningPage()));
        }

        /// <summary>
        /// 
        /// </summary>
        public async void LookupCodeAsync(object obj)
        {
            // Changes page 
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
