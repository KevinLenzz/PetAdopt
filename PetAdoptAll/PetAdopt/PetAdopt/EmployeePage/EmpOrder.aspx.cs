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
    public partial class EmpOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select userCode,orderCode,targetAddress,orderTime,orderState from `order`", conn);
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "Orders");
                ListView1.DataSource = ds.Tables["Orders"];
                ListView1.DataBind();
                conn.Close();
            }
        }
        protected void ButtonClick(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string orderCode;
            if (btn != null)
            {
                ListViewDataItem dataItem = (ListViewDataItem)ListView1.Items[Convert.ToInt32(btn.CommandArgument.Split('|')[1])];
                Panel panelGridView = (Panel)dataItem.FindControl("panelGridView");
                orderCode = btn.CommandArgument.Split('|')[0];
                panelGridView.Controls.Clear();
                GridView gridView = new GridView();
                gridView.ID = "GridView" + orderCode;
                gridView.AutoGenerateColumns = true;
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("Select itemName as 商品名,amount as 商品数量 from orderdetail join item on orderdetail.itemCode=item.itemCode where orderCode=@A", conn);
                cmd.Parameters.AddWithValue("@A", Convert.ToInt32(orderCode));
                conn.Open();
                DataSet ds = new DataSet();
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds, "ItemDetail");
                gridView.DataSource = ds.Tables["ItemDetail"];
                gridView.DataBind();
                panelGridView.Controls.Add(gridView);
                conn.Close();
            }
        }
        protected void ButtonClick2(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("UPDATE `order` SET orderState='商家已确认' WHERE orderCode=@A", conn);
                cmd.Parameters.AddWithValue("@A", Convert.ToInt32(btn.CommandArgument));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
                MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,@B,@C)", conn);
                cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
                cmd3.Parameters.AddWithValue("@B", "确认订单："+ Convert.ToInt32(btn.CommandArgument));
                cmd3.Parameters.AddWithValue("@C", DateTime.Now);
                conn.Open();
                cmd3.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void ButtonClick3(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
                MySqlCommand cmd = new MySqlCommand("UPDATE `order` SET orderState='订单已到货' WHERE orderCode=@A", conn);
                cmd.Parameters.AddWithValue("@A", Convert.ToInt32(btn.CommandArgument));
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(Request.RawUrl, false);
                Context.ApplicationInstance.CompleteRequest();
                MySqlCommand cmd3 = new MySqlCommand("INSERT INTO employeetrack VALUES(@A,@B,@C)", conn);
                cmd3.Parameters.AddWithValue("@A", Session["empCode"]);
                cmd3.Parameters.AddWithValue("@B", "设置订单到货：" + Convert.ToInt32(btn.CommandArgument));
                cmd3.Parameters.AddWithValue("@C", DateTime.Now);
                conn.Open();
                cmd3.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}