using H4_TrashPlusPlus.Models;
using Library_H4_TrashPlusPlus.Users.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Encryption
{
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
        internal static IUser EncryptIUser(IEncryption encryption, IUser user)
        {
            if(user is User userObject)
            {
                return EncryptUser(encryption, userObject);
            }
            else if(user is CreateUserRequest createUserRequest)
            {
                return EncryptCreateUserRequest(encryption, createUserRequest);
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

        private static CreateUserRequest EncryptCreateUserRequest(IEncryption encryption, CreateUserRequest createUserRequest)
        {
            CreateUserRequest encryptedUser = createUserRequest;
            encryptedUser.Mail = encryption.Encrypt(createUserRequest.Mail);
            encryptedUser.Username = encryption.Encrypt(createUserRequest.Username);
            return encryptedUser;
        }
    }
}
