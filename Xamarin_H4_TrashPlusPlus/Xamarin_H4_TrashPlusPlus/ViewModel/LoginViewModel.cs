using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Validator;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.LocalStorage;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    /// <summary>
    /// The view model for login page
    /// </summary>
    class LoginViewModel : BaseViewModel
    {
        private IUserService _userService;

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
                if (password.Length > 2)
                {
                    LoginFailed = false;
                    NotifyPropertyChanged("LoginEnable");
                    NotifyPropertyChanged("InputColor");
                }
                NotifyPropertyChanged("Password");
            }
        }
        public string Mail
        {
            get { return mail; }
            set
            {
                mail = value;
                if (mail.Length > 2)
                {
                    LoginFailed = false;
                    NotifyPropertyChanged("LoginEnable");
                    NotifyPropertyChanged("InputColor");
                }
                NotifyPropertyChanged("Mail");
            }
        }


        public bool LoginFailed { get; set; }
        public bool LoginEnable { get => !LoginFailed; set => LoginFailed = !value; }

        public Color InputColor
        {
            get
            {
                if (LoginFailed)
                {
                    return Color.Red;
                }
                else
                {
                    return Color.Transparent;
                }
            }
            set { }
        }

        public ICommand ChangeStateCommand { get; set; }
        public ICommand ChangeToSignUpCommand { get; set; }
        public ICommand LoginCommand { get; set; }

        /// <summary>
        /// The view model for login page
        /// </summary>
        /// <param name="pageChanger">The object that can Change page</param>
        /// <param name="userService">The service for users</param>
        public LoginViewModel(IChangePage pageChanger, IUserService userService) : base(pageChanger)
        {
            _userService = userService;
            ChangeStateCommand = new Command(() => SaveChecked = !SaveChecked);
            ChangeToSignUpCommand = new Command(() => _pageChanger.PushPage(new SignUpPage()));
            LoginCommand = new Command(LoginAsync);
        }

        /// <summary>
        /// Logs in the user if the input is value
        /// </summary>
        public async void LoginAsync()
        {
            AuthenticateResponse response = null;

            Device.BeginInvokeOnMainThread(async () => {

                using (UserDialogs.Instance.Loading("Logger ind..."))
                {
                    if (DefaultValidators.ValidateMail(Mail).Count == 0 && DefaultValidators.ValidatePassword(Password).Count == 0)
                    {
                        await Task.Delay(300);
                        response = await _userService.AuthenticateAsync(Mail, Password, "0.0.0.0");
                    }
                }
                if (response != null)
                {
                    // Saves the token as a object
                    StorageManagerFactory.GetLocalDBManager().SaveToken(StorageManagerFactory.CreateToken(response.RefreshToken, SaveChecked));
                    _pageChanger.PopPushPage(new HomePage());
                }
                else
                {
                    LoginFailed = true;
                    NotifyPropertyChanged("LoginEnable");
                    NotifyPropertyChanged("InputColor");
                }
            });

        }

    }
}
