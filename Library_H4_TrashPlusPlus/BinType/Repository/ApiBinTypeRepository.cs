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

        /// <summary>
        /// Gets the bintype for the bintype id
        /// </summary>
        /// <param name="id">The bintype id</param>
        /// <returns>the bintype</returns>
        public IBinType GetBinById(int id)
        {
            string apiPath = "bintype/get/" + id;
            //return new BinTypeEntity() { Name = "duck", Id = id };
            return apiRequester.GetApi<BinTypeEntity>(apiPath);
        }
    }
}
