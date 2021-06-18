using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Models
{
    public interface ITrash
    {
        int Id { get; set; }
        string Barcode { get; set; }
        string FK_BinId  { get; set; }
        string FK_UserId { get; set; }
        IBinType BinType { get; set; }
        IUser CreatedBy{ get; set; }
    }
}
