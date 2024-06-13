using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand MyCommand = new MySqlCommand("SELECT * FROM `user` WHERE userCode=@A", conn);
                MyCommand.Parameters.AddWithValue("@A", UserCodeTextBox.Text);
                conn.Open();
                MySqlDataReader sqlDr = MyCommand.ExecuteReader();
                if (sqlDr.Read())
                {
                    MySqlCommand newCommand = new MySqlCommand("SELECT * FROM `user` WHERE userCode=@C AND pwd=@B", conn);
                    newCommand.Parameters.AddWithValue("@C", UserCodeTextBox.Text);
                    newCommand.Parameters.AddWithValue("@B", PassWordTextBox.Text);
                    sqlDr.Close();
                    MySqlDataReader sqlDr2 = newCommand.ExecuteReader();
                    if (sqlDr2.Read())
                    {
                        Session["userCode"] = UserCodeTextBox.Text;
                        Session["userName"] = sqlDr2.GetString("usName");
                        Response.Redirect("~/UserPage/UserHome.aspx");
                    }
                    else
                    {
                        Label1.Text = "密码错误";
                    }
                    sqlDr2.Close();
                }
                else
                {
                    Label1.Text = "账号错误";
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Console.WriteLine("Cannot connect Mysql:"+ex);
            }
        }

        protected void ToRigisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void EmpLogin_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand MyCommand = new MySqlCommand("SELECT * FROM employee WHERE employeeCode=@A", conn);
                MyCommand.Parameters.AddWithValue("@A", UserCodeTextBox.Text);
                conn.Open();
                MySqlDataReader sqlDr = MyCommand.ExecuteReader();
                if (sqlDr.Read())
                {
                    MySqlCommand newCommand = new MySqlCommand("SELECT * FROM employee WHERE employeeCode=@C AND pwd=@B", conn);
                    newCommand.Parameters.AddWithValue("@C", UserCodeTextBox.Text);
                    newCommand.Parameters.AddWithValue("@B", PassWordTextBox.Text);
                    sqlDr.Close();
                    MySqlDataReader sqlDr2 = newCommand.ExecuteReader();
                    if (sqlDr2.Read())
                    {
                        Session["empCode"] = UserCodeTextBox.Text;
                        Response.Redirect("~/EmployeePage/EmpHome.aspx");
                    }
                    else
                    {
                        Label1.Text = "员工密码错误";
                    }
                    sqlDr2.Close();
                }
                else
                {
                    Label1.Text = "员工账号错误";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Cannot connect Mysql:" + ex);
            }
        }
    }
}