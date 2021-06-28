using H4_TrashPlusPlus.Models;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
    /// <summary>
    /// Help to encrypt objectes
    /// </summary>
    public class ObjectEncryptor
    {
        /// <summary>
        /// Encrypts a authenticateResponse object
        /// </summary>
        /// <param name="encryption">The encryption method</param>
        /// <param name="authenticateResponse">The authenticateResponse to encrypt</param>
        /// <returns>Encrypted authenticateResponse</returns>
        public static AuthenticateResponse EncryptAuthenticateResponse(IEncryption encryption, AuthenticateResponse authenticateResponse)
        {
            authenticateResponse.UserObject = EncryptUser(encryption, authenticateResponse.UserObject);

            return authenticateResponse;
        }
        public static IUser EncryptIUser(IEncryption encryption, IUser user)
        {
            if (user is User userObject)
            {
                return EncryptUser(encryption, userObject);
            }
            else if (user is CreateUserRequest createUserRequest)
            {
                return EcryptCreateUserRequest(encryption, createUserRequest);
            }
            else
            {
                throw new NotImplementedException();
            }
        }
        private static User EncryptUser(IEncryption encryption, User user)
        {
            User encryptedUser = user;
            encryptedUser.Mail = encryption.Encrypt(user.Mail);
            encryptedUser.Username = encryption.Encrypt(user.Username);
            return encryptedUser;
        }

        /// <summary>
        /// Encrypts CreateUserRequest object.
        /// </summary>
        /// <param name="encryption">Encryption method to use.</param>
        /// <param name="requestToEncrypted">the request object to ecrypt.</param>
        /// <returns>Ecrypted request object.</returns>
        public static AuthenticateRequest EcryptAuthenticateRequest(IEncryption encryption, AuthenticateRequest requestToEncrypted)
        {
            if (requestToEncrypted != null)
            {
                AuthenticateRequest encryptedRequest = requestToEncrypted;
                encryptedRequest.Password = encryption.Encrypt(requestToEncrypted.Password);
                encryptedRequest.Username = encryption.Encrypt(requestToEncrypted.Username);

                return encryptedRequest;
            }
            return null;
        }

        /// <summary>
        /// Encrypts CreateUserRequest object.
        /// </summary>
        /// <param name="encryption">Encryption method to use.</param>
        /// <param name="requestToEncrypted">the request object to ecrypt.</param>
        /// <returns>Ecrypted request object.</returns>
        public static CreateUserRequest EcryptCreateUserRequest(IEncryption encryption, CreateUserRequest requestToEncrypted)
        {
            if (requestToEncrypted != null)
            {
                CreateUserRequest encryptedRequest = requestToEncrypted;
                encryptedRequest.Mail = encryption.Encrypt(requestToEncrypted.Mail);
                encryptedRequest.Username = encryption.Encrypt(requestToEncrypted.Username);
                encryptedRequest.Password = encryption.Encrypt(requestToEncrypted.Password);

                return encryptedRequest;
            }
            return null;
        }
    }
}