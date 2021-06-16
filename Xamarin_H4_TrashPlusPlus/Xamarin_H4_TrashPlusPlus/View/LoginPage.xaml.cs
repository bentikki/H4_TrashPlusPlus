using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin_H4_TrashPlusPlus.ViewModel;

namespace Xamarin_H4_TrashPlusPlus.View
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class LoginPage : ContentPage, IChangePage
    {
        public LoginPage()
        {
            InitializeComponent();
            BindingContext = new LoginViewModel(this);
        }

        /// <summary>
        /// Changes the page to the given page
        /// </summary>
        /// <param name="page">the new page</param>
        public void ChangePage(Page page)
        {
            Navigation.PushAsync(page);
        }
    }
}