using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.EmployeePage
{
    public partial class EmpAdoptApply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select userCode,petName,applyTime,adptState,adoption.petCode From adoption Join pet On adoption.petCode=pet.petCode", conn);
                DataSet ds = new DataSet();
                conn.Open();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Adoptions");
                GridView1.DataSource = ds.Tables["Adoptions"];
                GridView1.DataBind();
                conn.Close();
            }
        }
        protected void Refuse(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null) {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE adoption SET adptState='未通过' WHERE petCode=@PetCode AND userCode=@UserCode",conn);
                cmd.Parameters.AddWithValue("@PetCode", btn.CommandArgument.Split('|')[1]);
                cmd.Parameters.AddWithValue("@UserCode", btn.CommandArgument.Split('|')[0]);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
                conn.Close();
                MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,@B,@C)", conn);
                cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
                cmd3.Parameters.AddWithValue("@B", "拒绝用户领养申请：" + "PetCode：" + btn.CommandArgument.Split('|')[1] + " UserCode：" + btn.CommandArgument.Split('|')[0]);
                cmd3.Parameters.AddWithValue("@C", DateTime.Now);
                conn.Open();
                cmd3.ExecuteNonQuery();
                conn.Close();
            }
        }
        protected void Allow(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE adoption SET adptState='已通过' WHERE petCode=@PetCode AND userCode=@UserCode",conn);
                cmd.Parameters.AddWithValue("@PetCode", btn.CommandArgument.Split('|')[1]);
                cmd.Parameters.AddWithValue("@UserCode", btn.CommandArgument.Split('|')[0]);
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
                conn.Close();
                MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,@B,@C)", conn);
                cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
                cmd3.Parameters.AddWithValue("@B", "通过用户领养申请：" + "PetCode："+btn.CommandArgument.Split('|')[1]+ " UserCode："+btn.CommandArgument.Split('|')[0]);
                cmd3.Parameters.AddWithValue("@C", DateTime.Now);
                conn.Open();
                cmd3.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}