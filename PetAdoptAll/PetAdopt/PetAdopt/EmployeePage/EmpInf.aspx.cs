using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.EmployeePage
{
    public partial class EmpInf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                String empCode = Convert.ToString(Session["empCode"]);
                MySqlCommand cmd = new MySqlCommand("Select * From employee Where employeeCode=@A", conn);
                cmd.Parameters.AddWithValue("@A", empCode);
                conn.Open();
                MySqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    Label1.Text = rd.GetInt32("employeeCode").ToString();
                    Label2.Text = rd.GetString("eplyName");
                    Label3.Text = rd.GetBoolean("isManager")?"是":"否";
                }
                conn.Close();
            }
        }
    }
}