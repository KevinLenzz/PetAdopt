using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.EmployeePage
{
    public partial class Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection conn1 = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand cmd1 = new MySqlCommand("Select isManager From employee WHERE employeeCode=@A", conn1);
            cmd1.Parameters.AddWithValue("@A", Session["empCode"]);
            conn1.Open();
            MySqlDataReader sqlDr = cmd1.ExecuteReader();
            if (sqlDr.Read())
            {
                if (!sqlDr.GetBoolean("isManager"))
                {
                    string script = "alert('您不是管理员，无权进入该页'); window.location.href = 'EmpHome.aspx';";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                }
            }
            else
            {
                string script = "alert('您不是管理员，无权进入该页'); window.location.href = 'EmpHome.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                Response.Redirect("EmpHome.aspx");
            }
            conn1.Close();
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select * From employee", conn);
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Emp");
                GridView1.DataSource = ds.Tables["Emp"];
                GridView1.DataBind();
                conn.Close();
            }
        }
        protected void CheckTrack(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null) {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select * From employeetrack WHERE employeeCode=@A", conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@A",btn.CommandArgument);
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "EmpTrack");
                ListView1.DataSource = ds.Tables["EmpTrack"];
                ListView1.DataBind();
                conn.Close();
            }
        }
    }
}