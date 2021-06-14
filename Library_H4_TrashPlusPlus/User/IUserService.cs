using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users
{
    public interface IUserService
    {
        IUser CreateUser(string mail, string username, string password);
        Task<IUser> CreateUserAsync(string mail, string username, string password);
        IUser Authenticate(string mail, string password)

    }
}
