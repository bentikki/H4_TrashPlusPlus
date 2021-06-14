using System;
using System.Collections.Generic;
using System.Text;
using Library_H4_TrashPlusPlus.User.Models;

namespace Library_H4_TrashPlusPlus.User.Repository
{
    public interface IUserRepository
    {
        IUser CreateUser(IUser userToCreate);
    }
}
