﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Plan_Emergencias : Page
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
                if (BoolEmpSuc.Item1)
                {
                    Listas.Empresa(ddlEmpresa);
                }
                else if (BoolEmpSuc.Item2)
                {
                    Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarPlan();
                }
            }
        }
        public void cargarPlan()
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idPlan = GetterMax.Plan(IdSucursal);

            if (idPlan != 0)
            {
                List<plan> ListaPlanes = new List<plan>();
                ListaPlanes = Getter.Planes(idPlan);

                if (ListaPlanes.Count > 0)
                {
                    foreach (var item in ListaPlanes)
                    {
                        txtPlanEmergencia.Text = item.nombre;
                    }
                }
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txtPlanEmergencia.Text
            };

            PrintFile.PrintContingencias(valores, this);
        }



        protected void GuardarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            plan tabla = new plan();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, GetterMax.Plan(IdSucursal), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            plan nuevo = new plan()
            {
                id_sucursal = IdSucursal,
                nombre = txtPlanEmergencia.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                cargarPlan();
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
                phCkeditor.Visible = true;
                phCkeditorNo.Visible = false;
            }
        }
    }
}