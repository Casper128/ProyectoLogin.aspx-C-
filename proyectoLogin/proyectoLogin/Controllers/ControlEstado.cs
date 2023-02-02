using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlEstado
    {

        String BDatos = "Sisevid";

        int usuario = Convert.ToInt32(HttpContext.Current.Session["usu"] as string);

        public void guardar(string FkEstado, int FkEvidencia )
        {

            string comandoSQL =
            String.Format("exec GuardarNuevoEstado '{0}',{1},{2}", FkEstado, FkEvidencia, usuario);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }

   

        public void modificar(string id, string articulo)
        {
          
        }
        public DataSet Listar()
        {
            string comandoSQL = string.Format("SELECT * FROM ESTADOS");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
        }
    }
}
