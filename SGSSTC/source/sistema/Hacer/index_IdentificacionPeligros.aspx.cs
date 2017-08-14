﻿using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_IdentificacionPeligros : System.Web.UI.Page
    {
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
                cargarListas();
            }
        }
        private void LlenarGridView()
        {
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.IdentificacionPeligro(
                GridView1,
                IdSucursal);
        }
        private void cargarListas()
        {
            Listas.Empresa(ddlEmpresa);

            if (!BoolEmpSuc.Item1)
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }
        protected void AgregarRegistro(object sender, EventArgs e)
        {            
            Response.Redirect(Paginas.Create_IdentificacionPeligro.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            identificacion_peligro tabla = new identificacion_peligro();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            LlenarGridView();
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                ViewState["Imprimir"].ToString()
            };
            PrintFile.PrintPlanInduccion(valores, this);
            Modal.CerrarModal("printModal", "printModalScript", this);
        }

        #region acciones grid
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
                hdfIDDel.Value = (gvrow.FindControl("id_identificacion_peligro") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string idRiesgos = (gvrow.FindControl("id_identificacion_peligro") as Label).Text;

                idRiesgos = objUtilidades.cifrarCadena(idRiesgos);

                Response.Redirect(Paginas.View_IdentificacionPeligros.Value+"?id=" + idRiesgos);
            }
            else if (e.CommandName.Equals("print"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hImprimir.Value = (gvrow.FindControl("id_identificacion_peligro") as Label).Text;
                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }

        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        #endregion

        #region flitros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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