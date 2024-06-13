using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.EmployeePage
{
    public partial class EmpPetState : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                    string[] allowedTypes = { "image/jpeg", "image/jpg", "image/png"};
                    bool isValidType = false;
                    foreach (string allowedType in allowedTypes)
                    {
                        if (FileUpload1.PostedFile.ContentType == allowedType)
                        {
                            isValidType = true;
                            break;
                        }
                    }
                    if (isValidType)
                    {
                        try
                        {
                            string filename = Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/PetImage/" + filename));
                            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                            MySqlCommand cmd = new MySqlCommand("INSERT INTO petState(userCode,updateTime,imageURL,position) VALUES(@A,@B,@C,@D)", conn);
                            cmd.Parameters.AddWithValue("@A", Convert.ToInt32(TextBox1.Text));
                            cmd.Parameters.AddWithValue("@B", DateTime.Now);
                            cmd.Parameters.AddWithValue("@C", filename);
                            cmd.Parameters.AddWithValue("@D", TextBox3.Text);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                            MySqlCommand cmd2 = new MySqlCommand("UPDATE pet SET stateCode = LAST_INSERT_ID() WHERE petCode=@B", conn);
                            cmd2.Parameters.AddWithValue("@B", TextBox2.Text);
                            conn.Open();
                            cmd2.ExecuteNonQuery();
                            conn.Close();
                            string script = "alert('提交成功');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                            MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,CONCAT(@B,LAST_INSERT_ID()),@C)", conn);
                            cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
                            cmd3.Parameters.AddWithValue("@B", "添加动物状态：");
                            cmd3.Parameters.AddWithValue("@C", DateTime.Now);
                            conn.Open();
                            cmd3.ExecuteNonQuery();
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            string script = "alert('用户不存在');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                        }
                    }
                    else
                    {
                        string script = "alert('请选择图片类型（jpeg、jpg、png）的文件');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                    }
            }
            else
            {
                string script = "alert('请选择文件');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
            }
        }
    }
}