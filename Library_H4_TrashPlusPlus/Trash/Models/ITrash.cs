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
        int FK_BinId  { get; }
        int FK_UserId { get;}
    }
}
