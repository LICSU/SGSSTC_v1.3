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
    
    public partial class consulta
    {
        public int id_consulta { get; set; }
        public int id_acc_lab { get; set; }
        public string tipo { get; set; }
        public string servicio_medico { get; set; }
        public string fecha { get; set; }
        public string medico { get; set; }
        public string diagnostico { get; set; }
        public string sug_trat { get; set; }
        public Nullable<int> id_empresa { get; set; }
    
        public virtual at_it_el_pa at_it_el_pa { get; set; }
    }
}
