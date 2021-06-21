using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash
{
    public interface ITrashService
    {
        ITrash GetTrashByBarcode(string barcode);
        ITrash CreateTrash(CreateTrashRequest createTrashRequest);
    }
}
