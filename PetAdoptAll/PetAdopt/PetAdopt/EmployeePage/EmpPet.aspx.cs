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
    public partial class EmpPet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select petCode,petName,breed,activeArea,profile,isAdoptable,isNeutered,pet.stateCode,updateTime,imageURL,position,usName From pet Join petstate ON pet.stateCode=petstate.stateCode Join user ON petstate.userCode=user.userCode", conn);
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Pets1");
                ListView1.DataSource = ds.Tables["Pets1"];
                ListView1.DataBind();
                conn.Close();
                MySqlConnection conn1 = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd1 = new MySqlCommand("Select petCode,petName,breed,activeArea,profile,isAdoptable,isNeutered FROM pet WHERE stateCode IS NULL", conn);
                conn.Open();
                DataSet ds1 = new DataSet();
                MySqlDataAdapter da1 = new MySqlDataAdapter();
                da1.SelectCommand = cmd1;
                da1.Fill(ds1, "Pets2");
                ListView2.DataSource = ds1.Tables["Pets2"];
                ListView2.DataBind();
                conn.Close();
            }
        }
        protected void DeleteOnClick(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("DELETE FROM pet WHERE petCode=@A", conn);
                cmd.Parameters.AddWithValue("@A", Convert.ToInt32(btn.CommandArgument));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand cmd = new MySqlCommand("INSERT INTO pet(petName,breed,activeArea,profile,isAdoptable,isNeutered) VALUES(@PetName,@Breed,@ActiveArea,@Profile,@IsA,@IsN)", conn);
            cmd.Parameters.AddWithValue("@PetName",TextBox1.Text);
            cmd.Parameters.AddWithValue("@Breed", TextBox2.Text);
            cmd.Parameters.AddWithValue("@ActiveArea", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Profile", TextBox4.Text);
            cmd.Parameters.AddWithValue("@IsA", Convert.ToInt32(DropDownList1.SelectedValue));
            cmd.Parameters.AddWithValue("@IsN", Convert.ToInt32(DropDownList2.SelectedValue));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl, false);
            Context.ApplicationInstance.CompleteRequest();
            MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,CONCAT(@B,LAST_INSERT_ID()),@C)", conn);
            cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
            cmd3.Parameters.AddWithValue("@B", "添加动物：");
            cmd3.Parameters.AddWithValue("@C", DateTime.Now);
            conn.Open();
            cmd3.ExecuteNonQuery();
            conn.Close();
        }
    }
}