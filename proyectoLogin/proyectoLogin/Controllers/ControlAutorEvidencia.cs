using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using proyectoLogin.Models;

namespace proyectoLogin.Controllers
{
    public class ControlAutorEvidencia
    {
        Autor objAutor;
        String BDatos = "Sisevid";
        public ControlAutorEvidencia(Autor objAutor)
        {
            this.objAutor = objAutor;
        }
        public ControlAutorEvidencia()
        {
            this.objAutor = null;
        }
        public void guardar(int fkAut, int fkEvidenciaAutor)
        {
            string comandoSQL =
            String.Format("INSERT INTO DetalleAutores VALUES ('{0}', '{1}')", fkAut, fkEvidenciaAutor);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            objControlConexion.ejecutarComandoSQL(comandoSQL);
            objControlConexion.cerrarBD();
        }
        
        public Array Consultar(int id)
        {
            
            string comandoSQL =
            String.Format("select fkAutor,NombreAutor from DetalleAutores inner join Autores on FkAutor=IdAutor where FkEvidenciaAutor='{0}'", id);
            ControlConexion objControlConexion = new ControlConexion(BDatos);
            objControlConexion.abrirBD();
            DataSet objDataSet = objControlConexion.ejecutarConsultasSql(comandoSQL);
            string[] Array = new string[objDataSet.Tables[0].Rows.Count];
            for(int i=0; i < objDataSet.Tables[0].Rows.Count; i++) { 
                if (objDataSet.Tables[0].Rows.Count >= 0)
                {
                    Array[i] = objDataSet.Tables[0].Rows[i][0].ToString()+"."+ objDataSet.Tables[0].Rows[i][1].ToString();
                }
            }
            objControlConexion.cerrarBD();
            return Array;
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
        public void Borrar(int id)
        {
            string comandoSQL = String.Format("DELETE FROM DETALLEAUTORES WHERE FkEvidenciaAutor='{0}'", id);
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