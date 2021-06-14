using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    public interface IUserRepository
    {
        IUser CreateUser(IUser userToCreate);
        bool Authenticate(string mail, string password);
    }
}
