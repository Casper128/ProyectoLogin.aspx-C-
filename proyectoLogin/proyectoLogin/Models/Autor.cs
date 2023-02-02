using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoLogin.Models
{
    public class Autor
    {
        private string id;
        private string nomAutor;

        public string Id { get => id; set => id = value; }
        public string NomAutor { get => nomAutor; set => nomAutor = value; }

        public Autor(string id, string nomAutor)
        {
            this.id = id;
            this.nomAutor = nomAutor;
        }

        public Autor()
        {
            this.id = "";
            this.nomAutor = "";
        }

        public Autor(string nomAutor)
        {
            this.nomAutor = nomAutor;
        }
    }
}