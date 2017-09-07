using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PerfilCargo : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Utilidades objUtilidades = new Utilidades();
        Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregarPerfil.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }

        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));

            Tabla.PerfilCargo(GridView1, IdEmpresa, string.Empty + ViewState["sWhere"]);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect("Create_PerfilCargo.aspx");
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            perfil_cargo tabla = new perfil_cargo();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();
        }

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

                string idPerfil = Utilidades.GetIdFila(GridView1, e, "id");
                idPerfil = objUtilidades.cifrarCadena(Convert.ToString(idPerfil));
                Response.Redirect("Update_PerfilCargo.aspx?id="+idPerfil);
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