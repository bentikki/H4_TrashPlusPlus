using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    public interface ITrashRepository
    {
        ITrash GetTrashByBarcode(string barcode);
        ITrash CreateTrash(CreateTrashRequest createTrashRequest);
    }
}
