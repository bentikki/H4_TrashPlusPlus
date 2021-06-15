using Dapper;
using Dapper.Contrib.Extensions;
using H4_TrashPlusPlus.Entities;
using Library_H4_TrashPlusPlus.Users.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Library_H4_TrashPlusPlus.Users.Tokens.RefreshTokens
{
    /// <summary>
    /// Used to generate Refresh Tokens in DB
    /// </summary>
    class RefreshTokenGeneratorRNGCrypto : IRefreshTokenGenerator
    {
        /// <summary>
        /// Generates Refresh token from provided IUser owner and ip address.
        /// </summary>
        /// <param name="selectedUser">IUser owner</param>
        /// <param name="ipAddress">IP Address origin</param>
        /// <returns>RefreshToken object created</returns>
        public RefreshToken CreateRefreshToken(IUser selectedUser, string ipAddress)
        {
            // Generate jwt and refresh tokens
            var refreshToken = GenerateRefreshToken(ipAddress, selectedUser);
            long refreshTokenId = 0;
            RefreshToken createdToken; 

            using (var conn = UserServiceFactory.GetSqlConnectionRefreshTokenCreator())
            {
                conn.Open();
                refreshTokenId = conn.Insert(refreshToken);
            }

            if (refreshTokenId == 0)
                throw new InvalidOperationException("Refresh Token could not be created.");

            using (var conn = UserServiceFactory.GetSqlConnectionRefreshTokenBasicReader())
            {
                conn.Open();
                createdToken = conn.Get<RefreshToken>(refreshTokenId);
            }

            return createdToken;
        }

        /// <summary>
        /// Replaces Refresh token from provided original token and ip address.
        /// </summary>
        /// <param name="token">original token</param>
        /// <param name="ipAddress">IP Address origin</param>
        /// <returns>RefreshToken object created</returns>
        public RefreshToken ReplaceRefreshToken(IUser selectedUser, string ipAddress, string token)
        {
            // Generate refresh tokens
            var newRefreshToken = GenerateRefreshToken(ipAddress, selectedUser);

            // Replace old token info
            var oldRefreshToken = this.GetRefreshTokenByToken(token);
            oldRefreshToken.Revoked = DateTime.UtcNow;
            oldRefreshToken.RevokedByIp = ipAddress;
            oldRefreshToken.ReplacedByToken = newRefreshToken.Token;

            RefreshToken refreshToken;
            long refreshTokenId = 0;

            using (var conn = UserServiceFactory.GetSqlConnectionRefreshTokenCreator())
            {
                conn.Open();

                // Update old RefreshToken
                bool updatesuccess = conn.Update(oldRefreshToken);

                if (!updatesuccess)
                {
                    conn.Close();
                    throw new InvalidOperationException("Refresh Token could not be updated.");
                }

                // Insert new RefreshToken
                refreshTokenId = conn.Insert(newRefreshToken);
            }

            using (var conn = UserServiceFactory.GetSqlConnectionRefreshTokenBasicReader())
            {
                conn.Open();
                refreshToken = conn.Get<RefreshToken>(refreshTokenId);
            }

            return refreshToken;
        }

        private RefreshToken GenerateRefreshToken(string ipAddress, IUser user)
        {
            using (var rngCryptoServiceProvider = new RNGCryptoServiceProvider())
            {
                var randomBytes = new byte[64];
                rngCryptoServiceProvider.GetBytes(randomBytes);
                return new RefreshToken
                {
                    Token = Convert.ToBase64String(randomBytes),
                    Expires = DateTime.UtcNow.AddDays(7),
                    Created = DateTime.UtcNow,
                    UserId = user.Id,
                    CreatedByIp = ipAddress
                };
            }
        }

        private RefreshToken GetRefreshTokenByToken(string token)
        {
            using (var conn = UserServiceFactory.GetSqlConnectionRefreshTokenBasicReader())
            {
                conn.Open();
                RefreshToken refreshToken = conn.QuerySingleOrDefault<RefreshToken>("Select * from RefreshToken WHERE Token = @refreshToken", new { @refreshToken = token});

                return refreshToken;
            }
        }
    }
}
