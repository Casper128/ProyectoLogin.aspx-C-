using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlRolUsuario
    {
        RolUsuario objRolUsuario;
        string BDatos="Sisevid";

        public ControlRolUsuario(RolUsuario objRolUsuario)
        {
            this.objRolUsuario = objRolUsuario;
        }
        public ControlRolUsuario()
        {
            this.objRolUsuario = null;
        }
        public void guardar()
        {
            //string fkNomU = objRolUsuario.FkIdUsuario;
            string fkIdR = objRolUsuario.FkIdRol;
            string comandoSQL =
            String.Format("exec LlenarTablaRolUsuarios'{0}'", fkIdR);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public DataSet consultarRoles_por_NomUsuario()
        {
            string IdUsu = objRolUsuario.FkIdUsuario;
            string comandoSQL =
            String.Format("SELECT tblrol.id,tblrol.nombre " +
                        "FROM tblrol INNER JOIN tblrol_usuario ON tblrol.id=tblrol_usuario.fkIdRol" +
                        " WHERE tblrol_usuario.fkIdUsuario='{0}'", IdUsu);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
        }
        public void borrarDelNomUsuario()
        {
            string fkNomU = objRolUsuario.FkIdUsuario;
            string comandoSQL =
            String.Format("DELETE FROM tblrol_usuario WHERE fkIdUsuario='{0}'", fkNomU);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }

    }
}