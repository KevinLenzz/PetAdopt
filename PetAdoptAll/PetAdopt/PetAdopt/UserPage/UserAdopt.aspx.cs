using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.UserPage
{
    public partial class UserAdopt1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Session["pet2adopt"].ToString().Split('|')[1];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand MyCommand = new MySqlCommand("INSERT INTO adoption values(@PetCode,@UserCode,@ApplyTime,@IsAllowed);", conn);
                MyCommand.Parameters.AddWithValue("@PetCode", Session["pet2adopt"].ToString().Split('|')[0]);
                MyCommand.Parameters.AddWithValue("@UserCode", Session["userCode"]);
                MyCommand.Parameters.AddWithValue("@ApplyTime", DateTime.Now);
                MyCommand.Parameters.AddWithValue("@IsAllowed", "未审核");
                conn.Open();
                MyCommand.ExecuteNonQuery();
                string script = "alert('已提交申请'); window.location.href = 'UserPetInf.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                conn.Close();
            }
            catch (MySqlException expt)
            {
                if (expt.Number == 1062)
                {
                    string script = "alert('您之前已经提交过申请'); window.location.href = 'UserPetInf.aspx';";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
                }
                else throw expt;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPetInf.aspx");
        }
    }
}