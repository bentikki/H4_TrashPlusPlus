using Library_H4_TrashPlusPlus.Encryption;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Library_H4_TrashPlusPlus
{

    public static class CommonSettingsFactory
    {

        internal static string GetApiPath { get => "https://89a0589d5742.ngrok.io/"; }
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


        private static IEncryption syncEncrypter;
        internal static IEncryption SyncEncrypter
        {
            get 
            {
                if (syncEncrypter == null)
                {
                    byte[] key = Convert.FromBase64String("FtxmJsjVZJ+tcTaheQAQh8PF3F/Gzw9c0TE1bDbaeag=");
                    byte[] iv = Convert.FromBase64String("texUprSmmrS+TcadjTWvaQ==");

                    IEncryption encryption = EncryptionFactory.GenerateSyncEncryption(key, iv);
                    syncEncrypter = encryption;
                }

                return syncEncrypter;
            }
        }

        internal static IEncryption GetAsyncEncryption()
        {
            string key = @"<RSAKeyValue><Modulus>4FEEVkMAgguDfC/UmlMLvaZrTnsJLPEmN58DUKI72fWqp77cvlqTGgzlW2+ZNrVhDrQB4bdYDm/yNNW1ULkyjudVLRS4oG3224MFnm4GzjRDTH+IEKDi95+kXHTpWLhftE3dB+9zsunVi6gl5f0vHZk6s3R7PMvJGSt9dax6Cjq79VysObJZKKFSTk7dQikRxdA1laXo0z4AoJHbEqJAtvJ8IFaQpU/YHNmW76pbTUv9ucA76rJVwgF2gfvpcipyfMMqmGhwMTz+LISHzEWD3R961fjKbFuDfE3gC6H/ycjClyPxkLaY5ZtpEIsTloK+AqmCdf5wz+AKvKMeAIJCcQ==</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

            IEncryption encryption = EncryptionFactory.GenerateAsyncEncryption(key);

            return encryption;
        }
    }
}
