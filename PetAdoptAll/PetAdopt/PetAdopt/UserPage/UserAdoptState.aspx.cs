using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt.UserPage
{
    public partial class UserAdopt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using(MySqlConnection conn= new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456"))
                {
                    MySqlCommand cmd = new MySqlCommand("Select petName,applyTime,adptState From adoption Join pet On adoption.petCode=pet.petCode Where userCode=@A",conn);
                    cmd.Parameters.AddWithValue("@A", Session["userCode"]);
                    conn.Open();
                    DataSet ds = new DataSet();
                    MySqlDataAdapter da = new MySqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(ds, "Adoptions");
                    GridView1.DataSource = ds.Tables["Adoptions"];
                    GridView1.DataBind();
                }
            }
        }
    }
}