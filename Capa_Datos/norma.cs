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
    
    public partial class norma
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public norma()
        {
            this.medida = new HashSet<medida>();
            this.norma_claseciiu = new HashSet<norma_claseciiu>();
            this.norma_sucursal = new HashSet<norma_sucursal>();
        }
    
        public int id_normas { get; set; }
        public string tipo_matriz { get; set; }
        public string tema_especifico { get; set; }
        public string documento { get; set; }
        public string anho { get; set; }
        public string articulo { get; set; }
        public string literal { get; set; }
        public string paragrafo { get; set; }
        public string numeral { get; set; }
        public string concordante { get; set; }
        public string obligaciones { get; set; }
        public string sanciones { get; set; }
        public Nullable<int> porc_cum { get; set; }
        public string pdf { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<medida> medida { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<norma_claseciiu> norma_claseciiu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<norma_sucursal> norma_sucursal { get; set; }
    }
}
