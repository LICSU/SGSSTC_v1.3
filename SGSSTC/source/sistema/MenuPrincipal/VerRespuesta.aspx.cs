using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class VerRespuesta : System.Web.UI.Page
    {
        Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;
        Utilidades objUtilidades = new Utilidades();
        int IdRespuesta = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            IdRespuesta = objUtilidades.descifrarCadena(Request.QueryString["rs"]);

            CargarDatos();
        }

        public void CargarDatos()
        {
            List<Respuesta> ListRespuesta = new List<Respuesta>();
            ListRespuesta = Getter.Respuesta(IdRespuesta);

            foreach (var item in ListRespuesta)
            {
                lbUsuario.Text = item.usuario;
                lbPregunta.Text = item.Pregunta.titulo;
                lbRespuesta.Text = item.cuerpo_respuesta;
            }
        }
    }
}