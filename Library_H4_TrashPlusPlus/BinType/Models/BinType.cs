using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.BinType.Models
{
    [Table("BinTypes")]
    public class BinTypeEntity : IBinType
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
