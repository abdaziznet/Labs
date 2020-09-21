using System;
using System.IO;
namespace ConsoleApp
{
    public static class Framework
    {
        static readonly object _object = new object();
        public static void writeLog(string msg)
        {
            string formatMsg = string.Empty;
            formatMsg = string.Format("{0}|{1}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss.fff"), msg);

            string logFilePath = @"D:\03-Labs\05-Visual Studio Code\Belajar C#\ConsoleApp\LOGS";
            string logFileName = string.Format(@"{0}\ConsoleApp_{1}.LOG", logFilePath, DateTime.Now.ToString("yyyyMMddhh"));

            if (Directory.Exists(logFilePath) != true)
                Directory.CreateDirectory(logFilePath);

            lock (_object)
            {
                using (var fs = File.Open(logFileName, FileMode.Append))
                {
                    using (var sw = new StreamWriter(fs))
                    {
                        sw.Write(string.Format("{0}{1}", formatMsg, Environment.NewLine));
                    }
                }

            }
        }
    }
}