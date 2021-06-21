using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Trash.Models
{
    public class CreateTrashRequest
    {
        [Required]
        public string Barcode { get; set; }

        [Required]
        public int BinTypeID { get; set; }

        [Required]
        public int UserID { get; set; }

        public CreateTrashRequest(string barcode, int binTypeID, int userID)
        {
            Barcode = barcode;
            BinTypeID = binTypeID;
            UserID = userID;
        }

        public CreateTrashRequest()
        {

        }
    }
}
