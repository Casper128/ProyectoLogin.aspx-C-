using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using proyectoLogin.Controllers;
using proyectoLogin.Models;

namespace proyectoLogin
{
    public partial class FrmEvidencia : System.Web.UI.Page
    {   
        
        protected DataSet objDataSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                //se ejecuta codigo solo en la primera carga de la página
                DataSet objDataSetArticulo = new DataSet();
                DataSet objDataSetCapitulo = new DataSet();
                DataSet objDataSetSeccion = new DataSet();
                DataSet objDataSetTitulo = new DataSet();
                DataSet objDataSetEstados = new DataSet();
                DataSet objDataSetAutores = new DataSet();
                ControlArticulo objControlArticulo = new ControlArticulo();
                ControlCapitulo objControlCapitulo = new ControlCapitulo();
                ControlSeccion objControlSeccion = new ControlSeccion();
                ControlTitulo objControlTitulo = new ControlTitulo();
                ControlEstado objControlEstado = new ControlEstado();
                ControlAutor objControlAutores = new ControlAutor();
                objDataSetArticulo = objControlArticulo.Listar();
                objDataSetCapitulo = objControlCapitulo.Listar();
                objDataSetSeccion = objControlSeccion.Listar();
                objDataSetTitulo = objControlTitulo.Listar();
                objDataSetEstados = objControlEstado.Listar();
                objDataSetAutores = objControlAutores.Listar();
                try
                {
                    for (int i = 0; i < objDataSetArticulo.Tables[0].Rows.Count; i++)
                    {
                        DropDownList1.Items.Add(objDataSetArticulo.Tables[0].Rows[i][0].ToString() + "." + objDataSetArticulo.Tables[0].Rows[i][1].ToString());
                    }
                    for (int i = 0; i < objDataSetCapitulo.Tables[0].Rows.Count; i++)
                    {
                        DropDownList2.Items.Add(objDataSetCapitulo.Tables[0].Rows[i][0].ToString() + "." + objDataSetCapitulo.Tables[0].Rows[i][1].ToString());
                    }
                    for (int i = 0; i < objDataSetSeccion.Tables[0].Rows.Count; i++)
                    {
                        DropDownList3.Items.Add(objDataSetSeccion.Tables[0].Rows[i][0].ToString() + "." + objDataSetSeccion.Tables[0].Rows[i][1].ToString());
                    }
                    for (int i = 0; i < objDataSetTitulo.Tables[0].Rows.Count; i++)
                    {
                        DropDownList4.Items.Add(objDataSetTitulo.Tables[0].Rows[i][0].ToString() + "." + objDataSetTitulo.Tables[0].Rows[i][1].ToString());
                    }
                    for (int i = 0; i < objDataSetEstados.Tables[0].Rows.Count; i++)
                    {
                        DropDownList5.Items.Add(objDataSetEstados.Tables[0].Rows[i][0].ToString() + "." + objDataSetEstados.Tables[0].Rows[i][1].ToString());
                    }
                    for (int i = 0; i < objDataSetAutores.Tables[0].Rows.Count; i++)
                    {
                        DropDownList6.Items.Add(objDataSetAutores.Tables[0].Rows[i][0].ToString() + "." + objDataSetAutores.Tables[0].Rows[i][1].ToString());
                    }

                }
                catch (Exception objException)
                {
                    //lblMensaje.Text = objException.Message;
                }
            }
            else
            {
                //se ejecuta codigo cuando es una recarga de la página
                try
                {

                }
                catch (Exception objException)
                {
                  // lblMensaje.Text = objException.Message;
                }
            }

            if (Session["usu"] == null) Response.Redirect("FrmLogin.aspx");
            ControlEvidencia objControlEvidencia = new  ControlEvidencia();
            objDataSet = objControlEvidencia.listar();
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("FrmLogin.aspx");
        }
        protected void Guardar(object sender, EventArgs e)
        {
            string titulo = txtTitulo.Text;
            string descrip = txtDescrip.Text;
            string tipo = txtTipo.Text;
            string fCreacion = txtFcreacion.Text;
            string fRegistro = txtFregistro.Text;
            string lat = txtLatitud.Text;
            string longi = txtLongitud.Text;
            string drop = DropDownList1.Text;
            string dropcapitulo = DropDownList2.Text;
            string dropseccion = DropDownList3.Text;
            string droptitulo = DropDownList4.Text;
            Evidencia objEvidencia = new Evidencia(titulo, descrip, tipo, fCreacion, fRegistro, lat, longi);
            ControlEvidencia objControlEvidencia = new ControlEvidencia(objEvidencia);
            ControlCapitulo objControlCapitulo = new ControlCapitulo();
            ControlSeccion objControlSeccion = new ControlSeccion();
            ControlTitulo objControlTitulo = new ControlTitulo();
            objControlEvidencia.guardar(drop);          
            objControlCapitulo.guardar(dropcapitulo);        
            objControlSeccion.guardar(dropseccion);
            objControlTitulo.guardar(droptitulo);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            objControlEvidencia.listar();
            limpiar();
        }

        protected void Modificar(object sender, EventArgs e)
        {
            string id = txtIdModDel.Text;
            string titulo = txtTitulo.Text;
            string descrip = txtDescrip.Text;
            string tipo = txtTipo.Text;
            string fCreacion = txtFcreacion.Text;
            string fRegistro = txtFregistro.Text;
            string lat = txtLatitud.Text;
            string longi = txtLongitud.Text;
            Evidencia objEvidencia = new Evidencia(id, titulo, descrip, tipo, fCreacion, fRegistro, lat, longi);
            ControlEvidencia objControlEvidencia = new ControlEvidencia(objEvidencia);
            ControlArticulo objControlArticulo = new ControlArticulo();
            ControlCapitulo objControlCapitulo = new ControlCapitulo();
            ControlSeccion objControlSeccion = new ControlSeccion();
            ControlTitulo objControlTitulo = new ControlTitulo();
            objControlEvidencia.modificar();
            objControlArticulo.modificar(id, DropDownList1.Text);
            objControlCapitulo.modificar(id, DropDownList2.Text);
            objControlSeccion.modificar(id, DropDownList3.Text);
            objControlTitulo.modificar(id, DropDownList4.Text);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            objControlEvidencia.listar();
            limpiar();
        }
      
        protected void Consultar(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            string cod = txtIdModDel.Text;
            Evidencia objEvidencia = new Evidencia(cod, "", "", "", "", "", "", "");
            ControlEvidencia objControlEvidencia = new ControlEvidencia(objEvidencia);
            ControlArticulo objControlArticulo = new ControlArticulo();
            ControlCapitulo objControlCapitulo = new ControlCapitulo();
            ControlSeccion objControlSeccion = new ControlSeccion();
            ControlTitulo objControlTitulo = new ControlTitulo();
            objEvidencia = objControlEvidencia.consultar();
            txtIdModDel.Text = objEvidencia.IdEvidencia;
            txtTitulo.Text = objEvidencia.Titulo1;
            txtDescrip.Text = objEvidencia.Descripcion1;
            txtTipo.Text = objEvidencia.Tipo;
            txtFcreacion.Text = objEvidencia.FCreacion1;
            txtFregistro.Text = objEvidencia.FRegistro1;
            txtLatitud.Text = objEvidencia.Latitud1;
            txtLongitud.Text = objEvidencia.Longitud1;
            DropDownList1.Text = objControlArticulo.consultar(cod);
            DropDownList2.Text= objControlCapitulo.consultar(cod);
            DropDownList3.Text = objControlSeccion.consultar(cod);
            DropDownList4.Text = objControlTitulo.consultar(cod);

            //Cargar list box con el listado de autores
            Autor objAutor = new Autor();
            string[] list = new string[20];
            ControlAutorEvidencia objControlAutorEvidencia = new ControlAutorEvidencia();
            int idEvidencia = Convert.ToInt32(txtIdModDel.Text);
            list = objControlAutorEvidencia.Consultar(idEvidencia) as string[];

            for (int i = 0; i < list.Length; i++)
            {
                ListBox1.Items.Add(list[i].ToString());
            }
        }

        protected void Borrar(object sender, EventArgs e)
        {
            string cod = txtIdModDel.Text;
            Evidencia objEvidencia = new Evidencia(cod, "", "", "", "", "", "", "");
            ControlEvidencia objControlEvidencia = new ControlEvidencia(objEvidencia);
            objControlEvidencia.borrar();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            objControlEvidencia.listar();
            limpiar();
        }
        public void limpiar()
        {
            txtIdModDel.Text = "";
            txtTitulo.Text = "";
            txtDescrip.Text = "";
            txtTipo.Text = "";
            txtFcreacion.Text = "";
            txtFregistro.Text = "";
            txtLatitud.Text = "";
            txtLongitud.Text = "";
        }
        protected void AgregarNuevoEstado(object sender, EventArgs e)
        {
            int cod = Convert.ToInt32( IdEviEst.Text);
            string dropestado = DropDownList5.Text;
            ControlEstado objControlEstado = new ControlEstado();
            objControlEstado.guardar(dropestado, cod);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            limpiar();
        }
        public void limpiar2()
        {
            IdEviEst.Text = "";
            DropDownList5.Text = "";
        }
        //Botones para CRUD autores tabla intermedia
        protected void BtnAgregarAutor(object sender, EventArgs e)
        {
            ListBox1.Items.Add(DropDownList6.Text);
            DropDownList6.Items.Remove(DropDownList6.Text);
        }
        protected void BtnBorrarAutor(object sender, EventArgs e)
            {
                ListBox1.Items.Remove(ListBox1.SelectedItem);
            }
        protected void BtnAutorGuardar(object sender, EventArgs e)
        {
            string[] list = new string[ListBox1.Items.Count];
            ControlAutorEvidencia objControlAutorEvidencia = new ControlAutorEvidencia();
            int idEvidencia = Convert.ToInt32(txtIdModDel.Text);

            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                int idAutor = Convert.ToInt32(ListBox1.Items[i].Value.ToString().Split('.')[0]);
                objControlAutorEvidencia.guardar(idAutor, idEvidencia); //Guarda los datos de las claves foráneas en la tabla intermedia tblrol_usuario
            }
            ListBox1.Items.Clear();
        }
        protected void BtnAutorModificar(object sender, EventArgs e)
        {
            int idEvidencia = Convert.ToInt32(txtIdModDel.Text);
            ControlAutorEvidencia objControlAutorEvidencia = new ControlAutorEvidencia();
            objControlAutorEvidencia.Borrar(idEvidencia);

            string[] list = new string[ListBox1.Items.Count];
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                int idAutor = Convert.ToInt32(ListBox1.Items[i].Value.ToString().Split('.')[0]);
                objControlAutorEvidencia.guardar(idAutor, idEvidencia); //Modifica los datos de las claves foráneas en la tabla intermedia tblrol_usuario
            }
            ListBox1.Items.Clear();
        }
        protected void BtnAutorBorrar(object sender, EventArgs e)
        {
            int idEvidencia = Convert.ToInt32(txtIdModDel.Text);
            ControlAutorEvidencia objControlAutorEvidencia = new ControlAutorEvidencia();
            objControlAutorEvidencia.Borrar(idEvidencia);
            ListBox1.Items.Clear();
        }


    }

}