using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand MyCommand = new MySqlCommand("INSERT INTO `user` (usName,grade,gender,telephone,registerDate,pwd) values(@UserName,@Grade,@Gender,@Tele,NOW(),@Pwd);", conn);
                MyCommand.Parameters.AddWithValue("@UserName", UserNameTextBox.Text);
                MyCommand.Parameters.AddWithValue("@Grade", GradeDropDownList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@Gender", GenderRadioList.SelectedValue);
                MyCommand.Parameters.AddWithValue("@Tele", TelephoneTextBox.Text);
                MyCommand.Parameters.AddWithValue("@Pwd", PwdTextBox.Text);
                conn.Open();
                bool flag = true;
                try
                {
                    MyCommand.ExecuteNonQuery();
                }
                catch (MySqlException ex)
                {
                    flag = false;
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
                if (flag)
                {
                    MySqlCommand MyCommand2 = new MySqlCommand("Select userCode from user Where usName=@A", conn);
                    MyCommand2.Parameters.AddWithValue("@A", UserNameTextBox.Text);
                    MySqlDataReader rd = MyCommand2.ExecuteReader();
                    if (rd.HasRows)
                    {
                        rd.Read();
                        string script = "alert('您的账号是：" + rd.GetInt64(0).ToString() + "请牢记！');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        string script = "alert('获取账号失败');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                    }
                }
                conn.Close();
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}