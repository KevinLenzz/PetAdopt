using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    internal class SelectedItem
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public Decimal Price { get; set; }
        public Decimal Total { get; set; }
    }
    public partial class UserItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                List<SelectedItem> selectedItem = new List<SelectedItem>();
                Session["selectedItemList"] = selectedItem;
                Session["totalPrice"] = 0;
                GridView2.DataSource = Session["selectedItemList"];
                GridView2.DataBind();
                conn.Close();
            }
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowindex = e.RowIndex;
            (Session["selectedItemList"] as List<SelectedItem>)[rowindex].Amount--;
            (Session["selectedItemList"] as List<SelectedItem>)[rowindex].Total -= (Session["selectedItemList"] as List<SelectedItem>)[rowindex].Price;
            Session["totalPrice"] = Convert.ToDecimal(Session["totalPrice"]) - (Session["selectedItemList"] as List<SelectedItem>)[rowindex].Price;
            if ((Session["selectedItemList"] as List<SelectedItem>)[rowindex].Amount == 0)
            {
                (Session["selectedItemList"] as List<SelectedItem>).RemoveAt(rowindex);
            }
            GridView2.DataSource = (Session["selectedItemList"] as List<SelectedItem>);
            GridView2.DataBind();
            Label1.Text = Session["totalPrice"].ToString();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow a = GridView1.SelectedRow;
            int idx = -1;
            int n = (Session["selectedItemList"] as List<SelectedItem>).Count;
            for (int i = 0; i < n; i++)
            {
                if ((Session["selectedItemList"] as List<SelectedItem>)[i].Code == a.Cells[1].Text)
                {
                    idx = i;
                }
            }
            if (idx == -1)
            {
                SelectedItem addItem = new SelectedItem();
                addItem.Code = a.Cells[1].Text;
                addItem.Name = a.Cells[3].Text;
                addItem.Amount = 1;
                addItem.Price = Convert.ToDecimal(a.Cells[4].Text.Remove(0, 6));
                addItem.Total = addItem.Price;
                (Session["selectedItemList"] as List<SelectedItem>).Add(addItem);
                Session["totalPrice"] = Convert.ToDecimal(Session["totalPrice"]) + addItem.Total;
                Label1.Text = Session["totalPrice"].ToString();
                GridView2.DataSource = (Session["selectedItemList"] as List<SelectedItem>);
                GridView2.DataBind();
            }
            else
            {
                (Session["selectedItemList"] as List<SelectedItem>)[idx].Amount++;
                (Session["selectedItemList"] as List<SelectedItem>)[idx].Total += (Session["selectedItemList"] as List<SelectedItem>)[idx].Price;
                Session["totalPrice"] = Convert.ToDecimal(Session["totalPrice"]) + (Session["selectedItemList"] as List<SelectedItem>)[idx].Price;
                GridView2.DataSource = (Session["selectedItemList"] as List<SelectedItem>);
                GridView2.DataBind();
                Label1.Text = Session["totalPrice"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["cart"+ Session["userCode"]] == null)
            {
                Session["cart"+ Session["userCode"]] = new List<SelectedItem>();
            }
            List<SelectedItem> selectedItemList = Session["selectedItemList"] as List<SelectedItem> ?? new List<SelectedItem>();
            List<SelectedItem> cart = Session["cart"+ Session["userCode"]] as List<SelectedItem> ?? new List<SelectedItem>();
            List<SelectedItem> tempList = new List<SelectedItem>(selectedItemList);
            foreach (SelectedItem tmp in tempList)
            {
                bool flag = false;
                SelectedItem tmp3=null;
                foreach (SelectedItem tmp2 in cart)
                {
                    if (tmp.Code==tmp2.Code)
                    {
                        flag = true;
                        tmp3 = tmp2;
                    }
                }
                if (flag)
                {
                    tmp3.Amount += tmp.Amount;
                    tmp3.Total += tmp.Total;
                }
                else
                {
                    cart.Add(tmp);
                }
                selectedItemList.Remove(tmp);
            }
            Session["cart"+ Session["userCode"]] = cart;
            Session["selectedItemList"] = selectedItemList;
            GridView2.DataSource = (Session["selectedItemList"] as List<SelectedItem>);
            GridView2.DataBind();
            Label1.Text ="0";
        }
        protected void CheckReview(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null)
            {
                Panel1.Visible = true;
                Panel2.Visible = true;
                Session["CheckingItem"]= Convert.ToInt32(btn.CommandArgument);
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

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=animalmanager;port=3306;password=123456");
            MySqlCommand cmd = new MySqlCommand("Insert Into review VALUES(@A,@B,@C,@D,@E)", conn);
            cmd.Parameters.AddWithValue("@A", Session["CheckingItem"]);
            cmd.Parameters.AddWithValue("@B",DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@C", Session["userName"]);
            cmd.Parameters.AddWithValue("@D",SendBox.Text);
            cmd.Parameters.AddWithValue("@E",DateTime.Now);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            SendBox.Text = "";
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            SendBox.Text = "";
        }
    }
}