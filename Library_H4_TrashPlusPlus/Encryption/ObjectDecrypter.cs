using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    public static class ObjectDecrypter
    {
        /// <summary>
        /// Decrypts IUser object.
        /// </summary>
        /// <param name="encryption">Encryption method to use.</param>
        /// <param name="userToDecrypt">IUser object to decrypt.</param>
        /// <returns>Decrypted IUser object.</returns>
        internal static IUser DecryptIUser(IEncryption encryption, IUser userToDecrypt)
        {
            if (userToDecrypt != null)
            {
                User decryptedUser = (User)userToDecrypt;

                decryptedUser.Mail = encryption.Decrypt(userToDecrypt.Mail);
                decryptedUser.Username = encryption.Decrypt(userToDecrypt.Username);

                return decryptedUser;
            }
            return null;
        }
    }
}
