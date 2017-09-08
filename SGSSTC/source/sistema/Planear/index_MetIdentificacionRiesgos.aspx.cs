﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MetIdentificacionRiesgos : System.Web.UI.Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                cargarListas();
                if (BoolEmpSuc.Item2)
                {
                    Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarPlan();
                }
            }
        }

        protected void cargarListas()
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
                cargarPlan();
            }
        }
        public void cargarPlan()
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = GetterMax.Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> consulta = new List<plan>();
                consulta = Getter.Planes(idPlan);

                if (consulta.Count > 0)
                {
                    foreach (var item in consulta)
                    {
                        txtIdentificacionRiesgos.Text = item.nombre;
                    }
                }
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {

        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, GetterMax.Plan(IdSucursal), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtIdentificacionRiesgos.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                cargarPlan();
            }
        }
    }
}