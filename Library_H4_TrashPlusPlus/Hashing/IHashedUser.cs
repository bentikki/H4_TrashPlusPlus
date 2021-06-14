using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Hashing
{
    public interface IHashedUser
    {
        string Username { get; set; }
        string Password { get; set; }
        string Salt { get; set; }
    }
}
