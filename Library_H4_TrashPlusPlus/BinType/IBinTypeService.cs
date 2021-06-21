using Library_H4_TrashPlusPlus.BinType.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.BinType
{
    public interface IBinTypeService
    {
        IBinType GetBinTypeById(int id);
        List<IBinType> GetAllBinTypes();
    }
}
