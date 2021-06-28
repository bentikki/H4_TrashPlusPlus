using Library_H4_TrashPlusPlus.Encryption;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus
{

    public static class CommonSettingsFactory
    {

        internal static string GetApiPath { get => "https://40e745966a75.ngrok.io/"; }
        internal static SqlConnection GetDBConnectionString(string username, string password)
        {
            //string connectionString = @"Server=172.16.21.93;Database=TrashPlusPlus;User Id=User;Password=Pa$$w0rd;";
            string connectionString = $"Server=172.16.21.93;Database=TrashPlusPlus;User Id={username};Password={password};";

            SqlConnection sqlConnection = new SqlConnection(connectionString);
            return sqlConnection;
        }

        internal static string JwtSecret()
        {
            string jwtSecretString = @"vxRvSjFCCkiFVDGPqnxdgg4nvqwtEn5EGDQPmmUkv0ug26Rmle2e7UOvQamObvWVvw1diOHb2ueUyaPhots+8n+gRNrP5Y6hBkKPD/Cvq9+Q+A";
            return jwtSecretString;
        }


        private static ISyncEncryption syncEncrypter;
        internal static IEncryption SyncEncrypter
        {
            get
            {
                if (syncEncrypter == null)
                {
                    byte[] key = Convert.FromBase64String("FtxmJsjVZJ+tcTaheQAQh8PF3F/Gzw9c0TE1bDbaeag=");
                    byte[] iv = Convert.FromBase64String("texUprSmmrS+TcadjTWvaQ==");

                    syncEncrypter = EncryptionFactory.GenerateSyncEncryption(key, iv);
                }

                return syncEncrypter;
            }
        }

        private static IAsyncEncryption asyncEncrypter;
        public static IEncryption AsyncEncrypter
        {
            get
            {
                if (asyncEncrypter == null)
                {
                    asyncEncrypter = EncryptionFactory.GenerateAsyncEncryption();
                }

                return asyncEncrypter;
            }
        }

        /// <summary>
        /// Gets the public key for the Async encryption
        /// </summary>
        /// <returns>The public key</returns>
        public static string GetAsyncPublicKey()
        {
            return ((IAsyncEncryption)AsyncEncrypter).GetPublicKey();
        }
    }
}
