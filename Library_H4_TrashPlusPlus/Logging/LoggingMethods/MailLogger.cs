using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Logging.LoggingMethods
{
    /// <summary>
    /// Error logging via Email
    /// </summary>
    internal class MailLogger : LoggingMaster
    {
        public MailLogger(IncidentLevel level) : base(level) { }

        protected override async Task WriteAsync(string message, Exception exception)
        {
            try
            {
                var client = IncidentLogger.GetErrorSmtpClient();

                string currentTimestamp = DateTime.Now.ToString(@"MM/dd/yyyy HH:mm:ss");
                string mailSubject = $"{currentTimestamp} - An error occured";

                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append($"A critical error has occured at:");
                stringBuilder.Append($"{currentTimestamp} : {message}");
                if (exception != null)
                {
                    stringBuilder.Append(Environment.NewLine);
                    stringBuilder.Append("See Exception below:");
                    stringBuilder.Append(Environment.NewLine);
                    stringBuilder.Append($"{currentTimestamp} : {exception.GetType().Name} - {exception.Message}");
                }
                stringBuilder.Append(Environment.NewLine);

                client.Send(IncidentLogger.GetErrorToMail(), IncidentLogger.GetErrorToMail(), mailSubject, stringBuilder.ToString());
            }
            catch (Exception) { }
        }
    }
}