using System;
using System.Collections.Generic;
using System.Text;
using Library_H4_TrashPlusPlus.User.Models;

namespace Library_H4_TrashPlusPlus.User
{
    public interface IUserService
    {
        IUser CreateUser(string mail, string password);
    }
}
