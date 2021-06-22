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
        public int BinId { get; set; }
        public int UserId { get; set; }

        public TrashEntity() { }
        public TrashEntity(int id, string barcode, int binId, int userId)
        {
            Id = id;
            Barcode = barcode;
            BinId = binId;
            UserId = userId;
        }
    }
}
