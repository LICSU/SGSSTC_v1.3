using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class View_Obligacion : System.Web.UI.Page
    {
        #region variables
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        protected static int idObligacion;


        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            string valor = Request.QueryString["idO"];
            idObligacion = objUtilidades.descifrarCadena(valor);

            if (!IsPostBack)
            {
                CargarUsuario();
            }
        }
        protected void CargarUsuario()
        {
            List<obligacion> ListaObligacion = new List<obligacion>();
            ListaObligacion = Getter.Obligacion(Convert.ToInt32(idObligacion));

            foreach (var item in ListaObligacion)
            {
                txtFechaEntrega.Text = Convert.ToDateTime(item.fecha_entrega).ToString("yyyy-MM-dd");
                txtResponsable.Text = item.usuario.login;
                txtCategoria.Text = item.categoria.nombre;
                txtPrioridad.Text = item.prioridad;
                txtFrecuencia.Text = item.frecuencia_control.nombre;
                txtDescripcion.Text = item.descripcion;
                txtAcciones.Text = item.acciones;
                txtEstatus.Text = item.estatus_obl;
                txtActividad.Text = item.plan_trabajo.nombre;
            }
        }
		
    }
}