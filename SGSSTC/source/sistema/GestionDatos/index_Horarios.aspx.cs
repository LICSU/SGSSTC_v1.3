using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.GestionDatos
{
    public partial class index_Horarios : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);


            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            ddlEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phempresaEdit.Visible = BoolEmpSuc.Item1;
            ddlEmpresaEdit.Visible = BoolEmpSuc.Item1;

            if (!IsPostBack)
            {
                CargarListas();
                LlenarGridView();
            }
        }

        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
                Listas.Empresa(ddlEmpresaAdd);
                Listas.Empresa(ddlEmpresaEdit);
            }
        }

        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            Tabla.Horario(GridView1, IdEmpresa, string.Empty + ViewState["sWhere"]);
        }
        #endregion

        #region acciones
        protected void AgregarRegistroModal(object sender, EventArgs e)
        {
            Modal.registrarModal("addModal", "AddModalScript", this);
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresaAdd);

            horario nuevo = new horario()
            {
                nombre = txtNombreAdd.Text,
                id_empresa = IdEmpresa,
                fecha_inicio = txtFechaIni.Text,
                fecha_fin = txtFechaFin.Text,
                fecha_creacion = DateTime.Today
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
            int idHorario = Convert.ToInt32(hdfHorarioID.Value);
            horario Edit = contexto.horario.SingleOrDefault(b => b.id_horario == idHorario);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_empresa = IdEmpresa;
                Edit.fecha_inicio = txtFechaIniEdit.Text;
                Edit.fecha_fin = txtFechaFinEdit.Text;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            Modal.CerrarModal("editModal", "EditModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Edit");
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            horario tabla = new horario();
            List<usuario> usuarioData = Getter.AreaByUsuario(ObjUsuario.Id_usuario);
            int IdHorario = 0;
            foreach (var user in usuarioData)
            {
                IdHorario = Convert.ToInt32(user.trabajador.id_horario);
            }
            if (IdHorario != Convert.ToInt32(hdfHorarioIDDel.Value))
            {
                ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfHorarioIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
                Modal.Validacion(this, ObjUsuario.Error, "Delete");
                LlenarGridView();
            }
            else
            {
                Modal.CerrarModal("deleteModal", "DeleteModalScript", this);

                Modal.MostrarMsjModal(MensajeError.Fallo_Delete_Horario_Usuario.Value, "ERR", this);
            }

        }
        #endregion

        #region metodos Grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfHorarioIDDel.Value = (gvrow.FindControl("id_horario") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Editar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];

                hdfHorarioID.Value = (gvrow.FindControl("id_horario") as Label).Text;
                txtNombreEdit.Text = (gvrow.FindControl("nombre") as Label).Text;
                txtFechaIniEdit.Text = (gvrow.FindControl("fecha_inicio") as Label).Text;
                txtFechaFinEdit.Text = (gvrow.FindControl("fecha_fin") as Label).Text;
                ddlEmpresaEdit.SelectedValue = (gvrow.FindControl("id_empresa") as Label).Text;

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (ObjUsuario.isAdm_Sucursal() || ObjUsuario.isAdm_SucSalud() || ObjUsuario.isAdm_SucSeg() || ObjUsuario.isResponsable())
            {
                GridView1.Columns[5].Visible = false;
                GridView1.Columns[6].Visible = false;
            }
        }
        #endregion

        #region filtros
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
        #endregion
    }
}