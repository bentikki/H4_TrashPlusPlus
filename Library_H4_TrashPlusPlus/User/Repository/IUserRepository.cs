using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Library_H4_TrashPlusPlus.Users.Models;

namespace Library_H4_TrashPlusPlus.Users.Repository
{
    public interface IUserRepository
    {
        IUser CreateUser(CreateUserRequest userToCreate);
        IUser GetUserById(int id);
        IUser GetUserByLoginName(string loginName);
        AuthenticateResponse Authenticate(string mail, string password, string ipAddress);
        AuthenticateResponse RefreshToken(string token, string ipAddress);
        IUser GetUserByToken(string token);
    }
}
