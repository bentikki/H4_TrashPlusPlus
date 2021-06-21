using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Dapper;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.Api;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    class ApiBinTypeRepository : ApiRepositoryMaster, IBinTypeRepository
    {
        public ApiBinTypeRepository(string apidestination) : base(apidestination)
        {
        }

        /// <summary>
        /// Returns a list of all available bin types.
        /// </summary>
        /// <returns>List of available Bin Types</returns>
        public List<IBinType> GetAllBins()
        {
            string apiPath = "bintype/getall";

            List<BinTypeEntity> availableBinTypeInterfaces = new List<BinTypeEntity>();

            availableBinTypeInterfaces = apiRequester.GetApi<List<BinTypeEntity>>(apiPath);

            return availableBinTypeInterfaces.AsList<IBinType>();
        }

        public IBinType GetBinById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
