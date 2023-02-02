using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proyectoLogin
{
    public partial class FrmMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usu"] == null) Response.Redirect("FrmLogin.aspx");
        }
        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
           Response.Redirect("FrmLogin.aspx");
        }
    }
}