using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace proyectoLogin.Controllers
{
    class ControlConexion
    {
        String cadenaConexion;
        SqlConnection objSqlConnection;
        public ControlConexion()
        {
            cadenaConexion = null;
            objSqlConnection = null;
        }

        public ControlConexion(String baseDeDatos)
        {
            this.cadenaConexion = @"Data Source=DESKTOP-E61O3VD;Initial Catalog="+baseDeDatos+";Integrated Security=True";
            objSqlConnection = new SqlConnection(cadenaConexion);
        }

        public String abrirBD()
        {
            String msg = "ok";
            try
            {
                objSqlConnection = new SqlConnection(cadenaConexion);
                objSqlConnection.Open();
            }
            catch(Exception Ex)
            {
                msg = Ex.Message;
            }
            return msg;
        }

        public String cerrarBD()
        {
            String msg = "ok";
            try
            {
                objSqlConnection.Close();
            }
            catch (Exception Ex)
            {
                msg = Ex.Message;
            }
            return msg;
        }

        public String ejecutarComandoSQL(String comandoSql)
        {
            String msg = "ok";
            try
            {
                SqlCommand sqlComando = new SqlCommand(comandoSql, objSqlConnection);
                sqlComando.ExecuteNonQuery();
            }
            catch(Exception Ex)
            {
                msg = Ex.Message;
            }
            return msg;
        }

        public DataSet ejecutarConsultasSql(String comandoSql)
        {
            String msg = "ok";
            DataSet objDataSet = new DataSet();
            
            try
            {
                SqlDataAdapter sqlDataAdap = new SqlDataAdapter(comandoSql, objSqlConnection);
                sqlDataAdap.Fill(objDataSet);
            }
            catch(Exception Exc)
            {
                msg = Exc.Message;
            }
            return objDataSet;
        }

    }
}
