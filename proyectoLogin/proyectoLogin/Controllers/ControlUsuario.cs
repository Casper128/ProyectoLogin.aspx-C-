using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using proyectoLogin.Models;
using System.Data;
using System.Web.UI.WebControls;

namespace proyectoLogin.Controllers
{

    public class ControlUsuario
    {

        Usuario objUsuario;
        String BDatos = "Sisevid";

        public ControlUsuario(Usuario objUsuario)
        {
            this.objUsuario = objUsuario;
        }
        public ControlUsuario()
        {
            this.objUsuario = null;
        }
        public bool validar()
        {
            bool esValido = false;
            string nomUsu = objUsuario.NomUsuario;
            string contra = objUsuario.Contrasena;
            string comandoSql = "select IdUsuario,usuario,contrasenia,tblrol.id,tblrol.nombre  from usuarios " +
                "inner join tblrol_usuario on (IdUsuario=fkIdUsuario) inner join tblrol on (fkIdRol=id) " +
                "where usuario='"+nomUsu+"'and contrasenia='"+contra+"'";
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet= objControlConexion.ejecutarConsultasSql(comandoSql);

                if (objDataSet.Tables[0].Rows.Count > 0)
                {
                    objUsuario.Id = objDataSet.Tables[0].Rows[0][0].ToString();
                    esValido = true;
                }
                
            for (int i = 0; i < objDataSet.Tables[0].Rows.Count; i++) {
                objUsuario.Acceso[i]= objDataSet.Tables[0].Rows[i][3].ToString();                        
                }

            return esValido;
        }
        public void guardar()
        {
            string nomUsu= objUsuario.NomUsuario;
            string contrasenia = objUsuario.Contrasena;
            string comandoSQL =
            String.Format("INSERT INTO USUARIOS VALUES ('{0}','{1}')", nomUsu, contrasenia);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        
        public Usuario consultar()
        {
            int id = Convert.ToInt16(objUsuario.Id);
            string comandoSQL =
            String.Format("SELECT * FROM USUARIOS WHERE IDUSUARIO='{0}'", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);

            if (objDataSet.Tables[0].Rows.Count > 0)
            {
                objUsuario.Id = objDataSet.Tables[0].Rows[0][0].ToString();
                objUsuario.NomUsuario = objDataSet.Tables[0].Rows[0][1].ToString();
                objUsuario.Contrasena= objDataSet.Tables[0].Rows[0][2].ToString();
            }
            objControlConexion.cerrarBD();
            return objUsuario;
        }
        public void modificar()
        {
            int id = Convert.ToInt32(objUsuario.Id);
            string nomUsu = objUsuario.NomUsuario;
            string contrasena = objUsuario.Contrasena;
            string comandoSQL =String.Format("UPDATE USUARIOS SET USUARIO='{0}'" +
                ",CONTRASENIA='{1}' WHERE IDUSUARIO='{2}'", nomUsu, contrasena, id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();

        }
        public void borrar()
        {
            int cod = Convert.ToInt32(objUsuario.Id);
            string comandoSQL = String.Format("DELETE FROM USUARIOS WHERE IDUSUARIO='{0}'", cod);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }

        public DataSet listar()
        {
            string comandoSQL = String.Format("SELECT * FROM USUARIOS");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
        }

    }
}