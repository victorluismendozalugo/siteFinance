using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

namespace WebSystems2021
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty((string)Session["login"]))
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }

            try
            {

                if (!Page.IsPostBack)
                {
                    Session.Clear();
                }

            }
            catch (Exception Ex)
            { throw Ex; }
        }
    }
}
//protected void btnEntrar_Click(object sender, EventArgs e)
//{
//    try
//    {

//        Usuarios Usuario = new Usuarios();
//        Usuario.CodigoUsuario = txtUsuario.Text;
//        Usuario.Password = txtPassword.Text;

//        Boolean UsuarioActivo = Usuarios.Autenticar(Usuario.CodigoUsuario, Usuario.Password);
//        if (UsuarioActivo == true)
//        {
//            Session["Usuario"] = Usuario.CodigoUsuario;
//            Response.Redirect("Default.aspx", false);
//            //Response.Redirect("/QuirogaWeb/QW_US/QW_US_AdministraUsuarios.aspx", false);
//        }
//        else
//        {
//            MsgBox("Usuario/Contraseña no registrado, verifique información.", "warning");

//        }

//    }
//    catch (Exception Ex)
//    { throw Ex; }
//}

//private void MsgBox(string Mensaje, string Tipo)
//{
//    ClientScript.RegisterStartupScript(GetType(), "MsgBox", "MsgBox('" + Mensaje + "','" + Tipo + "')", true);
//}

//End Class

//End Namespace