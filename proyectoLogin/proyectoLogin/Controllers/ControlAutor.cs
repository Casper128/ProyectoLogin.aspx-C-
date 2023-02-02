using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlAutor
    {
        Autor objAutor;
        String BDatos = "Sisevid";
        public ControlAutor(Autor objAutor)
        {
            this.objAutor = objAutor;
        }
        public ControlAutor()
        {
            this.objAutor = null;
        }
        public void Guardar()
        {
            string nomAut = objAutor.NomAutor;
            string comandoSQL =
            String.Format("INSERT INTO Autores VALUES ('{0}')", nomAut);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        
        public Autor Consultar()
        {
            int id = Convert.ToInt16(objAutor.Id);
            string comandoSQL =
            String.Format("SELECT * FROM AUTORES WHERE IDAUTOR='{0}'", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);

            if (objDataSet.Tables[0].Rows.Count >= 0)
            {
                objAutor.Id = objDataSet.Tables[0].Rows[0][0].ToString();
                objAutor.NomAutor = objDataSet.Tables[0].Rows[0][1].ToString();
            }
            objControlConexion.cerrarBD();
            return objAutor;
        }
        public void Modificar()
        {
            int id = Convert.ToInt32(objAutor.Id);
            string nomAut = objAutor.NomAutor;
            string comandoSQL =
            String.Format("UPDATE AUTORES SET NOMBREAUTOR='{0}' WHERE IDAUTOR='{1}'", nomAut, id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public void Borrar()
        {
            int Id = Convert.ToInt32(objAutor.Id);
            string comandoSQL = String.Format("DELETE FROM AUTORES  WHERE IDAUTOR='{0}'", Id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        public DataSet Listar()
        {
            string comandoSQL = string.Format("SELECT * FROM AUTORES");
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            objControlConexion.cerrarBD();
            return objDataSet;
            }
        }
    }