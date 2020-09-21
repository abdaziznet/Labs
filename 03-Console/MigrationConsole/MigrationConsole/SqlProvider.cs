using MigrationConsole.FingerPrintService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MigrationConsole
{
    public class SqlProvider
    {
        public List<MultipleEnrollmentInfo> GetEnrollmentCollection()
        {
            SqlDataReader reader = null;
            try
            {
                string constring = "Persist Security Info=False;User ID=sa;Password=P@ssw0rd;Initial Catalog=ivtfsdb;Data Source=ABDAZIZ";
                using (SqlConnection connection = new SqlConnection(constring))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand("[dbo].[usp_GetSendMigration]", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        reader = command.ExecuteReader();
                        return GetEnrollColletionMapper(reader);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                if (reader != null)
                    reader.Dispose();


            }

        }

        private List<MultipleEnrollmentInfo> GetEnrollColletionMapper(SqlDataReader reader)
        {
            List<MultipleEnrollmentInfo> enrollCollection = new List<MultipleEnrollmentInfo>();
            while (reader.Read())
            {
                MultipleEnrollmentInfo enroll = new MultipleEnrollmentInfo();
                enroll.NIP = reader["NIP"] != DBNull.Value ? reader["NIP"].ToString() : string.Empty;
                enroll.Name = reader["Name"] != DBNull.Value ? reader["Name"].ToString() : string.Empty;
                enroll.CategoryId = Convert.ToInt16(reader["CategoryId"]);
                enroll.GroupId = Convert.ToInt32(reader["GroupId"]);
                enroll.Quality = Convert.ToInt16(reader["Quality"]);
                enroll.SubType = Convert.ToInt16(reader["SubType"]);
                enroll.UserCategory = Convert.ToInt16(reader["UserCategory"]);
                enroll.UserFAR = Convert.ToInt16(reader["UserFAR"]);
                enroll.UserType = Convert.ToInt16(reader["UserType"]);
                enroll.FPId = Convert.ToInt16(reader["FPId"]);
                enroll.FSImages0 = reader["FSImages0"] != DBNull.Value ? reader["FSImages0"].ToString() : string.Empty;
                enroll.FSImages1 = reader["FSImages1"] != DBNull.Value ? reader["FSImages1"].ToString() : string.Empty;
                enroll.FSImages2 = reader["FSImages2"] != DBNull.Value ? reader["FSImages2"].ToString() : string.Empty;
                enroll.FSImages3 = reader["FSImages3"] != DBNull.Value ? reader["FSImages3"].ToString() : string.Empty;
                enroll.FSImages4 = reader["FSImages4"] != DBNull.Value ? reader["FSImages4"].ToString() : string.Empty;
                enroll.FSImages5 = reader["FSImages5"] != DBNull.Value ? reader["FSImages5"].ToString() : string.Empty;
                enroll.FSImages6 = reader["FSImages6"] != DBNull.Value ? reader["FSImages6"].ToString() : string.Empty;
                enroll.FSImages7 = reader["FSImages7"] != DBNull.Value ? reader["FSImages7"].ToString() : string.Empty;
                enroll.FSImages8 = reader["FSImages8"] != DBNull.Value ? reader["FSImages8"].ToString() : string.Empty;
                enroll.FSImages9 = reader["FSImages9"] != DBNull.Value ? reader["FSImages9"].ToString() : string.Empty;
                enroll.FSImagesIndex = Convert.ToInt16(reader["FSImagesIndex"]);
                enroll.ImageMap = Convert.ToInt16(reader["ImageMap"]);
                enroll.MainBranchCode = reader["MainBranchCode"] != DBNull.Value ? reader["MainBranchCode"].ToString() : string.Empty;
                enroll.MainOfficeCode = reader["MainOfficeCode"] != DBNull.Value ? reader["MainOfficeCode"].ToString() : string.Empty;
                enroll.SourceIP = reader["SourceIP"] != DBNull.Value ? reader["SourceIP"].ToString() : string.Empty;
                enroll.SourceIPType = Convert.ToInt16(reader["SourceIPType"]);
                enroll.SourceName = reader["SourceName"] != DBNull.Value ? reader["SourceName"].ToString() : string.Empty;
                enroll.template = reader["template"] != DBNull.Value ? reader["template"].ToString() : string.Empty;
                enroll.TemplateLayout = reader["TemplateLayout"] != DBNull.Value ? reader["TemplateLayout"].ToString() : string.Empty;
                enroll.BDS1 = reader["BDS1"] != DBNull.Value ? reader["BDS1"].ToString() : string.Empty;
                enroll.BDS2 = reader["BDS2"] != DBNull.Value ? reader["BDS2"].ToString() : string.Empty;
                enroll.BDS3 = reader["BDS3"] != DBNull.Value ? reader["BDS3"].ToString() : string.Empty;
                enroll.BDS4 = reader["BDS4"] != DBNull.Value ? reader["BDS4"].ToString() : string.Empty;
                enroll.BDS5 = reader["BDS5"] != DBNull.Value ? reader["BDS5"].ToString() : string.Empty;
                enroll.BDS6 = reader["BDS6"] != DBNull.Value ? reader["BDS6"].ToString() : string.Empty;
                enroll.BDS7 = reader["BDS7"] != DBNull.Value ? reader["BDS7"].ToString() : string.Empty;
                enroll.BDS8 = reader["BDS8"] != DBNull.Value ? reader["BDS8"].ToString() : string.Empty;
                enroll.BDS9 = reader["BDS9"] != DBNull.Value ? reader["BDS9"].ToString() : string.Empty;
                enroll.BDS10 = reader["BDS10"] != DBNull.Value ? reader["BDS10"].ToString() : string.Empty;
                enroll.CreatedBy = reader["CreatedBy"] != DBNull.Value ? reader["CreatedBy"].ToString() : string.Empty;
                enrollCollection.Add(enroll);
            }

            return enrollCollection;
        }
    }
}
