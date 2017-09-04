﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
	public partial class Update_Accidentes : System.Web.UI.Page
	{
		Model_UsuarioSistema ObjUsuario;
		Tuple<bool, bool> BoolEmpSuc;
		Utilidades objUtilidades = new Utilidades();
		int idAccidente;

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
				CargarAccidente();
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
				Listas.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
				Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
				Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", ObjUsuario.Id_sucursal);
			}
		}
		public void CargarAccidente()
		{
			idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
			ListAccidentes = Getter.Accidente(idAccidente);

			foreach (var item in ListAccidentes)
			{
				int IdSucursal = Convert.ToInt32(item.trabajador.puesto_trabajo.area.id_sucursal);
				ddlSucursal.SelectedValue = string.Empty + IdSucursal;

				txtFechaAcc.Text = item.fecha_accidente.Value.ToString("yyyy-MM-dd");
				txtHoraAcc.Text = item.hora_accidente.Value.ToString("hh:mm:ss");

				Listas.Trabajadores_Sucursal(ddlTrabajador, IdSucursal);
				ddlTrabajador.SelectedValue = Convert.ToString(item.id_trabajador);

				Listas.Area_Sucursal(ddlArea, IdSucursal, "Ninguna");
				ddlArea.SelectedValue = Convert.ToString(item.id_area);

				Listas.PuestoTrabajo(ddlProcesoTrabajo, "Sucursal", IdSucursal, "Ninguno");
				ddlProcesoTrabajo.SelectedValue = Convert.ToString(item.id_puesto);

				txtSitioAccidente.Text = Convert.ToString(item.sitio);
				txtDescTarea.Text = Convert.ToString(item.descripcion);
				txtCondIns.Text = Convert.ToString(item.condiciones_inseguras);
				txtActos.Text = Convert.ToString(item.actos_inseguros);
				txtFacTrab.Text = Convert.ToString(item.factores_inseguros);
				txtFactPersonales.Text = Convert.ToString(item.factores_personales);

				if (item.fecha_muerte != null)
				{
					txtFechaMuerte.Text = item.fecha_muerte.Value.ToString("yyyy-MM-dd");
				}

				txtDiasIncapacidad.Text = Convert.ToString(item.dias_incapacidad);
				txtDiasCargados.Text = Convert.ToString(item.dias_cargados);
				txtDiasPerdidosAusTrab.Text = Convert.ToString(item.dias_perdidos_ausencia);
				txtDiasPerdidosctRest.Text = Convert.ToString(item.dias_perdidos_restingido);

				if (Convert.ToString(item.tipo_enfermedad) == "A") { ddlTipoEnfermedad.SelectedValue = "Enfermedades en la piel"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "B") { ddlTipoEnfermedad.SelectedValue = "Enfermedades respiratorias"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "C") { ddlTipoEnfermedad.SelectedValue = "Envenenamiento"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "D") { ddlTipoEnfermedad.SelectedValue = "Enfermedades debidas a agentes físicos"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "E") { ddlTipoEnfermedad.SelectedValue = "Enfermedades producidas por traumas repetitivos"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "F") { ddlTipoEnfermedad.SelectedValue = "Otras enfermedades osteomusculares"; }
				else if (Convert.ToString(item.tipo_enfermedad) == "G") { ddlTipoEnfermedad.SelectedValue = "Demás enfermedades profesionales"; }

				if (Convert.ToString(item.dias_no_perdidos) == "true")
				{
					chkSinDias.Checked = true;

				}
				else
				{
					chkSinDias.Checked = false;
				}
			}
		}
		protected void btPrintSave_Click(object sender, EventArgs e)
		{
			DateTime? myDate = null;
			myDate = txtFechaMuerte.Text == string.Empty ? myDate : Convert.ToDateTime(txtFechaMuerte.Text);

			GrupoLiEntities contexto = new GrupoLiEntities();
			int idAccidente = objUtilidades.descifrarCadena(Request.QueryString["id"]);
			at_it_el_pa Edit = contexto.at_it_el_pa.SingleOrDefault(b => b.id_at_it_el_pa == idAccidente);

			if (Edit != null)
			{
				Edit.fecha_accidente = Convert.ToDateTime(txtFechaAcc.Text);
				Edit.hora_accidente = Convert.ToDateTime(txtHoraAcc.Text);
				Edit.id_trabajador = Convert.ToInt32(ddlTrabajador.SelectedValue);
				Edit.id_area = Convert.ToInt32(ddlArea.SelectedValue);
				Edit.id_puesto = Convert.ToInt32(ddlProcesoTrabajo.Text);
				Edit.sitio = txtSitioAccidente.Text;
				Edit.descripcion = txtDescTarea.Text;
				Edit.condiciones_inseguras = txtCondIns.Text;
				Edit.actos_inseguros = txtActos.Text;
				Edit.factores_inseguros = txtFacTrab.Text;
				Edit.factores_personales = txtFactPersonales.Text;
				Edit.tipo_evento = "1";
				Edit.fecha_muerte = myDate;
				Edit.dias_incapacidad = Convert.ToInt32(txtDiasIncapacidad.Text);
				Edit.dias_cargados = Convert.ToInt32(txtDiasCargados.Text);
				Edit.dias_perdidos_ausencia = Convert.ToInt32(txtDiasPerdidosAusTrab.Text);
				Edit.dias_perdidos_restingido = Convert.ToInt32(txtDiasPerdidosctRest.Text);
				Edit.dias_no_perdidos = chkSinDias.Checked == true ? "true" : "false";
				Edit.tipo_enfermedad = ddlEmpresa.SelectedValue;
			}

			ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

			if (ObjUsuario.Error)
			{
				Response.Redirect(Paginas.index_AccidenteLaboral.Value);
			}
			else
			{
				Modal.MostrarMsjModal(MensajeError.Fallo_Edit_Accidente.Value, "ERR", this);
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
				Listas.Trabajadores_Sucursal(ddlTrabajador, Convert.ToInt32(ddlSucursal.SelectedValue));
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
	}
}