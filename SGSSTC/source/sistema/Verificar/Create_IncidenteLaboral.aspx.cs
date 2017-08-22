using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
	public partial class Create_IncidenteLaboral : System.Web.UI.Page
	{
		Model_UsuarioSistema ObjUsuario;
		Tuple<bool, bool> BoolEmpSuc;
		static int IdSucursal = 0;
		static int IdTrabajador = 0;

		#region acciones index
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Form.Attributes.Add("enctype", "multipart/form-data");

			ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

			BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

			phEmpresa.Visible = BoolEmpSuc.Item1;
			phSucursal.Visible = BoolEmpSuc.Item2;

			if (!IsPostBack)
			{
				CargarListas();
			}
		}
		public void CargarListas()
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
				IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
				Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
				Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", ObjUsuario.Id_sucursal);
			}

		}
		protected void btPrintSave_Click(object sender, EventArgs e)
		{
			at_it_el_pa nuevo = new at_it_el_pa()
			{
				fecha_accidente = Convert.ToDateTime(txtFechaAcc.Text),
				hora_accidente = Convert.ToDateTime(txtHoraAcc.Text),
				id_trabajador = IdTrabajador,
				id_area = Convert.ToInt32(ddlArea.SelectedValue),
				id_puesto = Convert.ToInt32(ddlProcesoTrabajo.SelectedValue),
				sitio = txtSitioIncidente.Text,
				descripcion = txtDescTarea.Text,
				condiciones_inseguras = txtCondIns.Text,
				actos_inseguros = txtActos.Text,
				factores_inseguros = txtFacTrab.Text,
				factores_personales = txtFactPersonales.Text,
				tipo_evento = "2",
				dias_incapacidad = Convert.ToInt32(txtDiasIncapacidad.Text),
				dias_cargados = Convert.ToInt32(txtDiasCargados.Text),
				dias_perdidos_ausencia = Convert.ToInt32(txtDiasPerdidosAusTrab.Text),
				dias_perdidos_restingido = Convert.ToInt32(txtDiasPerdidosctRest.Text),
				dias_no_perdidos = chkSinDias.Checked == true ? "true" : "false",
				tipo_enfermedad = ddlTipoEnfermedad.SelectedValue
			};

			int IdEmpresa = Getter.Set_IdEmpresaDDl(ObjUsuario, ddlEmpresa);

			ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

			if (ObjUsuario.Error)
			{
				int id_at_it_el_pa = GetterMax.Accidentes();

				#region insertar anexos
				if (fuAnexo.HasFile)
				{
					int i = 0;
					foreach (var archivo in fuAnexo.PostedFiles)
					{
						i++;
						string ruta = Utilidades.GuardarArchivo(archivo,
							"Accidente_" + id_at_it_el_pa + "_" + i, "~/source/archivos/incidentes/");

						soporte nuevoFA = new soporte()
						{
							url = ruta,
							id_tabla = id_at_it_el_pa
						};
						ObjUsuario.Error = CRUD.Add_Fila(nuevoFA, ObjUsuario.Id_usuario,
							HttpContext.Current.Request.Url.AbsoluteUri);

					}
				}
				#endregion

				Response.Redirect(Paginas.index_IncidenteLaboral.Value);
			}

		}
		#endregion

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
				IdSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
				Listas.Area_Sucursal(ddlArea, Convert.ToInt32(ddlSucursal.SelectedValue), "Ninguna");
				Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", Convert.ToInt32(ddlSucursal.SelectedValue), "Ninguno");
			}

		}
		protected void btnReset_Click(object sender, EventArgs e)
		{
			Button miBoton = (Button)sender;

			if (miBoton.ID == "btnReset")
			{
				txtCondIns.Text = string.Empty;
			}
			else if (miBoton.ID == "btnReset2")
			{
				txtActos.Text = string.Empty;
			}
			else if (miBoton.ID == "btnReset3")
			{
				txtFacTrab.Text = string.Empty;
			}
			else if (miBoton.ID == "btnReset4")
			{
				txtFactPersonales.Text = string.Empty;
			}


		}
		protected void ddlcond_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList miDDl = (DropDownList)sender;

			if (miDDl.SelectedValue != string.Empty)
			{
				if (txtCondIns.Text != string.Empty)
				{
					txtCondIns.Text = txtCondIns.Text + " - " + miDDl.SelectedValue;
				}
				else
				{
					txtCondIns.Text = miDDl.SelectedValue + " ";
				}

			}
			miDDl.SelectedValue = string.Empty;

		}
		protected void ddlActos_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList miDDl = (DropDownList)sender;

			if (miDDl.SelectedValue != string.Empty)
			{
				if (txtActos.Text != string.Empty)
				{
					txtActos.Text = txtActos.Text + " - " + miDDl.SelectedValue;
				}
				else
				{
					txtActos.Text = miDDl.SelectedValue + " ";
				}

			}
			miDDl.SelectedValue = string.Empty;

		}
		protected void ddlFacTrab_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList miDDl = (DropDownList)sender;

			if (miDDl.SelectedValue != string.Empty)
			{
				if (txtFacTrab.Text != string.Empty)
				{
					txtFacTrab.Text = txtFacTrab.Text + " - " + miDDl.SelectedValue;
				}
				else
				{
					txtFacTrab.Text = miDDl.SelectedValue + " ";
				}

			}
			miDDl.SelectedValue = string.Empty;

		}
		protected void ddlFacPers_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList miDDl = (DropDownList)sender;

			if (miDDl.SelectedValue != string.Empty)
			{
				if (txtFactPersonales.Text != string.Empty)
				{
					txtFactPersonales.Text = txtFactPersonales.Text + " - " + miDDl.SelectedValue;
				}
				else
				{
					txtFactPersonales.Text = miDDl.SelectedValue + " ";
				}

			}
			miDDl.SelectedValue = string.Empty;

		}
		
		#endregion

		#region AutoCompletar
		[ScriptMethod()]
		[WebMethod]
		public static List<string> SearchTrabajador(string prefixText, int count)
		{
			List<string> listTrabajadores = Utilidades.SearchTrabajador(prefixText, count, IdSucursal, ref IdTrabajador);
			return listTrabajadores;
		}
		#endregion
	}
}