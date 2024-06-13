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
    internal class SelectedItem
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public Decimal Price { get; set; }
        public Decimal Total { get; set; }
    }
    public partial class EmpItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select itemCode,itemType,itemName,price,sales From item", conn);
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Items");
                GridView1.DataSource = ds.Tables["Items"];
                GridView1.DataBind();
                conn.Close();
            }
        }
        protected void CheckReview(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                Panel1.Visible = true;
                Session["CheckingItem"] = Convert.ToInt32(btn.CommandArgument);
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select * From review WHERE itemCode=@A;", conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@A", Convert.ToInt32(Session["CheckingItem"]));
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Reviews");
                ListView1.DataSource = ds.Tables["Reviews"];
                ListView1.DataBind();
                conn.Close();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand cmd = new MySqlCommand("DELETE FROM item WHERE itemCode=@A", conn);
            cmd.Parameters.AddWithValue("@A", e.Values["itemCode"]);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,@B,@C)", conn);
            cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
            cmd3.Parameters.AddWithValue("@B", "删除商品："+ e.Values["itemCode"]);
            cmd3.Parameters.AddWithValue("@C", DateTime.Now);
            conn.Open();
            cmd3.ExecuteNonQuery();
            conn.Close();
            MySqlCommand cmd1 = new MySqlCommand("Select itemCode,itemType,itemName,price,sales From item", conn);
            conn.Open();
            DataSet ds = new DataSet();
            MySqlDataAdapter da = new MySqlDataAdapter();
            da.SelectCommand = cmd1;
            da.Fill(ds, "Items");
            GridView1.DataSource = ds.Tables["Items"];
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand cmd = new MySqlCommand("INSERT INTO item(itemType,itemName,price,sales) VALUES(@A,@B,@C,@D)", conn);
            cmd.Parameters.AddWithValue("@A",TextBox1.Text);
            cmd.Parameters.AddWithValue("@B", TextBox2.Text);
            cmd.Parameters.AddWithValue("@C", TextBox3.Text);
            cmd.Parameters.AddWithValue("@D", 0);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl, false);
            Context.ApplicationInstance.CompleteRequest();
            MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,CONCAT(@B,LAST_INSERT_ID()),@C)", conn);
            cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
            cmd3.Parameters.AddWithValue("@B", "添加商品：");
            cmd3.Parameters.AddWithValue("@C", DateTime.Now);
            conn.Open();
            cmd3.ExecuteNonQuery();
            conn.Close();
        }
    }
}