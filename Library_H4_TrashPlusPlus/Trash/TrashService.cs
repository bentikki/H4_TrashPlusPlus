using Library_H4_TrashPlusPlus.BinType.Models;
using Library_H4_TrashPlusPlus.Trash.Models;
using Library_H4_TrashPlusPlus.Trash.Repository;
using Library_H4_TrashPlusPlus.Users.Repository;
using Library_H4_TrashPlusPlus.Validator;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash
{
    public class TrashService : ITrashService
    {
        private ITrashRepository trashRepository;

        internal TrashService(ITrashRepository trashRepository)
        {
            this.trashRepository = trashRepository;
        }

        /// <summary>
        /// Returns ITrash object based on given barcode.
        /// Returns NULL if no such barcode exists.
        /// </summary>
        /// <param name="barcode">Barcode of requested trash</param>
        /// <returns>ITrash object matching the given barcode.</returns>
        public ITrash GetTrashByBarcode(string barcode)
        {
            // Check for errors in input - Throw Exception
            DefaultValidators.ValidateBarcodeException(barcode);
            
            // Set trash to null initially, so null will be returned if the barcode does not exist.
            ITrash selectedTrash = null;

            try
            {
                // Call repository 
                selectedTrash = this.trashRepository.GetTrashByBarcode(barcode);
            }
            catch (Exception e)
            {
                // An unexpected error occured.
                selectedTrash = null;
            }

            // Return created object
            return selectedTrash;
        }

        /// <summary>
        /// Register barcode to be a trash item matching the given IBinType sorting method.
        /// </summary>
        /// <param name="barcode">Barcode of trash</param>
        /// <param name="bin">IBinType object to be registered as correct sorting method.</param>
        /// <returns>Newly created trash item.</returns>
        public ITrash CreateTrash(CreateTrashRequest createTrashRequest)
        {
            // Check for errors in input - Throw Exception
            if (createTrashRequest.BinTypeID < 1) throw new ArgumentException("BinTypeID must not be below 1", nameof(createTrashRequest.BinTypeID));
            DefaultValidators.ValidateBarcodeException(createTrashRequest.Barcode);

            // Set trash to null initially, so null will be returned if the barcode does not exist.
            ITrash createdTrash = null;

            try
            {
                // Call repository 
                createdTrash = this.trashRepository.CreateTrash(createTrashRequest);
            }
            catch (SqlException e)
            {
                // An error occured while creating via Database.
                throw e;
            }
            catch (Exception e)
            {
                // An unexpected error occured.
                throw e;
            }

            // Return created object
            return createdTrash;
        }
    }
}
