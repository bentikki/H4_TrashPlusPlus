using Library_H4_TrashPlusPlus.Users.Tokens.JwtTokens;
using Library_H4_TrashPlusPlus.Users.Tokens.RefreshTokens;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Tokens
{
    static class TokenFactory
    {
        public static IJwtTokenGenerator GetJwtTokenGenerator()
        {
            return new JwtTokenGeneratorHmacSha256();
        }

        public static IRefreshTokenGenerator GetRefreshTokenGenerator()
        {
            return new RefreshTokenGeneratorRNGCrypto();
        }

    }
}
