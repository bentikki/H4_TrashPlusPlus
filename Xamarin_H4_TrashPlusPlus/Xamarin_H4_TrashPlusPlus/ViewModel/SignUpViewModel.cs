using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Validator;
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
    class SignUpViewModel : INotifyPropertyChanged
    {
        private IUserService _userService;
        private IChangePage _pageChanger;
        private string username;
        private string mail;
        private string password;
        private string rePassword;
        private bool invaild;

        private List<string> mailErrors;
        private List<string> passwordErrors;
        private List<string> usernameErrors;

        public List<string> UsernameErrors
        {
            get { return usernameErrors; }
            set
            {
                usernameErrors = value;
                NotifyPropertyChanged("UsernameErrors");
                NotifyPropertyChanged("UsernameColor");
                NotifyPropertyChanged("MailColor");
            }
        }
        public List<string> PasswordErrors
        {
            get { return passwordErrors; }
            set
            {
                passwordErrors = value;
                NotifyPropertyChanged("PasswordErrors");
                NotifyPropertyChanged("PasswordColor");
            }
        }
        public List<string> MailErrors
        {
            get { return mailErrors; }
            set
            {
                mailErrors = value;
                NotifyPropertyChanged("MailErrors");
                NotifyPropertyChanged("MailColor");
                NotifyPropertyChanged("UsernameColor");
            }
        }

        public string RePassword
        {
            get { return rePassword; }
            set
            {
                rePassword = value;
                NotifyPropertyChanged("RePassword");
                NotifyPropertyChanged("RePasswordColor");
            }
        }
        public string Password
        {
            get { return password; }
            set
            {
                password = value;
                Task.Run(() => ValidatePassword(password));
                NotifyPropertyChanged("Password");
            }
        }
        public string Mail
        {
            get { return mail; }
            set
            {
                mail = value;
                invaild = false;
                Task.Run(() => ValidateMail(Mail));
                NotifyPropertyChanged("Mail");
            }
        }
        public string Username
        {
            get { return username; }
            set
            {
                username = value;
                invaild = false;
                Task.Run(() => ValidateUsername(Username));
                NotifyPropertyChanged("Username");
            }
        }

        public Color MailColor
        {
            get
            {
                if (invaild)
                {
                    return Color.Red;
                }
                else if (mail == null || mail.Length < 2)
                {
                    return Color.Transparent;
                }
                else if (MailErrors.Count > 0)
                {
                    return Color.Red;
                }
                else
                {
                    return Color.Green;
                }
            }
            set { }
        }
        public Color UsernameColor
        {
            get
            {
                if (invaild)
                {
                    return Color.Red;
                }
                else if (Username == null || Username.Length < 2)
                {
                    return Color.Transparent;
                }
                else if (usernameErrors.Count > 0)
                {
                    return Color.Red;
                }
                else
                {
                    return Color.Green;
                }
            }
            set { }
        }
        public Color PasswordColor
        {
            get
            {
                if (Password == null || Password.Length < 2)
                {
                    return Color.Transparent;
                }
                else if (PasswordErrors.Count > 0)
                {
                    return Color.Red;
                }
                else
                {
                    return Color.Green;
                }
            }
            set { }
        }
        public Color RePasswordColor
        {
            get
            {
                if (RePassword == null || RePassword.Length < 2)
                {
                    return Color.Transparent;
                }
                else if (RePassword == Password)
                {
                    return Color.Green;
                }
                else
                {
                    return Color.Red;
                }
            }
            set { }
        }

        public ICommand ChangeToLoginCommand { get; set; }
        public ICommand CreateCommand { get; set; }

        public SignUpViewModel(IChangePage pageChanger, IUserService userService)
        {
            mailErrors = new List<string>();
            usernameErrors = new List<string>();
            passwordErrors = new List<string>();
            _userService = userService;
            _pageChanger = pageChanger;
            ChangeToLoginCommand = new Command(() => _pageChanger.ChangePage(new LoginPage(_userService)));
            CreateCommand = new Command(CreateUserAsync);
        }

        /// <summary>
        /// Creates a user if the inputs is valid
        /// </summary>
        public async void CreateUserAsync()
        {
            IUser user = null;
            using (UserDialogs.Instance.Loading("Creating account..."))
            {
                if (DefaultValidators.ValidateMail(Mail).Count == 0 && DefaultValidators.ValidatePassword(Password).Count == 0 && Password == RePassword && DefaultValidators.ValidateUsername(Username).Count == 0)
                {
                    user = await _userService.CreateUserAsync(Mail, Username, Password);
                }
            }
            if (user != null)
            {
                UserDialogs.Instance.Toast("Success",TimeSpan.FromSeconds(1));
                _pageChanger.ChangePage(new LoginPage(_userService));
            }
            else
            {
                invaild = true;
                UserDialogs.Instance.Toast("brugernavn eller mail er i brug af andre", TimeSpan.FromSeconds(2));
                NotifyPropertyChanged("MailColor");
                NotifyPropertyChanged("UsernameColor");
            }
        }

        private void ValidatePassword(string password)
        {
            PasswordErrors = DefaultValidators.ValidatePassword(password);
        }
        private void ValidateMail(string mail)
        {
            MailErrors = DefaultValidators.ValidateMail(mail);
        }
        private void ValidateUsername(string username)
        {
            UsernameErrors = DefaultValidators.ValidateUsername(username);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
