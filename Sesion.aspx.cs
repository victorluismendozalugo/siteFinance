using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSystems2021
{
    public partial class Sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var myRequest = Request.QueryString["type"];
            var login = Request.QueryString["login"];

            string myResponse = "";

            switch (myRequest)
            {
                case "0":
                    myResponse = CreaVariables(login);
                    break;

            }
            Response.Expires = -1;
            Response.ContentType = "text/json";
            Response.Write(myResponse);
            Response.End();
        }

        public string CreaVariables(string login)
        {
            Session["login"] = login;
            string res = "";
            res = "{\"msg\":\"OK\"}";
            return res;

        }
    }
}