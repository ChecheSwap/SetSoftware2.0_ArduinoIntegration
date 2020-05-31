//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MundoMusical
{
    using System;
    using System.Collections.Generic;
    
    public partial class venta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public venta()
        {
            this.detalles = new HashSet<detalle>();
            this.facturas = new HashSet<factura>();
            this.tickets = new HashSet<ticket>();
        }
    
        public int idventa { get; set; }
        public int idtienda { get; set; }
        public int idusuario { get; set; }
        public System.DateTime fecha { get; set; }
        public System.TimeSpan hora { get; set; }
        public int idmodopago { get; set; }
        public int idcliente { get; set; }
        public int articulos { get; set; }
        public double subtotal { get; set; }
        public double total { get; set; }
        public string status { get; set; }
        public double descuentoextra { get; set; }
        public double iva { get; set; }
    
        public virtual cliente cliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<detalle> detalles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<factura> facturas { get; set; }
        public virtual modo_pago modo_pago { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ticket> tickets { get; set; }
        public virtual tienda tienda { get; set; }
        public virtual usuario usuario { get; set; }
    }
}
