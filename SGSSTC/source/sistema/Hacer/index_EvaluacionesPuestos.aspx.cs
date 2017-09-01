using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_EvaluacionesPuestos : System.Web.UI.Page
    {
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;
        int id_Puesto;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            id_Puesto = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            Tabla.EvaluacionPuesto(GridView1, id_Puesto);
        }

        #endregion

        #region acciones
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void btPrint_Click(object sender, EventArgs e)
        {
            String[] valores = {
                "",
                ViewState["Imprimir"].ToString(),
            };
            Modal.CerrarModal("printModal", "printModalScript", this);
            PrintFile.PrintEvaluacionPuestos(valores, this);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            evaluacion_riesgo tabla = new evaluacion_riesgo();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            LlenarGridView();
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
        }
		
        #endregion

        #region acciones grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string id_EvaRiesgo = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;

                id_EvaRiesgo = objUtilidades.cifrarCadena(id_EvaRiesgo);

                Response.Redirect(Paginas.View_EvaluacionPuesto.Value + "?id=" + id_EvaRiesgo);
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDDel.Value = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("print"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hImprimir.Value = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;
                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }

        }
        #endregion
    }
}