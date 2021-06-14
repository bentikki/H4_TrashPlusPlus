using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Models
{
    public interface IUser
    {
        int Id { get; }
        string Mail { get; }
        string Username { get; }
    }
}
