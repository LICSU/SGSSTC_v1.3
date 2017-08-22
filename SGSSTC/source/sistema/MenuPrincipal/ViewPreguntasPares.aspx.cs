using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class ViewPreguntasPares : System.Web.UI.Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                DateTime fechaActual = DateTime.Now;
                ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
                ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");

                LlenarGridView();
            }
        }

        protected void LlenarGridView()
        {
            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = Getter.CodigoCiiu_Empresa(ObjUsuario.Id_empresa);

            int act1 = 0, act2 = 0, act3 = 0, cont = 0;
            foreach (var item in consulta)
            {
                cont++;
                if (cont == 1) { act1 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 2) { act2 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 3) { act3 = Convert.ToInt32(item.id_clase_ciiu); }
            }


            Tabla.SusPreguntas(GridView1, act1, act2, act3, string.Empty + ViewState["FechaInicio"], string.Empty + ViewState["FechaFin"]);
        }

        protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaInicio.Text != string.Empty)
            {
                ViewState["FechaInicio"] = txtFechaInicio.Text;
            }
            else
            {
                ViewState["FechaInicio"] = "";
            }
            LlenarGridView();
        }
        protected void txtFechaFin_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaFin.Text != string.Empty)
            {
                ViewState["FechaFin"] = txtFechaFin.Text;
            }
            else
            {
                ViewState["FechaFin"] = "";
            }
            LlenarGridView();
        }
    }
}