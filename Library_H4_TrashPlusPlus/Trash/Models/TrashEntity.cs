using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Models
{
    class TrashEntity : ITrash
    {
        public int Id { get; set; }
        public string Barcode { get; set; }
        public int FK_BinId { get; set; }
        public int FK_UserId { get; set; }

        public TrashEntity() { }
        public TrashEntity(int id, string barcode, int BinId, int UserId)
        {
            Id = id;
            Barcode = barcode;
            FK_BinId = BinId;
            FK_UserId = UserId;
        }
    }
}
