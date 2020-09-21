using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace TestOrgchart
{
    public partial class TestForm : Form
    {
        public TestForm()
        {
            InitializeComponent();
        }

        private void btnShowChart_Click(object sender, EventArgs e)
        {
            ShowChart();
        }
        /// <summary>
        /// Generate the chart and link it to the pictorebox control
        /// </summary>
        private void ShowChart()
        {
            //Bitmap bmp =new Bitmap(Image.FromStream(myOrgChart.GenerateOrgChart(640, 480, "1001", System.Drawing.Imaging.ImageFormat.Bmp)));
            try
            {
                //bmp.Save(@"d:\temp\1.bmp");
                picOrgChart.Image = Image.FromStream(myOrgChart.GenerateOrgChart(800,-1,"1001", System.Drawing.Imaging.ImageFormat.Bmp));
                //picOrgChart.Image = Image.FromFile(@"d:\temp\1.bmp");
            }
            catch (Exception e)
            {
                
                //throw;
            }
        }
        private OrgChartGenerator.OrgChart myOrgChart;
        
        private void TestForm_Load(object sender, EventArgs e)
        {
            //Build the data for the org chart - this will be doen differently in real life. 
            //The DataTable will be filled from a database, probably.
            OrgChartGenerator.OrgData.OrgDetailsDataTable myOrgData = new OrgChartGenerator.OrgData.OrgDetailsDataTable();
            //myOrgData.AddOrgDetailsRow("1001", "Alon", "", "Manager");
            //myOrgData.AddOrgDetailsRow("2001", "Yoram", "1001", "Team Leader");
            //myOrgData.AddOrgDetailsRow("2002", "Dana", "1001", "Team Leader");
            //myOrgData.AddOrgDetailsRow("3001", "Moshe", "2003", "SW Engineer");
            //myOrgData.AddOrgDetailsRow("3002", "Oren", "2003", "SW Engineer");
            //myOrgData.AddOrgDetailsRow("3003", "Noa", "2003", "SW Engineer");
            //myOrgData.AddOrgDetailsRow("3004", "Mor", "2002", "Consultant");
            //myOrgData.AddOrgDetailsRow("3005", "Omer", "2002", "Consultant");
            //myOrgData.AddOrgDetailsRow("2003", "Avi", "1001", "Team Leader");
            //myOrgData.AddOrgDetailsRow("2004", "Esty", "1001", "Team Leader");
            //myOrgData.AddOrgDetailsRow("2005", "Danny", "1001", "Team Leader");
            //myOrgData.AddOrgDetailsRow("2006", "Shlomo", "1001", "Team Leader");
            //for (int a = 4001; a < 4005; a++)
            //{
            //    myOrgData.AddOrgDetailsRow(a.ToString(), "Name " + a.ToString(), "3002", "Consultant");
            //}
            //for (int a = 3006; a < 3010; a++)
            //{
            //    myOrgData.AddOrgDetailsRow(a.ToString(), "Name " + a.ToString(), "2005", "Consultant");
            //}
            myOrgData.AddOrgDetailsRow("1001", "Alon", "", "Manager");
            myOrgData.AddOrgDetailsRow("2001", "Yoram", "1001", "Team Leader");
            myOrgData.AddOrgDetailsRow("2002", "Dana", "1001", "Team Leader");
            myOrgData.AddOrgDetailsRow("3001", "Moshe", "2002", "SW Engineer");
            myOrgData.AddOrgDetailsRow("3002", "Oren", "2002", "SW Engineer");
            myOrgData.AddOrgDetailsRow("3003", "Noa", "3001", "SW Engineer");

            //myOrgData.AddOrgDetailsRow("2005", "Danny", "1001", "Team Leader");


            //instantiate the object
            myOrgChart = new OrgChartGenerator.OrgChart(myOrgData);
            SetControlValues();    
        }
        private void SetControlValues()
        {
            if (myOrgChart != null)
            {
                //lblBGColor.BackColor = myOrgChart.BGColor;
               // lblBoxFillColor.BackColor = myOrgChart.BoxFillColor;
               // lblFontColor.BackColor = myOrgChart.FontColor;
               // lblLineColor.BackColor = myOrgChart.LineColor;
                nudBoxHeight.Value = Convert.ToDecimal( myOrgChart.BoxHeight);
                nudBoxWidth.Value  = Convert.ToDecimal( myOrgChart.BoxWidth);
                nudFontSize.Value = Convert.ToDecimal( myOrgChart.FontSize);
                nudHorizontalSpace.Value = Convert.ToDecimal( myOrgChart.HorizontalSpace);
                nudLineWidth.Value =Convert.ToDecimal(  myOrgChart.LineWidth);
                nudMargin.Value =Convert.ToDecimal(  myOrgChart.Margin);
                nudVerticalSpace.Value = Convert.ToDecimal(myOrgChart.VerticalSpace);
            
            
            }
        
        }

        private void lblFontColor_Click(object sender, EventArgs e)
        {
            DialogResult result;

            result = colorDialog1.ShowDialog();

            if (result == DialogResult.Cancel)
                return;

            myOrgChart.FontColor = colorDialog1.Color;
            ShowChart();
        }

        private void lblBoxFillColor_Click(object sender, EventArgs e)
        {
            DialogResult result;

            result = colorDialog1.ShowDialog();

            if (result == DialogResult.Cancel)
                return;

            myOrgChart.BoxFillColor  = colorDialog1.Color;
            ShowChart();
        }

        private void lblLineColor_Click(object sender, EventArgs e)
        {
            DialogResult result;

            result = colorDialog1.ShowDialog();

            if (result == DialogResult.Cancel)
                return;

            myOrgChart.LineColor = colorDialog1.Color;
            ShowChart();
        }

        private void lblBGColor_Click(object sender, EventArgs e)
        {
            DialogResult result;

            result = colorDialog1.ShowDialog();

            if (result == DialogResult.Cancel)
                return;

            myOrgChart.BGColor = colorDialog1.Color;
            ShowChart();
        }

        private void nudLineWidth_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.LineWidth =(float) nudLineWidth.Value;
            ShowChart();
        }

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.FontSize = (int)nudFontSize.Value;
            ShowChart();
        }

        private void nudVerticalSpace_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.VerticalSpace = (int)nudVerticalSpace.Value;
            ShowChart();
        }

        private void nudHorizontalSpace_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.HorizontalSpace = (int)nudHorizontalSpace.Value;
            ShowChart();
        }

        private void nudMargin_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.Margin = (int)nudMargin.Value;
            ShowChart();
        }

        private void nudBoxHeight_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.BoxHeight = (int)nudBoxHeight.Value;
            ShowChart();
        }

        private void nudBoxWidth_ValueChanged(object sender, EventArgs e)
        {
            myOrgChart.BoxWidth = (int)nudBoxWidth.Value;
            ShowChart();
        }

        private void picOrgChart_MouseClick(object sender, MouseEventArgs e)
        {
            //determine if the mouse clicked on a box, if so, show the employee name.
            string SelectedEmployee = "No employee";
            foreach (OrgChartGenerator.OrgChartRecord EmpRec in myOrgChart.EmployeeData.Values)
            {
                if (e.X >= EmpRec.EmployeePos.Left &&
                    e.X <= EmpRec.EmployeePos.Right &&
                    e.Y >= EmpRec.EmployeePos.Top &&
                    e.Y <= EmpRec.EmployeePos.Bottom)
                {
                    SelectedEmployee = EmpRec.EmployeeData.EmployeeName;
                    break;
                }
            
            }
            MessageBox.Show(SelectedEmployee);
        }

       
    }
}