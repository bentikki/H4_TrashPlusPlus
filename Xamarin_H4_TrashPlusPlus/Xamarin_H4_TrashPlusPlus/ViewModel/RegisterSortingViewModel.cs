using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class RegisterSortingViewModel : BaseViewModel
    {
        private ITrashService _trashService;
        private IBinTypeService _binTypeService;
        private CreateTrashRequest trashRequest;
        private ObservableCollection<IBinType> binTypes;

        public ObservableCollection<IBinType> BinTypes
        {
            get { return binTypes; }
            set
            {
                binTypes = value;
                NotifyPropertyChanged("BinTypes");
            }
        }

        public IBinType selectedItem;
        public IBinType SelectedItem
        {
            get { return selectedItem; }
            set
            {
                selectedItem = value;
                TrashRequest.BinTypeID = selectedItem.Id;
            }
        }


        public int BinTypeId
        {
            get { return TrashRequest.BinTypeID; }
            set
            {
                TrashRequest.BinTypeID = value;
                NotifyPropertyChanged("BinTypeId");
                NotifyPropertyChanged("TrashRequest");
            }
        }
        public CreateTrashRequest TrashRequest
        {
            get { return trashRequest; }
            set
            {
                trashRequest = value;
                NotifyPropertyChanged("TrashRequest");
                NotifyPropertyChanged("BinTypeId");
            }
        }

        public ICommand CreateCommand { get; set; }
        public ICommand SelectCommand { get; set; }

        public RegisterSortingViewModel(IChangePage pageChanger, ITrashService trashService, IBinTypeService binTypeService, string barcode) : base(pageChanger)
        {
            _binTypeService = binTypeService;
            _trashService = trashService;
            TrashRequest = new CreateTrashRequest();
            BinTypes = new ObservableCollection<IBinType>();
            TrashRequest.Barcode = barcode;
            CreateCommand = new Command(() => CreateTrashAsync());
            SelectCommand = new Command((BinType) => SelectItem(BinType));
            Task.Run(GetBinTypeAsync);
        }

        public void SelectItem(object binTypes)
        {
            SelectedItem = (IBinType)binTypes;
        }

        public async Task CreateTrashAsync()
        {
            using (UserDialogs.Instance.Loading("Registere affaldssortering..."))
            {
                if (TrashRequest.BinTypeID > 0)
                {
                    try
                    {
                        await Task.Delay(250);
                        ITrash trash = _trashService.CreateTrash(TrashRequest);
                        UserDialogs.Instance.Toast("Success Tak for hjælpen",new TimeSpan(0,0,10));
                        _pageChanger.PopPushPage(new HomePage());
                    }
                    catch
                    {
                        UserDialogs.Instance.Alert("fejled med at registere ");
                    }
                }
                UserDialogs.Instance.Alert("fejled med at registere ");
            }
        }
        public async Task GetBinTypeAsync()
        {
            List<IBinType> binTypes = await _binTypeService.GetAllBinTypesAsync();
            for (int i = 0; i < binTypes.Count; i++)
            {
                BinTypes.Add(binTypes[i]);
                if (i == 0)
                {
                    SelectedItem = binTypes[0];
                }
            }
        }
    }
}
