using Dapper;
using Library_H4_TrashPlusPlus.Api;
using Library_H4_TrashPlusPlus.Trash.Models;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Users.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash.Repository
{
    class ApiTrashRepository : ApiRepositoryMaster ,ITrashRepository
    {

        public ApiTrashRepository(string apidestination) : base(apidestination)
        {
        }

        /// <summary>
        /// Creates trash in the database, based on given object.
        /// </summary>
        /// <param name="trash">Trash to create.</param>
        /// <returns>Created trash entity.</returns>
        public ITrash CreateTrash(CreateTrashRequest createTrashRequest)
        {
            ITrash createdTrash;
            string apiPath = "Trash/RegisterTrashSorting";
            createdTrash = this.apiRequester.PostApi<TrashEntity>(apiPath, createTrashRequest);
            
            return createdTrash;
        }

        /// <summary>
        /// Returns ITrash object matching the given barcore stirng.
        /// Returns null if no such obejct exists in the database.
        /// </summary>
        /// <param name="barcode">Barcode of requested trash entity.</param>
        /// <returns>ITrash object</returns>
        public ITrash GetTrashByBarcode(string barcode)
        {
            ITrash selectedTrash = null;
            try
            {
                string apiPath = "Trash/Getbybarcode/" + barcode;
                selectedTrash = this.apiRequester.GetApi<TrashEntity>(apiPath);
            }
            catch (Exception)
            {
                selectedTrash = null;
            }

            return selectedTrash;

        }
    }
}
