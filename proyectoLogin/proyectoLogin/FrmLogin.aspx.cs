using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using proyectoLogin.Models;
using proyectoLogin.Controllers;
using System.Web.SessionState;
using Microsoft.Ajax.Utilities;
using System.Web.Http;

namespace proyectoLogin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            string nomUsu = txtNomUsuario.Text;
            string contra = txtContrasena.Text;
            Usuario objUsuario = new Usuario(nomUsu, contra);
            ControlUsuario objControlUsuario = new ControlUsuario(objUsuario);
            bool esValido = objControlUsuario.validar();
            if (esValido)
            {
                Session["usu"] = objUsuario.Id;
                Session["acc"] = objUsuario.Acceso;
                Response.Redirect("FrmMenu.aspx");
            }
        }

    }
}