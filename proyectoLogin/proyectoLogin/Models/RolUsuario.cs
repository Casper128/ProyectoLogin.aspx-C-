using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoLogin.Models
{
    public class RolUsuario
    {
        string fkIdUsuario;
        string fkIdRol;

        public string FkIdUsuario { get => fkIdUsuario; set => fkIdUsuario = value; }
        public string FkIdRol { get => fkIdRol; set => fkIdRol = value; }

        public RolUsuario(string fkIdUsuario, string fkIdRol)
        {
            this.fkIdUsuario = fkIdUsuario;
            this.fkIdRol = fkIdRol;
        }
        public RolUsuario()
        {
            this.fkIdUsuario = "";
            this.fkIdRol = "";
        }

    }
}