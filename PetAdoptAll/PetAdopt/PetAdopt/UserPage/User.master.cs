using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PetAdopt
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userCode"] == null)
            {
                string script = "alert('请登录'); window.location.href = '../Login.aspx';";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", script, true);
            }
        }
    }
}