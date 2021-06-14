using Library_H4_TrashPlusPlus.Hashing;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Hashing.Models
{
    interface IHashingMethod
    {
        byte[] HashPasswordWithSalt(byte[] toBeHashed, byte[] salt);
        string GetHashedPasswordString(string inputPassword, string salt64string);
        IHashedUser HashUserObject(IHashedUser userToHash);
    }
}
