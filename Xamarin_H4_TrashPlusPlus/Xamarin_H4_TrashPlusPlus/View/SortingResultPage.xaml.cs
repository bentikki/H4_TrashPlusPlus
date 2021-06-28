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
        public SortingResultPage(ITrash trash, string barcode)
        {
            InitializeComponent();
            BindingContext = new SortingResultViewModel(this, trash, barcode, BinTypeServiceFactory.GetBinTypeServiceApi());
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
                Navigation.PopAsync()
            );
        }

        /// <summary>
        /// Pops the last page and pushes a new page
        /// </summary>
        /// <param name="page">The new page to push</param>
        public void PopPushPage(Page page)
        {
            Device.BeginInvokeOnMainThread(() =>
            {
                Navigation.PopAsync(false);
                Navigation.PushAsync(page, false);
            }
            );
        }
    }
}