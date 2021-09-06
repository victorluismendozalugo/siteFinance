using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;

namespace WebSystems2021
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["login"] == "" || Session["login"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}