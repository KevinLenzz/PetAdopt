using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace PetAdopt
{
    public partial class UserPetInf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select petCode,petName,breed,activeArea,profile,isAdoptable,isNeutered,pet.stateCode,updateTime,imageURL,position,usName From pet Join petstate ON pet.stateCode=petstate.stateCode Join user ON petstate.userCode=user.userCode", conn);
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Pets");
                MySqlDataReader rd = cmd.ExecuteReader();
                ListView1.DataSource = ds.Tables["Pets"];
                ListView1.DataBind();
                conn.Close();
            }
        }

        protected void Pet_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                string petCode = btn.CommandArgument;
                Session["pet2adopt"] = petCode;
                Response.Redirect("UserAdopt.aspx");
            }
        }
    }
}