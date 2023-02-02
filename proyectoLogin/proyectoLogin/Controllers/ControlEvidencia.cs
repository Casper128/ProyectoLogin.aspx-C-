using proyectoLogin.Controllers;
using proyectoLogin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;


namespace proyectoLogin.Controllers
{   
    public class ControlEvidencia
    {
        Evidencia objEvidencia;
        String BDatos = "Sisevid";
        public ControlEvidencia()
        {
            this.objEvidencia = null;
        }
        public ControlEvidencia(Evidencia objEvidencia)
        {
            this.objEvidencia = objEvidencia;
        }
        public void guardar(string fkArticulo)
        {
            string titulo = objEvidencia.Titulo1;
            string descrip = objEvidencia.Descripcion1;
            string tipo = objEvidencia.Tipo;
            string fCreacion = objEvidencia.FCreacion1;
            string fRegistro = objEvidencia.FRegistro1;
            string lat = objEvidencia.Latitud1;
            string longi = objEvidencia.Longitud1;

            int usuario = Convert.ToInt32( HttpContext.Current.Session["usu"] as string);

            string comandoSQL =
            String.Format("INSERT INTO evidencia VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')" +
            "exec LlenarTablaEstados '{7}','{8}'", titulo, descrip, tipo, fCreacion, fRegistro, lat, longi,usuario,fkArticulo);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public Evidencia consultar()
        {
            int id = Convert.ToInt16(objEvidencia.IdEvidencia);
            string comandoSQL =
            String.Format("SELECT * FROM EVIDENCIA WHERE IDEVIDENCIA='{0}'", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            if (objDataSet.Tables[0].Rows.Count >= 0)
            {
                objEvidencia.IdEvidencia = objDataSet.Tables[0].Rows[0][0].ToString();
                objEvidencia.Titulo1 = objDataSet.Tables[0].Rows[0][1].ToString();
                objEvidencia.Descripcion1 = objDataSet.Tables[0].Rows[0][2].ToString();
                objEvidencia.Tipo = objDataSet.Tables[0].Rows[0][3].ToString();
                objEvidencia.FCreacion1 = objDataSet.Tables[0].Rows[0][4].ToString();
                objEvidencia.FRegistro1 = objDataSet.Tables[0].Rows[0][5].ToString();
                objEvidencia.Latitud1 = objDataSet.Tables[0].Rows[0][6].ToString();
                objEvidencia.Longitud1 = objDataSet.Tables[0].Rows[0][7].ToString();
            }
            objControlConexion.cerrarBD();
            return objEvidencia;

        }
        public void modificar()
        {
            int id = Convert.ToInt32(objEvidencia.IdEvidencia);
            string titulo = objEvidencia.Titulo1;
            string descrip = objEvidencia.Descripcion1;
            string tipo = objEvidencia.Tipo;
            string fCreacion = objEvidencia.FCreacion1;
            string fRegistro = objEvidencia.FRegistro1;
            string lat = objEvidencia.Latitud1;
            string longi = objEvidencia.Longitud1;
            string comandoSQL =
            String.Format("UPDATE EVIDENCIA SET TITULO='{0}',DESCRIPCION='{1}',TIPO='{2}',FECHACREACION='{3}',FECHAREGISTRO='{4}', LATITUD='{5}',LONGITUD='{6}' WHERE IDEVIDENCIA='{7}'", titulo, descrip, tipo, fCreacion, fRegistro, lat, longi, id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();

        }

        public void borrar()
        {
            int cod = Convert.ToInt32(objEvidencia.IdEvidencia);
            string comandoSQL = String.Format("DELETE FROM DetalleEstado WHERE FKEVIDENCIA='{0}' " +
                "and IdDetalle=(SELECT max(IdDetalle) FROM DetalleEstado where FkEvidencia='{0}')"+
                "DELETE FROM EVIDENCIA WHERE IDEVIDENCIA='{0}'", cod);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }


        public DataSet listar()
        {
            string comandoSQL =
            String.Format("select * from Vista_tabla_Evidencia order by IdEvidencia ASC");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;

        }
    }
}