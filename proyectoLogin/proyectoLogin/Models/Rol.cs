using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoLogin.Models
{
    public class Rol
    {
        string idRol;
        string nombre;

        public Rol()
        {
            this.idRol = "";
            this.nombre = "";
        }

        public Rol(string nombre)
        {
            this.nombre = nombre;
        }

        public Rol(string id, string nombre)
        {
            this.idRol = id;
            this.nombre = nombre;
        }

        public string Id { get => idRol; set => idRol = value; }
        public string Nombre { get => nombre; set => nombre = value; }
    }
}