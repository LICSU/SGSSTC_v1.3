﻿using System;
using Capa_Datos;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_ReunionCopasst : Page
    {
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtActa.Text,
                txtHoraInicio.Text,
                txtHoraFin.Text,
                txtMiembrosPrincipales.Text,
                txtInvitados.Text,
                txtSolicitudes.Text,
                txtEstatus.Text,

            };
            PrintFile.PrintReunionCopasst(valores, this);
        }
    }
}