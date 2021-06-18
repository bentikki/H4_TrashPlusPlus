using Library_H4_TrashPlusPlus.Trash.Repository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Trash
{
    public static class TrashServiceFactory
    {
        /// <summary>
        /// ITrashService used for database interaction
        /// </summary>
        /// <returns>ITrashService used for database interaction</returns>
        public static ITrashService GetTrashServiceDb()
        {
            return new TrashService(new DbTrashRepository());
        }
    }
}
