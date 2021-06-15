using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Tokens.JwtTokens
{
    interface IJwtTokenGenerator
    {
        string GenerateJwtToken(IUser user);
    }
}
