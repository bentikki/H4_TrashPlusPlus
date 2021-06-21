using Library_H4_TrashPlusPlus.BinType.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.BinType
{
    public interface IBinTypeService
    {
        IBinType GetBinTypeById(int id);
        Task<IBinType> GetBinTypeByIdAsync(int id);

        List<IBinType> GetAllBinTypes();
        Task<List<IBinType>> GetAllBinTypesAsync();
    }
}
