using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using proyectoLogin.Models;
using proyectoLogin.Controllers;
using System.Data;
using System.Reflection;
using System.Diagnostics.Contracts;
using System.Collections;
using Microsoft.Ajax.Utilities;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.Web.SessionState;



namespace proyectoLogin
{
    public partial class FrmRol : System.Web.UI.Page
    {
        ControlUsuario objControlUsuario = new ControlUsuario();
        ControlRol objControlRol = new ControlRol();
        DataSet objDataSetRoles = new DataSet();
        Usuario objUsuario = new Usuario();
        protected DataSet objDataSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string[] list = new string[4];
            list = HttpContext.Current.Session["acc"] as string[];  
            
            if (Session["usu"] == null) Response.Redirect("FrmLogin.aspx");//Valida si el usuario es nulo
            bool bandera = false;
            for (int i = 0; i < list.Length; i++) {
                if (Convert.ToInt32(list[i]) == 1) bandera = true;//Valida el rol del usurio
            }
            if (bandera == false) Response.Redirect("FrmMenu.aspx");//si no cumple el rol lo envia a menu

            //Listar los usuarios
            objDataSet = objControlUsuario.listar();
            if (!Page.IsPostBack)
            {
                //se ejecuta codigo solo en la primera carga de la página y carga los roles
                objDataSetRoles = objControlRol.Listar();
                for (int i = 0; i < objDataSetRoles.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(objDataSetRoles.Tables[0].Rows[i][0].ToString() + "." 
                        + objDataSetRoles.Tables[0].Rows[i][1].ToString());
                }
            }
           
        }
        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("FrmLogin.aspx");
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string nomUsu = txtUsuario.Text;
                string contra = txtContrasena.Text;

                Usuario objUsuario = new Usuario(nomUsu, contra);
                ControlUsuario objControlUsuario = new ControlUsuario(objUsuario);
                objControlUsuario.guardar(); //Guarda los datos de Usuario en tblUsuario

                RolUsuario[] arregloRolUsuario = new RolUsuario[ListBox1.Items.Count];
                for (int i = 0; i < ListBox1.Items.Count; i++)
                {
                    string id = ListBox1.Items[i].Value.ToString().Split(';')[0];
                    RolUsuario objRolUsuario = new RolUsuario(nomUsu, id);
                    arregloRolUsuario[i] = objRolUsuario;
                    ControlRolUsuario objControlRolUsuario = new ControlRolUsuario(arregloRolUsuario[i]);
                    objControlRolUsuario.guardar(); //Guarda los datos de las claves foráneas en la tabla intermedia tblrol_usuario
                }
            }
            catch (Exception objException)
            {
                lblMensaje.Text = objException.Message;
            }
            Response.Redirect("FrmRol.aspx"); //refresca la página
        }
        protected void BtnConsultar_Click(object sender, EventArgs e)
        {
            string IdUsu = txtIdUsu.Text;
            Usuario objUsuario = new Usuario(IdUsu,"","");
            ControlUsuario objControlUsuario = new ControlUsuario(objUsuario);
            objUsuario = objControlUsuario.consultar();
            txtIdUsu.Text = objUsuario.Id;
            txtUsuario.Text = objUsuario.NomUsuario;
            txtContrasena.Text = objUsuario.Contrasena;
            ListBox1.Items.Clear();
            RolUsuario objRolUsuario = new RolUsuario(IdUsu, "");
            ControlRolUsuario objControlRolUsuario = new ControlRolUsuario(objRolUsuario);
            DataSet objDataSetConsulta = objControlRolUsuario.consultarRoles_por_NomUsuario();
            txtContrasena.Text = objUsuario.Contrasena;
            txtRoles.Text = "";
            for (int i = 0; i < objDataSetConsulta.Tables[0].Rows.Count; i++)
            {
                ListBox1.Items.Add(objDataSetConsulta.Tables[0].Rows[i][0].ToString()+ "." + objDataSetConsulta.Tables[0].Rows[i][1].ToString());
            }
        }
        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            string nomUsu = txtUsuario.Text;
            string contra = txtContrasena.Text;

            Usuario objUsuario = new Usuario(nomUsu, contra);
            ControlUsuario objControlUsuario = new ControlUsuario(objUsuario);
            objControlUsuario.modificar();

            RolUsuario objRolUsuario = new RolUsuario(nomUsu,"");
            ControlRolUsuario objControlRolUsuario = new ControlRolUsuario(objRolUsuario);
            objControlRolUsuario.borrarDelNomUsuario();

            RolUsuario[] arregloRolUsuario = new RolUsuario[ListBox1.Items.Count];
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                string id = ListBox1.Items[i].Value.ToString().Split(';')[0];
                objRolUsuario = new RolUsuario(nomUsu, id);
                arregloRolUsuario[i] = objRolUsuario;
                objControlRolUsuario = new ControlRolUsuario(arregloRolUsuario[i]);
                objControlRolUsuario.guardar(); //Guarda los datos de las claves foráneas en la tabla intermedia tblrol_usuario
            }
            Response.Redirect("FrmUsuarios2.aspx"); //refresca la página
        }
        protected void BtnBorrar_Click(object sender, EventArgs e)
        {
            string cod = txtIdUsu.Text;
            Usuario objUsuario = new Usuario(cod, "", "");
            ControlUsuario objControlUsuario = new ControlUsuario(objUsuario);
            objControlUsuario.borrar();
            objControlUsuario.listar();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        protected void BtnAgregarRol_Click(object sender, EventArgs e)
        {

            ListBox1.Items.Add(DropDownList1.Text);
            DropDownList1.Items.Remove(DropDownList1.Text);

        }
        protected void BtnBorrarRol_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Remove(ListBox1.SelectedItem);
        }
    }
}
