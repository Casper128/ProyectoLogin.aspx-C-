using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlRol
    {
        Rol objRol;
        string BDatos= "Sisevid";

        public ControlRol(Rol objRol)
        {
            this.objRol = objRol;
        }
        public ControlRol()
        {
            this.objRol = null;
        }
        public void Guardar()
        {
            string nom = objRol.Nombre;
            string comandoSQL =
            String.Format("INSERT INTO TBLROL VALUES ('{0}')", nom);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public Rol Consultar()
        {
            string msg = "ok";
            int id = Convert.ToInt32(objRol.Id);
            string comandoSQL =
            String.Format("SELECT * FROM TBLROL WHERE id={0}", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            try
            {
                if (objDataSet.Tables[0].Rows.Count > 0)
                {
                    objRol.Nombre = objDataSet.Tables[0].Rows[0][1].ToString();
                    objRol.Id = objDataSet.Tables[0].Rows[0][0].ToString();
                    objControlConexion.cerrarBD();
                }
            }
            catch (Exception objExcetion)
            {
                msg = objExcetion.Message;
            }
            return objRol;

        }
        public void Modificar()
        {
            string nom = objRol.Nombre;
            int id = Convert.ToInt32(objRol.Id);
            string comandoSQL =
            String.Format("UPDATE TBLROL SET nombre='{0}' WHERE id={1}", nom, id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public void Borrar()
        {
            int id = Convert.ToInt32(objRol.Id);
            string comandoSQL =String.Format("DELETE FROM TBLROL WHERE id={0}", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public DataSet Listar()
        {
            string comandoSQL = string.Format("SELECT * FROM TBLROL");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
        }
    }
}