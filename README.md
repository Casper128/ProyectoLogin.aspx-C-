# ProyectoLogin.aspx-C-

Primero se debe ejecutar la base de datos y cambiar la cadenas de conexion para que funcione al abrir el proyecto en Visual Studio 

Pasos
1. Click derecho en el explorador de soluciones y en la carpeta AppData que se encuentra dentro del proyectoLogin
2. Opcion agregar y Nuevo elemento
3. En la opcion C# / Datos / Base de datos sql server
4. En las bases de datos click derecho y generar una nueva conexion con sql server 
5. Copiar y pegamos el nombre del servidor ejemplo "DESKTOP-E61O3VD"
6.En el Desplegable luego de haber ejecutado la consulta SQL en SQL server o MySQL seleccionamos el nombre de la base de datos
7.Luego en la clase control conexion 

        public ControlConexion(String baseDeDatos)
        {
            this.cadenaConexion = @"Data Source=DESKTOP-E61O3VD;Initial Catalog="+baseDeDatos+";Integrated Security=True";
            objSqlConnection = new SqlConnection(cadenaConexion);
        }
En este metoodo debemos cambiar el data source por el que te SQL server "DESKTOP-E61O3VD"
8. por ultimo corres el proyecto en local
      
