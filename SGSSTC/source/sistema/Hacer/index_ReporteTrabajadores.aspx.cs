﻿using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_ReporteTrabajadores : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        #region metodos index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = true;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phEmpresaAdd.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;

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
                Listas.Empresa(ddlEmpresaAdd);
            }
            else
            {
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }

        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.reportes(GridView1, string.Empty + ViewState["tipo"], IdEmpresa, IdSucursal);
        }
        #endregion

        #region registrar modales
        protected void MostrarModalAgregar(object sender, EventArgs e)
        {
            //Modal.registrarModal("addModal", "AddModalScript", this);
        }
        protected void MostrarModalCrear(object sender, EventArgs e)
        {
           // Modal.registrarModal("createModal", "CreateModalScript", this);
        }
        #endregion

        #region acciones
        protected void Guardar(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursalAdd);

            String[] valores = {
                txtNombre.Text,
                ddlTipoReporteAdd.SelectedValue
            };

            CRUD.AddReporteTrabajadores(IdEmpSuc, ObjUsuario, valores, flpArchivo);

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();

            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.CerrarModal("deleteModal", "DeleteModalScript", this);
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();
        }

        protected void btnCrearRepTrab1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_ReporteTrabajadoresA.Value);
        }

        protected void btnCrearRepTrab2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_ReporteTrabajadoresB.Value);
        }

        protected void btnCrearRepTrab3_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.create_ReporteTrabajadoresC.Value);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Eliminar"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id_reportes");
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        #region filtro
        protected void ddlTipoReporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoReporte.SelectedValue != string.Empty)
            {
                ViewState["tipo"] = ddlTipoReporte.SelectedValue;
            }
            else
            {
                ViewState["tipo"] = string.Empty;

            }
            LlenarGridView();
        }

        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }

        protected void ddlEmpresaAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresaAdd.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursalAdd, Convert.ToInt32(ddlEmpresaAdd.SelectedValue));
            }
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
        #endregion
    }
}