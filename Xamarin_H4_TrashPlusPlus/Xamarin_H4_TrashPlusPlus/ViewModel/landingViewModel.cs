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
    class landingViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;

        public ICommand ChangeToLoginCommand { get; set; }
        public ICommand ChangeToHomeCommand { get; set; }

        public landingViewModel(IChangePage pageChanger, IUserService userService)
        {

            ChangeToLoginCommand = new Command(() => pageChanger.ChangePage(new LoginPage(_userService)));
            ChangeToHomeCommand = new Command(() => pageChanger.ChangePage(new HomePage(_userService)));
            _userService = userService;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
