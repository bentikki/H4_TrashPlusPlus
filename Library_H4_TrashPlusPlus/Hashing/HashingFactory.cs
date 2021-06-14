using Library_H4_TrashPlusPlus.Users.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus.Hashing
{
    public static class HashingFactory
    {
        internal static HashingService GetHashingService()
        {
            HashingSettings settings = new HashingSettings(HashingMethodType.SHA256);
            HashingService hashingService = new HashingService(settings);

            return hashingService;
        }
    }
}
