using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoLogin.Models
{
    public class Usuario
    {
        private string id;
        private string nomUsuario;
        private string contrasena;
        string[] acceso = new string[6];

        public string Id { get => id; set => id = value; }
        public  string NomUsuario { get => nomUsuario; set => nomUsuario = value; }
        public string Contrasena { get => contrasena; set => contrasena = value; }
        public string[] Acceso { get => acceso; set => acceso = value; }

  
        public Usuario(string nomUsuario, string contrasena)
        {
            this.nomUsuario = nomUsuario;
            this.contrasena = contrasena;
        }
        public Usuario()
        {
            this.id = "";
            this.nomUsuario = "";
            this.contrasena = "";
        }

        public Usuario(string id, string nomUsuario, string contrasena)
        {
            this.id = id;
            this.nomUsuario = nomUsuario;
            this.contrasena = contrasena;
        }

        public Usuario(string [] acceso)
        {
            this.Acceso = acceso;
        }
    }
}