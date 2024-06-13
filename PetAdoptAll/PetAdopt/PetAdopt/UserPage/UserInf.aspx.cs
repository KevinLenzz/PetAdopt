using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    public partial class UserInf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                TextBox2.ReadOnly = true;
                GradeDropDownList.Enabled = false;
                GenderRadioList.Enabled = false;
                TextBox5.ReadOnly = true;
                LoadData();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox2.ReadOnly = false;
            GradeDropDownList.Enabled = true;
            GenderRadioList.Enabled = true;
            TextBox5.ReadOnly = false;
            Button1.Visible = false;
            Button3.Visible = false;
            Button2.Visible = false;
            Button4.Visible = true;
            Button5.Visible = true;
        }
        protected void LoadData()
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            String userCode = Convert.ToString(Session["userCode"]);
            MySqlCommand cmd = new MySqlCommand("Select * From user Where userCode=@A", conn);
            cmd.Parameters.AddWithValue("@A", userCode);
            conn.Open();
            MySqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                Label8.Text = rd.GetInt32(0).ToString();
                TextBox2.Text = rd.GetString(1);
                GradeDropDownList.Text = rd.GetString(2);
                GenderRadioList.Text = rd.GetString(3);
                TextBox5.Text = rd.GetString(4);
                Label9.Text = rd.GetMySqlDateTime(5).ToString();
            }
            conn.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Button1.Visible = true;
            Button4.Visible = false;
            Button5.Visible = false;
            TextBox2.ReadOnly = true;
            GradeDropDownList.Enabled = false;
            GenderRadioList.Enabled = false;
            TextBox5.ReadOnly = true;
            Button3.Visible = true;
            Button2.Visible = true;
            LoadData();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand MyCommand = new MySqlCommand("UPDATE `user` SET usName=@UsName, grade=@Grade, gender=@Gender, telephone=@Tele WHERE userCode=@UserCode", conn);
                MyCommand.Parameters.AddWithValue("@UsName", TextBox2.Text);
                MyCommand.Parameters.AddWithValue("@Grade", GradeDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@Gender", GenderRadioList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@Tele", TextBox5.Text);
                MyCommand.Parameters.AddWithValue("@UserCode", Convert.ToInt32(Session["userCode"]));
                conn.Open();
                try
                {
                    MyCommand.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    if (ex.Number == 1062)
                    {
                        string script = "alert('该用户名已存在');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                    }
                    else
                    {
                        string script = "alert('未知错误');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                    }
                }
                conn.Close();
                Button1.Visible = true;
                Button4.Visible = false;
                Button5.Visible = false;
                TextBox2.ReadOnly = true;
                GradeDropDownList.Enabled = false;
                GenderRadioList.Enabled = false;
                TextBox5.ReadOnly = true;
                Button3.Visible = true;
                Button2.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label10.Visible = true;
            Button6.Visible = true;
            Button1.Visible = false;
            Button2.Visible = false;
            Button4.Visible = false;
            Button5.Visible = false;
            Button11.Visible = true;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand MyCommand = new MySqlCommand("DELETE FROM `user` WHERE userCode=@A", conn);
            MyCommand.Parameters.AddWithValue("@A", Convert.ToInt32(Session["userCode"]));
            conn.Open();
            MyCommand.ExecuteNonQuery();
            Session["userCode"] = null;
            Label10.Visible = false;
            Button6.Visible = false;
            Response.Redirect("~/Login.aspx");
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Visible = true;
            Button2.Visible = true;
            Button3.Visible = true;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Label10.Visible = false;
            Button6.Visible = false;
            Button1.Visible = true;
            Button2.Visible = true;
            Button11.Visible = false;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand MyCommand1 = new MySqlCommand("SELECT pwd FROM `user` WHERE userCode=@A", conn);
            MyCommand1.Parameters.AddWithValue("@A", Session["userCode"]);
            conn.Open();
            MySqlDataReader sqlDr = MyCommand1.ExecuteReader();
            if (sqlDr.Read())
            {
                String tmp=sqlDr.GetString("pwd");
                if (TextBox8.Text == tmp)
                {
                    MySqlCommand MyCommand2 = new MySqlCommand("UPDATE `user` SET pwd=@A WHERE userCode=@B", conn);
                    MyCommand2.Parameters.AddWithValue("@A", TextBox6.Text);
                    MyCommand2.Parameters.AddWithValue("@B", Convert.ToInt32(Session["userCode"]));
                    conn.Close();
                    conn.Open();
                    MyCommand2.ExecuteNonQuery();
                    conn.Close();
                    Panel1.Visible = false;
                    Button1.Visible = true;
                    Button2.Visible = true;
                    Button3.Visible = true;
                }
                else
                {
                    string script = "alert('旧密码错误');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                }
            }
            conn.Close();
        }
    }
}