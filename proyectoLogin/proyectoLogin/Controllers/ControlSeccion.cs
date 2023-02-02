using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlSeccion
    {

        String BDatos = "Sisevid";

        public void guardar(string fkSeccion)
        {
            string comandoSQL =
            String.Format("exec GuardarSeccion '{0}'", fkSeccion);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }

        public string consultar(string id)
        {
            string retornado = "";
            string comandoSQL =
            String.Format("SELECT tblarticulo.fkidseccion+'.'+tblseccion.titulo FROM dbo.DetalleEvidencias " +
            "INNER JOIN dbo.evidencia ON dbo.DetalleEvidencias.FkEvidenciaDetalle = dbo.evidencia.IdEvidencia " +
            "INNER JOIN dbo.tblarticulo ON dbo.DetalleEvidencias.FkArticulo = dbo.tblarticulo.id " +
            "INNER JOIN dbo.tblseccion ON dbo.tblarticulo.fkidseccion = dbo.tblseccion.id where evidencia.IdEvidencia='{0}'", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);

            if (objDataSet.Tables[0].Rows.Count >= 0)
            {
                retornado = objDataSet.Tables[0].Rows[0][0].ToString();
            }
            objControlConexion.cerrarBD();
            return retornado;
        }

        public void modificar(string id, string capitulo)
        {
            string comandoSQL =
            String.Format("exec ModificarSeccion '{0}', '{1}' ", id, capitulo);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }



        public DataSet Listar()
        {
            string comandoSQL = string.Format("SELECT * FROM TBLSECCION ORDER BY CAST(ID AS INT)");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
        }
    }
}