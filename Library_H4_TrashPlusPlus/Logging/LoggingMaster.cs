using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Library_H4_TrashPlusPlus.Logging
{
    internal enum IncidentLevel
    {
        MINOR = 1,
        MAJOR = 2,
        CRITICAL = 3
    }

    internal abstract class LoggingMaster
    {
        protected IncidentLevel level;
        protected LoggingMaster nextLogger;

        protected LoggingMaster(IncidentLevel level)
        {
            this.level = level;
        }

        public LoggingMaster Next(LoggingMaster nextLogger)
        {
            this.nextLogger = nextLogger;
            return this.nextLogger;
        }

        public async Task LogMessageAsync(IncidentLevel level, string message, Exception exception)
        {
            if (this.level <= level)
            {
                await WriteAsync(message, exception);
            }
            if (nextLogger != null)
            {
                await nextLogger.LogMessageAsync(level, message, exception);
            }
        }

        protected abstract Task WriteAsync(string message, Exception exception);
    }
}
