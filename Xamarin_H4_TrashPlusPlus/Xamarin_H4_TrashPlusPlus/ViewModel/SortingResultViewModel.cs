using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.LocalStorage;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class SortingResultViewModel : BaseViewModel
    {
        private IBinTypeService _binTypeService;
        
        private IBinType binType;

        public bool Registered { get; set; }
        public string ResultHeader { get; set; }
        public bool RegisterOption { get; set; }

        public string Barcode { get; set; }
        public ICommand RegisterCommand { get; set; }
        public ICommand ScanAgainCommand { get; set; }
        public ICommand HomeCommand { get; set; }

        public IBinType BinType
        {
            get { return binType; }
            set { 
                binType = value;
                NotifyPropertyChanged("BinType");
            }
        }

        public SortingResultViewModel (IChangePage pageChanger, ITrash trash, string barcode, IBinTypeService binTypeService) : base(pageChanger)
        {
            Registered = trash != null;
            Barcode = trash.Barcode;
            RegisterOption = (Registered == false && StorageManagerFactory.GetLocalDBManager().GetToken() != null);

            RegisterCommand = new Command(() => _pageChanger.PopPushPage(new RegisterSortingPage(barcode)));
            ScanAgainCommand = new Command(() => _pageChanger.PushPage(new ScanningPage()));
            HomeCommand = new Command(() => _pageChanger.PopPushPage(new HomePage()));

            if (Registered)
            {
                ResultHeader = "Sorteringsmetode fundet!";
                this._binTypeService = binTypeService;
                Task.Run(() => this.GetBinType(trash));
            }
            else
            {
                ResultHeader = "sorteringsmetoden Blev ikke fundet";
            }
        }

        public async Task GetBinType(ITrash trash)
        {
            using (UserDialogs.Instance.Loading("Viser sortering..."))
            {
                this.BinType = await this._binTypeService.GetBinTypeByIdAsync(trash.BinId);
            }
        }
    }
}
