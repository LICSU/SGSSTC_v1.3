using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
	public partial class Create_FormatoVotos : Page
	{
		private Model_UsuarioSistema ObjUsuario;
		private Tuple<bool, bool> BoolEmpSuc;


		protected void Page_Load(object sender, EventArgs e)
		{
			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);phAlerta.Visible = false;

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			List<empresa> ListaEmpresa = new List<empresa>();
			ListaEmpresa = Getter.Empresa(ObjUsuario.Id_empresa);

			if (!IsPostBack)
			{
				CargarListas();
			}
		}

		private void CargarListas()
		{
			if (BoolEmpSuc.Item1)
			{
				Listas.Empresa(ddlEmpresa);
			}
			else
			{
				Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
			}

			if (!BoolEmpSuc.Item2)
			{
				Listas.Trabajadores_Sucursal(ddlTrabajador1, ObjUsuario.Id_sucursal);
				Listas.Trabajadores_Sucursal(ddlTrabajador2, ObjUsuario.Id_sucursal);
				Listas.Trabajadores_Sucursal(ddlTrabajador3, ObjUsuario.Id_sucursal);
				Listas.Trabajadores_Sucursal(ddlTrabajador4, ObjUsuario.Id_sucursal);
			}
		}

		protected void GenerarDocumento(object sender, EventArgs e)
		{
			int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
			String[] valores = {
				string.Empty + IdSucursal,
				ddlTrabajador1.SelectedValue,
				ddlTrabajador2.SelectedValue,
				ddlTrabajador3.SelectedValue,
				ddlTrabajador4.SelectedValue,
				Image1.ImageUrl,
				Image3.ImageUrl,
				Image2.ImageUrl,
				Image4.ImageUrl,
				ddlTrabajador1.SelectedItem.ToString(),
				ddlTrabajador2.SelectedItem.ToString(),
				ddlTrabajador3.SelectedItem.ToString(),
				ddlTrabajador4.SelectedItem.ToString()
			};
			PrintFile.PrintFormatoVotos(valores, this);
		   
		}
		

		#region filtros

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
				Listas.Trabajadores_Sucursal(ddlTrabajador1, Convert.ToInt32(ddlSucursal.SelectedValue));
				Listas.Trabajadores_Sucursal(ddlTrabajador2, Convert.ToInt32(ddlSucursal.SelectedValue));
				Listas.Trabajadores_Sucursal(ddlTrabajador3, Convert.ToInt32(ddlSucursal.SelectedValue));
				Listas.Trabajadores_Sucursal(ddlTrabajador4, Convert.ToInt32(ddlSucursal.SelectedValue));

				Image1.ImageUrl = "";
				Image2.ImageUrl = "";
				Image3.ImageUrl = "";
				Image4.ImageUrl = "";
			}
		}
		protected void ddlTrabajador1_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlTrabajador1.SelectedValue != string.Empty)
			{
				Image1.ImageUrl = TraerFoto(ddlTrabajador1);
			}
			else
			{
				Image1.ImageUrl = "";
			}
		}
		protected void ddlTrabajador2_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlTrabajador2.SelectedValue != string.Empty)
			{
				Image2.ImageUrl = TraerFoto(ddlTrabajador2);
			}
			else
			{
				Image2.ImageUrl = "";
			}
		}
		protected void ddlTrabajador3_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlTrabajador3.SelectedValue != string.Empty)
			{
				Image3.ImageUrl = TraerFoto(ddlTrabajador3);
			}
			else
			{
				Image3.ImageUrl = "";
			}
		}
		protected void ddlTrabajador4_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlTrabajador4.SelectedValue != string.Empty)
			{
				Image4.ImageUrl = TraerFoto(ddlTrabajador4);
			}
			else
			{
				Image4.ImageUrl = "";
			}
		}
		public string TraerFoto(DropDownList ddlTrabajador)
		{
			string foto = "";
			List<trabajador> ListTrab = new List<trabajador>();
			ListTrab = Getter.Trabajador(Convert.ToInt32(ddlTrabajador.SelectedValue));

			foreach (var item in ListTrab)
			{
				if (item.foto != string.Empty)
				{
					foto = item.foto;
				}
				else
				{
					foto = "~/source/archivos/foto_perfil/usuario.png";
				}
			}

			return foto;
		}
		#endregion
	}
}