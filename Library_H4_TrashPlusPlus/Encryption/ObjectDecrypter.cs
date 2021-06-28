using H4_TrashPlusPlus.Models;
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
        public static IUser DecryptIUser(IEncryption encryption, IUser userToDecrypt)
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

        /// <summary>
        /// Decrypts AuthenticateRequest object.
        /// </summary>
        /// <param name="encryption">Encryption method to use.</param>
        /// <param name="requestToDecrypt">the request object to decrypt.</param>
        /// <returns>Decrypted request object.</returns>
        public static AuthenticateRequest DecryptAuthenticateRequest(IEncryption encryption, AuthenticateRequest requestToDecrypt)
        {
            if (requestToDecrypt != null)
            {
                AuthenticateRequest decryptedRequest = requestToDecrypt;
                decryptedRequest.Password = encryption.Decrypt(requestToDecrypt.Password);
                decryptedRequest.Username = encryption.Decrypt(requestToDecrypt.Username);

                return decryptedRequest;
            }
            return null;
        }

        /// <summary>
        /// Decrypts CreateUserRequest object.
        /// </summary>
        /// <param name="encryption">Encryption method to use.</param>
        /// <param name="requestToDecrypt">the request object to decrypt.</param>
        /// <returns>Decrypted request object.</returns>
        public static CreateUserRequest DecryptCreateUserRequest(IEncryption encryption, CreateUserRequest requestToDecrypt)
        {
            if (requestToDecrypt != null)
            {
                CreateUserRequest decryptedRequest = requestToDecrypt;
                decryptedRequest.Password = encryption.Decrypt(requestToDecrypt.Password);
                decryptedRequest.Username = encryption.Decrypt(requestToDecrypt.Username);
                decryptedRequest.Mail = encryption.Decrypt(requestToDecrypt.Mail);

                return decryptedRequest;
            }
            return null;
        }
    }
}
