using H4_TrashPlusPlus.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Tokens.RefreshTokens
{
    interface IRefreshTokenGenerator
    {
        RefreshToken CreateRefreshToken(IUser selectedUser, string ipAddress);
        RefreshToken ReplaceRefreshToken(IUser selectedUser, string ipAddress, string token);
    }
}
