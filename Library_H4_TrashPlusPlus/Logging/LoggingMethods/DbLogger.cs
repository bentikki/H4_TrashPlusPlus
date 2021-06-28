﻿using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Logging.LoggingMethods
{
    internal class DbLogger : LoggingMaster
    {
        public DbLogger(IncidentLevel level) : base(level) { }

        protected override async Task WriteAsync(string message, Exception exception)
        {
            try
            {
                using (var conn = IncidentLogger.GetSqlConnectionErrorLogger())
                {
                    await conn.OpenAsync();

                    // Execute stored procedure to create new user with hashed password.
                    var procedure = "[SPLogError]";
                    var values = new
                    {
                        @ErrorMessage = message,
                        @ExceptionType = exception.GetType().Name,
                        @ExceptionMessage = exception.Message
                    };
                    await conn.ExecuteAsync(procedure, values, commandType: CommandType.StoredProcedure);
                }

            }
            catch (Exception e) { }
        }
    }
}