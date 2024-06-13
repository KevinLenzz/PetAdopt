using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    public partial class UserCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = Session["cart" + Session["userCode"]] as List<SelectedItem>;
                GridView1.DataBind();
                Decimal c = 0;
                Label2.Text = "0";
                if (Session["cart" + Session["userCode"]] != null)
                {
                    foreach (SelectedItem a in (Session["cart" + Session["userCode"]] as List<SelectedItem>))
                    {
                        c += a.Total;
                    }
                    Label2.Text = c.ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            conn.Open();
            MySqlCommand MyCommand = new MySqlCommand("INSERT INTO `order` (userCode,targetAddress,orderTime,orderState) values(@UserCode,@Target,@Time,@State);", conn);
            MyCommand.Parameters.AddWithValue("@UserCode", Convert.ToInt32(Session["userCode"]));
            MyCommand.Parameters.AddWithValue("@Target", TextBox1.Text);
            MyCommand.Parameters.AddWithValue("@Time", DateTime.Now);
            MyCommand.Parameters.AddWithValue("@State", "商家未确认");
            MySqlCommand cmdSelect = new MySqlCommand("SELECT LAST_INSERT_ID()", conn);
            MyCommand.ExecuteNonQuery();
            int lastInsertId = Convert.ToInt32(cmdSelect.ExecuteScalar());
            foreach (SelectedItem item in (Session["cart"+ Session["userCode"]] as List<SelectedItem>))
            {
                MySqlCommand one = new MySqlCommand("INSERT INTO orderdetail (orderCode,itemCode,amount) values(@OrderCode,@ItemCode,@Amount);", conn);
                one.Parameters.AddWithValue("@OrderCode", lastInsertId);
                one.Parameters.AddWithValue("@ItemCode", item.Code);
                one.Parameters.AddWithValue("@Amount", item.Amount);
                one.ExecuteNonQuery();
                MySqlCommand two = new MySqlCommand("UPDATE item SET sales=sales+@Amount WHERE itemCode=@ItemCode", conn);
                two.Parameters.AddWithValue("@ItemCode", item.Code);
                two.Parameters.AddWithValue("@Amount", item.Amount);
                two.ExecuteNonQuery();
            }
            string script = "alert('购买成功'); window.location.href = 'UserHome.aspx';";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            (Session["cart"+ Session["userCode"]] as List<SelectedItem>).Clear();
            GridView1.DataSource = Session["cart"+ Session["userCode"]] as List<SelectedItem>;
            GridView1.DataBind();
            Label2.Text = "0";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowindex = e.RowIndex;
            Label2.Text = (Convert.ToDecimal(Label2.Text) - (Session["cart" + Session["userCode"]] as List<SelectedItem>)[rowindex].Total).ToString();
            (Session["cart" + Session["userCode"]] as List<SelectedItem>).RemoveAt(rowindex);
            GridView1.DataSource = Session["cart" + Session["userCode"]] as List<SelectedItem>;
            GridView1.DataBind();
        }
    }
}