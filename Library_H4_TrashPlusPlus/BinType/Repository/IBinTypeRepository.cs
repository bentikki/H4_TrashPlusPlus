using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    public interface IBinTypeRepository
    {
        IBinType GetBinById(int id);
        List<IBinType> GetAllBins();
    }
}
