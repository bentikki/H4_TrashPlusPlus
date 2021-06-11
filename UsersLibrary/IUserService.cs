using System;
using System.Collections.Generic;
using System.Text;
using UsersLibrary.Models;

namespace UsersLibrary
{
    public interface IUserService
    {
        IUser CreateUser(string mail, string password);
    }
}
