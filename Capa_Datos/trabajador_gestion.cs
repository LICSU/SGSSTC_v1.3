//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Capa_Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class trabajador_gestion
    {
        public int id_trabajador { get; set; }
        public int id_ges_lab { get; set; }
        public string asistencia { get; set; }
        public int id_trabajador_gestion { get; set; }
    
        public virtual gestion_laboral gestion_laboral { get; set; }
        public virtual trabajador trabajador { get; set; }
    }
}
