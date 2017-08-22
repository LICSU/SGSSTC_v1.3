using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Categorias : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregarCat.Visible = BoolEmpSuc.Item2;

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phEmpresaEdit.Visible = BoolEmpSuc.Item1;
            ddlEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }

        protected void CargarListas()
        {
            Listas.Empresa(ddlEmpresa);
            Listas.Empresa(ddlEmpresaAdd);
            Listas.Empresa(ddlEmpresaEdit);
        }

        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Tabla.Categorias(GridView1, IdEmpresa, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region registro de los modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            //Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
        }
        #endregion

        #region  aciones de editar insertar y eliminar
        protected void Guardar(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            categoria nuevo = new categoria()
            {
                nombre = txtNombre.Text,
                descripcion = txtDescripcion.Text,
                id_empresa = IdEmpresa
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("addModal", "AddModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }

        protected void EditarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaEdit);

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idCategoria = Convert.ToInt32(hdfEditID.Value);
            categoria Edit = contexto.categoria.SingleOrDefault(b => b.id_categorias == idCategoria);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_empresa = IdEmpresa;
                Edit.descripcion = txtDescripcionEdit.Text;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Edit");
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            categoria tabla = new categoria();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();
        }
        #endregion

        #region  eventos del grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("Editar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfEditID.Value = Utilidades.GetIdFila(GridView1, e, "id");

                txtNombreEdit.Text = (gvrow.FindControl("nombre") as Label).Text;
                txtDescripcionEdit.Text = (gvrow.FindControl("descripcion") as Label).Text;
                ddlEmpresaEdit.SelectedValue = (gvrow.FindControl("HFid_empresa") as HiddenField).Value;

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfIDDel.Value = (gvrow.FindControl("id") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isResponsable())
            {
                #region codigo
                GridView1.Columns[4].Visible = false;
                GridView1.Columns[5].Visible = false;
                #endregion
            }
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtSearch.Text != string.Empty)
            {
                ViewState["sWhere"] = txtSearch.Text;
            }
            else
            {
                ViewState["sWhere"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}