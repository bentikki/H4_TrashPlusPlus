using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Trash
{
    public interface ITrashService
    {
        ITrash GetTrashByBarcode(string barcode);
        Task<ITrash> GetTrashByBarcodeAsync(string barcode);

        ITrash CreateTrash(CreateTrashRequest createTrashRequest);
        Task<ITrash> CreateTrashAsync(CreateTrashRequest createTrashRequest);
    }
}
