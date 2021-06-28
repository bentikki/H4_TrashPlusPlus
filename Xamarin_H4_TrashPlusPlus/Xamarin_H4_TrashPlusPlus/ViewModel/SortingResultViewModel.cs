using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class SortingResultViewModel : BaseViewModel
    {
        private IBinTypeService _binTypeService;

        public bool Registered { get; set; }

        private IBinType binType;
        public string ResultHeader { get; set; }

        public IBinType BinType
        {
            get { return binType; }
            set { 
                binType = value;
                NotifyPropertyChanged("BinType");
            }
        }

        public SortingResultViewModel (IChangePage pageChanger, ITrash trash, IBinTypeService binTypeService) : base(pageChanger)
        {
            Registered = trash != null;
            
            if (Registered)
            {
                ResultHeader = "Sorteringsmetode fundet!";
                this._binTypeService = binTypeService;
                _ = this.GetBinType(trash);
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
