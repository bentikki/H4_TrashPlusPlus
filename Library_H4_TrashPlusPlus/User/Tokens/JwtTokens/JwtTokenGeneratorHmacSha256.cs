using Library_H4_TrashPlusPlus.Users.Models;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Tokens.JwtTokens
{
    /// <summary>
    /// Class used to generate secure JWT tokens.
    /// </summary>
    class JwtTokenGeneratorHmacSha256 : IJwtTokenGenerator
    {
        private readonly string secret = CommonSettingsFactory.JwtSecret();

        /// <summary>
        /// Generate JWT token from IUser object owner.
        /// </summary>
        /// <param name="user">IUser object owner</param>
        /// <returns>Generated JWT Token as string</returns>
        public string GenerateJwtToken(IUser user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(this.secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.Id.ToString())
                }),
                Expires = DateTime.UtcNow.AddMinutes(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
