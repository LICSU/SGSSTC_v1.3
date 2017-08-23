using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
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
            if (!IsPostBack)
            {
                CargarDatos();
            }
        }

        public void CargarDatos()
        {
            List<usuario> ListUsuario = new List<usuario>();
            ListUsuario = Getter.Usuario(ObjUsuario.Id_usuario);
            string nomUsuario = string.Empty;
            foreach (var item in ListUsuario)
            {
                nomUsuario = item.login;
            }
            
            List<Respuesta> ListRespuesta = new List<Respuesta>();
            ListRespuesta = Getter.Respuesta(IdRespuesta);

            foreach (var item in ListRespuesta)
            {
                lbUsuario.Text = item.usuario;
                lbPregunta.Text = item.Pregunta.titulo;
                lbRespuesta.Text = item.cuerpo_respuesta;
                ddlCalificacion.SelectedIndex = Convert.ToInt32(item.calificacion);

                if (item.usuario.Equals(nomUsuario))
                {
                    phCalificar.Visible = true;
                }
                else
                {
                    phCalificar.Visible = false;
                }
            }
        }

        protected void CalificarRespuesta(object sender, EventArgs e)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            Respuesta Edit = contexto.Respuesta.SingleOrDefault(b => b.id_respuesta == IdRespuesta);

            if (Edit != null)
            {
                Edit.calificacion = Convert.ToInt32(ddlCalificacion.SelectedValue);
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            CargarDatos();
        }


    }
}