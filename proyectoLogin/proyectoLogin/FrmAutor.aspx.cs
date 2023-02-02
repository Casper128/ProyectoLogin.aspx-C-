using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using proyectoLogin.Models;
using proyectoLogin.Controllers;
using System.Data;

namespace proyectoLogin
{
    public partial class FrmAutor : System.Web.UI.Page
    {
        protected DataSet objDataSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usu"] == null) Response.Redirect("FrmLogin.aspx");
            ControlAutor objControlAutor = new ControlAutor();
            objDataSet = objControlAutor.Listar();
        }
        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("FrmLogin.aspx");
        }
        protected void btnGuardar(object sender, EventArgs e)
        {
            string nomAut = txtNomAutor.Text;
            Autor objAutor = new Autor(nomAut);
            ControlAutor objControlAutor = new ControlAutor(objAutor);
            objControlAutor.Guardar();
            objControlAutor.Listar();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            limpiar();

        }

        protected void btnModificar(object sender, EventArgs e)
        {
            string id = txtIdModDel.Text;
            string nomAut = txtNomAutor.Text;
            Autor objAutor = new Autor(id, nomAut);
            ControlAutor objControlAutor = new ControlAutor(objAutor);
            objControlAutor.Modificar();
            objControlAutor.Listar();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            limpiar();
        }
        
        protected void btnConsultar(object sender, EventArgs e)
        {

            string id = txtIdModDel.Text;
            Autor objAutor = new Autor(id, "");
            ControlAutor objControlAutor = new ControlAutor(objAutor);
            objAutor = objControlAutor.Consultar();
            txtIdModDel.Text = objAutor.Id;
            txtNomAutor.Text = objAutor.NomAutor;

        }
        protected void btnBorrar(object sender, EventArgs e)
        {
            string id = txtIdModDel.Text;
            Autor objAutor = new Autor(id,"");
            ControlAutor objControlAutor = new ControlAutor(objAutor);
            objControlAutor.Borrar();
            objControlAutor.Listar();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            limpiar();
        }

        public void limpiar()
        {
            txtIdModDel.Text = "";
            txtNomAutor.Text = "";
        }

    }
}