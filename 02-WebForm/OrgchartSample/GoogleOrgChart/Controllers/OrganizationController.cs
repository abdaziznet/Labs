using GoogleOrgChart.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;

namespace GoogleOrgChart.Controllers
{
    public class OrganizationController : Controller
    {
        //
        // GET: /Organization/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetOrganizationData()
        {
            List<GoogleOrgData> g = new List<GoogleOrgData>();
            DataTable myData = getDataTable();

            foreach (DataRow row in myData.Rows)
            {
                string empName = row["EmployeeName"].ToString();
                var mgrName = row["ManagerName"].ToString();
                var mgrID = row["ManagerId"].ToString();
                var empID = row["EmployeeId"].ToString();
                var designation = row["designation"].ToString();

                g.Add(new GoogleOrgData
                {
                    Employee = empName,
                    Manager = mgrName,
                    mgrID = mgrID,
                    empID = empID,
                    designation = designation
                });
            }


            return Json(new
            {
                orgData = g
            }, JsonRequestBehavior.AllowGet);
        }

        public List<GoogleOrgData> getOrgData()
        {
            List<GoogleOrgData> g = new List<GoogleOrgData>();
            DataTable myData = getDataTable();

            //g.Add(new GoogleOrgData
            //{
            //    Employee = "Rocky Balboa",
            //    Manager = "",
            //    mgrID = "",
            //    empID = "4",
            //    designation = "CEO"
            //});

            foreach (DataRow row in myData.Rows)
            {
                string empName = row["EmpName"].ToString();
                var mgrName = row["MgrName"].ToString();
                var mgrID = row["mgrID"].ToString();
                var empID = row["empID"].ToString();
                var designation = row["designation"].ToString();

                g.Add(new GoogleOrgData
                {
                    Employee = empName,
                    Manager = mgrName,
                    mgrID = mgrID,
                    empID = empID,
                    designation = designation
                });
            }
            return g;
        }


        public DataTable getDataTable()
        {
            DataTable dt = new DataTable();
            string query = "SELECT a.employee_name as EmployeeName, a.id_emp as EmployeeId, a.designation, b.employee_name as ManagerName, b.id_emp as ManagerId";
            query += " FROM dbo.employee as a INNER JOIN dbo.employee as b ON a.manager_id = b.id_emp";
            string connectionString = "Persist Security Info=False;User ID=sa;Password=P@ssw0rd;Initial Catalog=OrgChart;Data Source=ABDAZIZ";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlDataAdapter dap = new SqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                dap.Fill(ds);
                return ds.Tables[0];
            }

        }

    }
}