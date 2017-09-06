﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_RecursosEconomicos : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;
        Utilidades objUtilidades = new Utilidades();
        HyperLink HyperLink1;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                LlenarGridView();
                CargarListas();
            }
        }
        protected void CargarListas()
        {
            Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            Listas.Sucursal(ddlSucursalSubir, ObjUsuario.Id_empresa);
        }
        protected void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.RecursosEconomicos(GridView1, IdEmpresa, IdSucursal);

        }
        #endregion

        #region acciones
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_RecursosEconomicos.Value);
        }
        protected void btnSubir_Click(object sender, EventArgs e)
        {
            //Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
        }
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalSubir);

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_InformeRecursosEconomicos_" + IdSucursal, "~/source/archivos/recursos_economicos/");

            documento nuevo = new documento()
            {
                nombre = txtNombreSubir.Text,
                id_tabla = IdSucursal,
                ruta = _ruta,
                tipo = "RecursosEconomicos"
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                int idRec = GetterMax.RecursosEconmicos(IdSucursal);

                if (fuSoporte.HasFile)
                {
                    int i = 0;
                    foreach (var archivo in fuSoporte.PostedFiles)
                    {
                        i++;
                        string ruta = Utilidades.GuardarArchivo(archivo, "Soporte_" + txtNombreSubir.Text + "_" + i, "~/source/archivos/recursos_economicos/");

                        soporte nuevoFA = new soporte()
                        {
                            url = ruta,
                            id_tabla = idRec,
                            tabla = "RecursosEconomicos"
                        };
                        ObjUsuario.Error = CRUD.Add_Fila(nuevoFA, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                    }
                }
            }

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            documento tabla = new documento();
            ObjUsuario.Error = CRUD.Delete_Fila(
                tabla,
                Convert.ToInt32(hdfIDDel.Value),
                ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri
                );

            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Eliminar"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id_rec_eco");
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            if (e.CommandName.Equals("soporte"))
            {
                hdSoporte.Value = Utilidades.GetIdFila(GridView1, e, "id_rec_eco");

                int contadorArchivos = 0;

                List<soporte> ListSopRec = new List<soporte>();
                ListSopRec = Getter.Soporte(Convert.ToInt32(hdSoporte.Value), "RecursosEconomicos");

                ControlesDinamicos.CrearLiteral("<ul class='list-group'>", pAnexo);
                foreach (var item1 in ListSopRec)
                {
                    contadorArchivos++;
                    if (contadorArchivos % 2 == 0)
                    {
                        ControlesDinamicos.CrearLiteral("<li class='list-group-item'>", pAnexo);
                    }
                    else
                    {
                        ControlesDinamicos.CrearLiteral("<li class='list-group-item list-group-item-info'>", pAnexo);
                    }
                    HyperLink1 = new HyperLink();
                    HyperLink1.NavigateUrl = item1.url;
                    HyperLink1.Target = "_blank";
                    HyperLink1.Text = "Ver Archivo " + contadorArchivos;
                    pAnexo.Controls.Add(HyperLink1);
                    ControlesDinamicos.CrearLiteral("</ li >", pAnexo);
                }
                ControlesDinamicos.CrearLiteral("</ ul > ", pAnexo);

                Modal.registrarModal("soporteModal", "SoporteModalScript", this);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
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