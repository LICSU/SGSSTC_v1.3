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
    
    public partial class procedimiento_comunicacion
    {
        public int id_procedimiento { get; set; }
        public Nullable<int> id_brigada { get; set; }
        public string nombre { get; set; }
        public string cargo { get; set; }
        public string num_telefono { get; set; }
        public string llamar { get; set; }
    
        public virtual brigada_emergencia brigada_emergencia { get; set; }
    }
}
