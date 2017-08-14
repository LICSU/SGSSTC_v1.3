<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_InvestigacionIncidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.View_InvestigacionIncidente" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:scriptmanager id="ScriptManager1" runat="server"/>
	<asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>
            
            <div class="container" style="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Verificar</a></li>
                    <li><a href="../Verificar/index_InvestigacionIncidente.aspx">Investigación de Incidente</a></li>
                    <li><a href="#">Consultar Investigación</a></li>
                </ol>
				
                <div class="page-header">
                    <h1 class="text-center">Ver Investigación de Incidente Laboral</h1>
                </div>				
				
				<div class="row">
					<div class="col-md-6">
						<h3>Sucursal</h3> 
						<asp:TextBox id="txtSucursal" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>

					</div>
				</div>
				<br />

				<!-- Datos del evento-->
				<div class="row">
					<h3>DATOS DEL EVENTO</h3>
					<div class="col-md-3">
						<h4 class="text-left">Fecha:</h4> 
						<asp:TextBox id="txtFechaEvento" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>

					<div class="col-md-3">
						<h4 class="text-left">Hora:</h4> 
						<asp:TextBox id="txtHoraEvento" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>

					<div class="col-md-3">
						<h4 class="text-left">Dia de la Semana:</h4> 
						<asp:TextBox id="ddlDiaSemana" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4 class="text-left">Lugar donde ocurrió:</h4> 
						<asp:TextBox id="txtLugarEvento" runat="server" CssClass="form-control" readonly ="true"></asp:TextBox>
					</div>

					<div class="col-md-3">
						<h4 class="text-left">Tipo de suceso:</h4> 
						<asp:TextBox id="txtTipo" runat="server" CssClass="form-control" readonly="true">Accidente</asp:TextBox>

					</div>
				</div>
				
				<!-- DATOS DEL ACCIDENTADO -->
				<div class="row">
					<h3>DATOS DEL INCIDENTADO</h3> 
					<div class="col-md-4">
						<h4 class="text-left">Nombre Completo:</h4> 
						<asp:TextBox id="txtTrabajador" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Cedula de Ciudadania:</h4> 
						<asp:TextBox id="txtCedula" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4 class="text-left">Mano dominante:</h4> 
						<asp:TextBox id="ddlMano" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Tipo de Vinculacion:</h4> 
						<asp:TextBox id="txtTipoVinculacion" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4 class="text-left">Antigüedad en el puesto de trabajo:</h4> 
						<asp:TextBox id="txtAntiguedad" type="number" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Cargo:</h4> 
						<asp:TextBox id="txtCargo" type="number" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Supervisor inmediato:</h4> 
						<asp:TextBox id="txtSupervisor" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Fecha de ingreso:</h4> 
						<asp:TextBox id="txtFechaIngreso" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4 class="text-left">Tiempo en el cargo:</h4> 
						<asp:TextBox id="txtTiempoCargo" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Salario devengado:</h4> 
						<asp:TextBox id="txtSalario" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">Actividad que realizaba:</h4> 
						<asp:TextBox id="txtActRealizaba" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>

				</div>

				<!-- DESCRIPCIÓN DEL INCIDENTE -->
				<div class="row">
					<h3>DESCRIPCIÓN DEL INCIDENTE</h3> 
					<div class="col-md-12">
						<asp:TextBox id="txtDescAccidente" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>

				<!-- ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR -->
				<div class="row">
					<h3>ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR</h3> 
					<div class="col-md-12">
						<asp:TextBox id="txtAdiestramiento" readonly="true" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
				<!-- COSTOS -->
				<div class="row">
					<h3>COSTOS</h3> 
					<div class="col-md-6">
						<h4 class="text-left">Transporte:</h4> 
						<asp:TextBox id="txtCostoTransporte" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">Reemplazo:</h4> 
						<asp:TextBox id="txtCostoReemplazo" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4 class="text-left">Atención médica:</h4> 
						<asp:TextBox id="txtCostoAtencionMedica" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">Reposo médico :</h4> 
						<asp:TextBox id="txtCostoReposoMedico" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4 class="text-left">Tratamiento:</h4> 
						<asp:TextBox id="txtCostoTratamiento" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">Daños materiales:</h4> 
						<asp:TextBox id="txtCostoDanhosMateriales" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4 class="text-left">Indemnización:</h4> 
						<asp:TextBox id="txtCostoIndemnización" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">Producción diferida:</h4> 
						<asp:TextBox id="txtCostoProdDiferida" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				
				<!-- ANÁLISIS DEL ACCIDENTE -->
				<div class="row">
					<h3>Actividad: </h3> 
					<div class="col-md-12">
						<asp:TextBox id="txtActividad" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				
				<!-- CINCO PORQUE -->
				<div class="row">
					<h3>IDENTIFICACIÓN DE POSIBLES CAUSAS DEL ACCIDENTE: </h3> 
					<div class="col-md-6">
						<h4 class="text-left">PREGUNTAS</h4> 
						<asp:TextBox id="txtPorque1" runat="server" CssClass="form-control" readonly="true">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">RESPUESTAS</h4> 
						<asp:TextBox id="txtRespuesta1" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque2" runat="server" CssClass="form-control" readonly="true">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta2" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque3" runat="server" CssClass="form-control" readonly="true">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque4" runat="server" CssClass="form-control" readonly="true">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta4" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque5" runat="server" CssClass="form-control" readonly="true">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta5" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				
				<!-- 5W2H -->
				<div class="row">
					<h3>RECONOCER CAUSAS GENERADORAS DEL ACCIDENTE: </h3> 
					<div class="col-md-6">
						<h4 class="text-left">PREGUNTAS</h4> 
						<asp:TextBox id="txtQue" runat="server" CssClass="form-control" readonly="true">¿Qué Sucedio ...?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4 class="text-left">RESPUESTAS</h4> 
						<asp:TextBox id="txtRespuestaQue" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque" runat="server" CssClass="form-control" readonly="true">¿Por qué sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuestaPorque" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtQuien" runat="server" CssClass="form-control" readonly="true">¿Quien fue el afectado ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaQuien" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtDonde" runat="server" CssClass="form-control" readonly="true">¿Dónde sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaDonde" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtCuando" runat="server" CssClass="form-control" readonly="true">¿Cuando sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaCuando" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtComo" runat="server" CssClass="form-control" readonly="true">¿Cómo sucedió....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaComo" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtCuanto" runat="server" CssClass="form-control" readonly="true">¿Cuanto es el costo de ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaCuanto" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<h4 class="text-left">Tipo de Incidente:</h4>
						<asp:TextBox id="ddlTipoAccidente" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>

					</div>
				</div>
				
				<!-- MEDIDAS A ADOPTAR -->
				<div class="row">
					<h3>MEDIDAS A ADOPTAR</h3> 
					<div class="col-md-7">
						<h4 class="text-left">Acción</h4> 
						<asp:TextBox id="txtAccion1" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Responsable</h4> 
						<asp:TextBox id="txtResponsable1" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4 class="text-left">Fecha</h4> 
						<asp:TextBox id="txtfecha1" type="date" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<h4 class="text-left">Acción</h4> 
						<asp:TextBox id="txtAccion2" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Responsable</h4> 
						<asp:TextBox id="txtResponsable2" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4 class="text-left">Fecha</h4> 
						<asp:TextBox id="txtFecha2" type="date" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<h4 class="text-left">Acción</h4> 
						<asp:TextBox id="txtAccion3" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4 class="text-left">Responsable</h4> 
						<asp:TextBox id="txtResponsable3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4 class="text-left">Fecha</h4> 
						<asp:TextBox id="txtFecha3" type="date" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h4 class="text-left">Nota</h4> 
						<asp:TextBox id="txtNota" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				

			</div>

		</ContentTemplate>
		<Triggers>
		</Triggers>

	</asp:updatepanel>
</asp:Content>