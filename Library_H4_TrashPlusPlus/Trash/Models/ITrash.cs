using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Models
{
    public interface ITrash
    {
        int Id { get;}
        string Barcode { get;}
        int BinId { get; }
        int UserId { get;}
    }
}
