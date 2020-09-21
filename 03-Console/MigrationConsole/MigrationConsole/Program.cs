using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MigrationConsole.FingerPrintService;

namespace MigrationConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            FingerPrintClient client = new FingerPrintClient();
            ClientInfo info = ClientInfoMapper();
            string transactionGuid = Guid.NewGuid().ToString();
            SqlProvider sql = new SqlProvider();
            int successCount;
            int errorDuplicatCount;
            MigrationCentralException[] migrationArray;
            int result = 0;
            try
            {
                List<MultipleEnrollmentInfo> enrollCollection = new List<MultipleEnrollmentInfo>();
                enrollCollection = sql.GetEnrollmentCollection();

                MultipleEnrollmentInfo[] enrollArray = enrollCollection.ToArray();
                result = client.MultipleEnrollment(info, transactionGuid, enrollArray, out successCount, out errorDuplicatCount, out migrationArray);
                client.Close();
                if (result == 0)
                {
                    Console.Write("MIgration Success");
                }
                else
                {
                    Console.Write("MIgration Failed");
                }
            }
            catch (Exception ex)
            {

                Console.Write(ex.Message);
            }
            Console.ReadLine();
        }

        private static ClientInfo ClientInfoMapper()
        {
            ClientInfo info = new ClientInfo();
            info.ActionName = "Migration";
            info.BranchCode = "0000";
            info.HostName = "Local";
            info.IPAddress = "192.168.100.36";
            info.IPAddressType = 1;
            info.OfficeCode = "000";
            info.UserName = "Migration System";
            return info;
        }
    }
}
