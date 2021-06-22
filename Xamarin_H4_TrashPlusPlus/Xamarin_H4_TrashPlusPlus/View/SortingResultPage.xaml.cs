using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.Trash.Models;
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
    public partial class SortingResultPage : ContentPage, IChangePage
    {
        public SortingResultPage(ITrash trash)
        {
            InitializeComponent();
            BindingContext = new SortingResultViewModel(this, trash, BinTypeServiceFactory.GetBinTypeServiceApi());
        }

        /// <summary>
        /// Changes the page to the given page
        /// </summary>
        /// <param name="page">the new page</param>
        public void PushPage(Page page)
        {
            Device.BeginInvokeOnMainThread(() =>
            Navigation.PushAsync(page)
            );
        }

        /// <summary>
        /// Changes to the last page
        /// </summary>
        public void PopPage()
        {
            Device.BeginInvokeOnMainThread(() =>
                Navigation.PopModalAsync()
            );
        }
    }
}