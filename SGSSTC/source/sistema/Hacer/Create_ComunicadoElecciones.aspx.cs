using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{

    public partial class Create_ComunicadoElecciones : Page
    {
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;
#pragma warning disable CS0169 // The field 'Create_ComunicadoElecciones._textbox' is never used
        TextBox _textbox;
#pragma warning restore CS0169 // The field 'Create_ComunicadoElecciones._textbox' is never used

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            List<empresa> ListaEmpresa = new List<empresa>();
            ListaEmpresa = Getter.Empresa(ObjUsuario.Id_empresa);

            foreach (var item in ListaEmpresa)
            {
                txtEmpresa.Text = item.nombre;
            }

            if (!IsPostBack)
            {
                CargarListas();
            }
        }

        protected void CargarListas()
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

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            String[] valores = {
                string.Empty + IdSucursal,
                txtFecha.Text,
                txtDirigido.Text,
                txtDe.Text,
                txtAnho1.Text,
                txtAnho2.Text,
                txtEmpresa.Text,
                txtNumTrab.Text,
                txtContacto.Text,
                txtMaxDiasHabiles.Text,
                Textbox1.Text,
                Textbox2.Text,
                Textbox3.Text,
                Textbox4.Text,
                Textbox5.Text,
                Textbox6.Text,
                Textbox7.Text,
                Textbox8.Text
            };
            PrintFile.PrintComunicadoElecciones(valores, this);
        }


        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
    }
}