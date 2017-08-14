using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_IncidentesLaborales : System.Web.UI.Page
    {
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phAgregar.Visible = BoolEmpSuc.Item2;
            GridView1.Columns[4].Visible = BoolEmpSuc.Item2;
            GridView1.Columns[7].Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
                CargarListas();
            }
        }
        protected void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

        }
        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            /* Tabla.Accidente_General(GridView1,
                 IdEmpresa,
                 IdSucursal,
                 string.Empty + ViewState["area"],
                 string.Empty + ViewState["search"]);*/
        }
        #endregion

        #region registrar modales
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        #endregion

        #region acciones
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            /*if (flEscaneado.FileName != string.Empty)
            {
                string ruta = Utilidades.GuardarArchivo(flEscaneado, hdfIDEsc.Value + "ArchivoAccidente", "~/source/archivos/accidentes/");

                GrupoLiEntities contexto = new GrupoLiEntities();
                int id_Acc = Convert.ToInt32(hdfIDEsc.Value);
                acc_inc_lab Edit = contexto.acc_inc_lab.SingleOrDefault(b => b.id_acc_lab == id_Acc);

                if (Edit != null)
                {
                    Edit.documento_escaneado = ruta;
                }

                ObjUsuario.Error = Modelo_CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            }

            Modal.Validacion(this, ObjUsuario.Error, "Edit");
            LlenarGridView();*/
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            /*acc_inc_lab tabla = new acc_inc_lab();
            ObjUsuario.Error = Modelo_CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();*/
        }
        #endregion

        #region  Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        public void incializarExports()
        {
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
            LlenarGridView();
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Incidente_Laboral", "Lista de Incidentes Laborales");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Incidente_Laboral", "Lista de Incidentes Laborales");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Incidente_Laboral", "Lista de Incidentes Laborales");
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));

                Response.Redirect(Paginas.View_Incidente.Value +"? id=" + hdfIDDel.Value);
            }
            if (e.CommandName.Equals("Imprimir"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));
                Response.Redirect(Paginas.View_Incidente.Value + "?id=" + hdfIDDel.Value + "&Print=si");
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            if (e.CommandName.Equals("Subir"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDEsc.Value = (gvrow.FindControl("id") as Label).Text;
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
            }
            if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();

        }
        #endregion

        #region filtros
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtSearch.Text != string.Empty)
            {
                ViewState["search"] = txtSearch.Text;
            }
            else
            {
                ViewState["search"] = string.Empty;
            }

            LlenarGridView();
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        #endregion
    }
}