using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Create_PerfilCargo : System.Web.UI.Page
    {
        protected static Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                Listas.Cno(ddlCargo);

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            perfil_cargo nuevo = new perfil_cargo()
            {
                id_empresa = ObjUsuario.Id_empresa,
                descripcion = txtDescripcion.Text,
                nombre = txtNombre.Text,
                id_cno = Convert.ToInt32(ddlCargo.SelectedValue)
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                Response.Redirect(Paginas.index_PerfilCargo.Value);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            String[] valores = {
                string.Empty + ObjUsuario.Id_sucursal,
                txtNombre.Text,
                ddlCargo.SelectedItem.Text,
                txtDescripcion.Text
            };
            PrintFile.PrintPerfilCargo(valores, this);
        }
    }
}