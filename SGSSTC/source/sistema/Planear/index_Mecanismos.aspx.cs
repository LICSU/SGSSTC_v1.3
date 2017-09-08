﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Mecanismos : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;
            phSucursalAdd.Visible = BoolEmpSuc.Item2;
            phSucursalEdit.Visible = BoolEmpSuc.Item2;

            Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
            Listas.Sucursal(ddlSucursalEdit, ObjUsuario.Id_empresa);

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }
        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));
            Tabla.TipoDocumento(GridView1, IdSucursal, IdEmpresa);
        }

        #region  aciones de editar insertar y eliminar
        protected void Guardar(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);

            tipo_documento nuevo = new tipo_documento()
            {
                nombre = txtNombreAdd.Text,
                id_sucursal = IdSucursal,
                dirigida = txtDirigidaAdd.Text,
                modalidad = txtModalidadAdd.Text,
                fecha = Convert.ToDateTime(txtFechaAdd.Text),
                responsable = txtResponsableAdd.Text,
                aprobado = txtAprobadoAdd.Text,
                archivado = txtArchivadoAdd.Text,
                estatus = ddlEstatusAdd.SelectedValue
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int idDocumento = Convert.ToInt32(hdfEditID.Value);

            tipo_documento Edit = contexto.tipo_documento.SingleOrDefault(b => b.id_tipo_documento == idDocumento);

            if (Edit != null)
            {
                Edit.nombre = txtNombreEdit.Text;
                Edit.id_sucursal = Convert.ToInt32(ddlSucursalEdit.SelectedValue);
                Edit.dirigida = txtDirigidaEdit.Text;
                Edit.modalidad = txtModalidadEdit.Text;
                Edit.fecha = Convert.ToDateTime(txtFechaEdit.Text);
                Edit.responsable = txtResponsableEdit.Text;
                Edit.aprobado = txtAprobadoEdit.Text;
                Edit.archivado = txtArchivadoEdit.Text;
                Edit.estatus = ddlEstatusEdit.SelectedValue;
            }
            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);


            Modal.Validacion(this, ObjUsuario.Error, "Edit");
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            tipo_documento tabla = new tipo_documento();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
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
                hdfEditID.Value = (GridView1.Rows[RowIndex].FindControl("Num") as Label).Text;

                List<tipo_documento> ListaTipoDocumento = new List<tipo_documento>();
                ListaTipoDocumento = Getter.TipoDocumento(Convert.ToInt32(hdfEditID.Value));

                foreach (var item in ListaTipoDocumento)
                {
                    txtNombreEdit.Text = item.nombre;
                    txtDirigidaEdit.Text = item.dirigida;
                    txtModalidadEdit.Text = item.modalidad;
                    txtFechaEdit.Text = Convert.ToString(item.fecha);
                    txtResponsableEdit.Text = item.responsable;
                    txtAprobadoEdit.Text = item.aprobado;
                    txtArchivadoEdit.Text = item.archivado;
                    ddlEstatusEdit.SelectedValue = item.estatus;
                    ddlSucursalEdit.SelectedValue = Convert.ToString(item.id_sucursal);
                }

                Modal.registrarModal("editModal", "EditModalScript", this);
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                string valor = (GridView1.Rows[RowIndex].FindControl("Num") as Label).Text;
                hdfIDDel.Value = valor;

                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }

        }
        #endregion

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

    }
}