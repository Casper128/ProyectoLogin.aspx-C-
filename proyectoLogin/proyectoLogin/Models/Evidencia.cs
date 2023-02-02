using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoLogin.Models
{
    public class Evidencia
    {
        private string idEvidencia;
        private string Titulo;
        private string Descripcion;
        private string tipo;
        private string FCreacion;
        private string FRegistro;
        private string Latitud;
        private string Longitud;

        public Evidencia()
        {
        }

        public Evidencia(string idEvidencia, string titulo, string descripcion, string tipo, string fCreacion, string fRegistro, string latitud, string longitud)
        {
            this.IdEvidencia = idEvidencia;
            this.Titulo1 = titulo;
            this.Descripcion1 = descripcion;
            this.Tipo = tipo;
            this.FCreacion1 = fCreacion;
            this.FRegistro1 = fRegistro;
            this.Latitud1 = latitud;
            this.Longitud1 = longitud;
        }
        public Evidencia(string titulo, string descripcion, string tipo, string fCreacion, string fRegistro, string latitud, string longitud)
        {
            this.Titulo1 = titulo;
            this.Descripcion1 = descripcion;
            this.Tipo = tipo;
            this.FCreacion1 = fCreacion;
            this.FRegistro1 = fRegistro;
            this.Latitud1 = latitud;
            this.Longitud1 = longitud;
        }

        public string IdEvidencia { get => idEvidencia; set => idEvidencia = value; }
        public string Titulo1 { get => Titulo; set => Titulo = value; }
        public string Descripcion1 { get => Descripcion; set => Descripcion = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public string FCreacion1 { get => FCreacion; set => FCreacion = value; }
        public string FRegistro1 { get => FRegistro; set => FRegistro = value; }
        public string Latitud1 { get => Latitud; set => Latitud = value; }
        public string Longitud1 { get => Longitud; set => Longitud = value; }
    }
}