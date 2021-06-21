using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.BinType
{
    public class BinTypeService : IBinTypeService
    {
        private IBinTypeRepository _binTypeRepository;

        internal BinTypeService(IBinTypeRepository binTypeRepository)
        {
            this._binTypeRepository = binTypeRepository;
        }

        /// <summary>
        /// Returns all currently existing Bin Types as List
        /// </summary>
        /// <returns>List of all current Bin Types</returns>
        public List<IBinType> GetAllBinTypes()
        {
            List<IBinType> allCurrentBinTypes =  new List<IBinType>();

            try
            {
                // Get list from repository.
                allCurrentBinTypes = this._binTypeRepository.GetAllBins();
            }
            catch(SqlException e)
            {
                // The database call was not successfull.
                // Return null;
                allCurrentBinTypes = null;
            }
            catch (Exception e)
            {
                // An unexpected error occured.
                throw e;
            }

            return allCurrentBinTypes;
        }

        /// <summary>
        /// Returns all currently existing Bin Types as List
        /// </summary>
        /// <returns>List of all current Bin Types</returns>
        public async Task<List<IBinType>> GetAllBinTypesAsync()
        {
            var task = Task.Run(() => this.GetAllBinTypes());
            return await task;
        }

        public IBinType GetBinTypeById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IBinType> GetBinTypeByIdAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
