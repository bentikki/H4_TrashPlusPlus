using Library_H4_TrashPlusPlus.Logging.LoggingMethods;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Library_H4_TrashPlusPlus.Logging
{
    /// <summary>
    /// Error logging class.
    /// Uses Chain of Responsibility pattern.
    /// </summary>
    public static class IncidentLogger
    {
        private static LoggingMaster loggerChain;

        /// <summary>
        /// Returns the chain of loggers used in the error logging.
        /// </summary>
        public static LoggingMaster GetLogger
        {
            get
            {
                if (loggerChain == null)
                    IncidentLogger.SetLoggerChain();

                return IncidentLogger.loggerChain;
            }
        }
        /// <summary>
        /// Sets the chain of loggers used in the error logging.
        /// </summary>
        /// <returns>LoggingMaster object containing the chain.</returns>
        private static void SetLoggerChain()
        {
            LoggingMaster fileLogger = new LocalFileLogger(IncidentLevel.MINOR);
            LoggingMaster dbLogger = new DbLogger(IncidentLevel.MAJOR);
            LoggingMaster mailLogger = new MailLogger(IncidentLevel.CRITICAL);

            fileLogger
                .Next(dbLogger)
                .Next(mailLogger);

            loggerChain = fileLogger;
        }

        /// <summary>
        /// SqlConnection with permission to log errors via SPLogError
        /// </summary>
        /// <returns>SqlConnection with specific permission</returns>
        internal static SqlConnection GetSqlConnectionErrorLogger()
        {
            string username = "ErrorLoggingUser";
            string password = "Passw0rd";

            return CommonSettingsFactory.GetDBConnectionString(username, password);
        }

        /// <summary>
        /// SmtpClient used for mail error logging.
        /// </summary>
        /// <returns>SmtpClient used for mail error logging</returns>
        internal static SmtpClient GetErrorSmtpClient()
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("BTOsignUpAPI@gmail.com", "mRBLaY9zT5hNt8FinzI8uZkT1"),
                EnableSsl = true
            };

            return client;
        }

        /// <summary>
        /// Gets the mail address to send that shall recieve error logging.
        /// </summary>
        /// <returns>Mail address used to recieve error logs.</returns>
        internal static string GetErrorToMail()
        {
            string errorLogginToMail = "BTOsignUpAPI@gmail.com";
            return errorLogginToMail;
        }

    }
}
