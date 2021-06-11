using System;
using System.Collections.Generic;
using System.Text;
using UsersLibrary.Models;

namespace UsersLibrary.Repository
{
    public interface IUserRepository
    {
        IUser CreateUser(IUser userToCreate);
    }
}
