<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_InvestigacionAccidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.Create_InvestigacionAccidente" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>


				<ol class="breadcrumb">
					<li><a href="#">Fase: Hacer</a></li>
					<li><a href="../Hacer/index_InvestigacionAccidente.aspx">Investigación de Accidente</a></li>
					<li><a href="#">Crear Investigación</a></li>
				</ol>
				
				<div class="page-header">
					<h1 class="text-center">Nueva Investigación de Accidente Laboral</h1>
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
						<h4>Fecha:</h4> 
						<asp:TextBox id="txtFechaEvento" type="date" runat="server" CssClass="form-control"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFechaEvento" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Hora:</h4> 
						<asp:TextBox id="txtHoraEvento" type="time" runat="server" CssClass="form-control"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtHoraEvento" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Dia de la Semana:</h4> 
						<asp:DropDownList  runat="server" id="ddlDiaSemana" CssClass="form-control">
							<asp:ListItem Text="Lunes" Value="Lunes"></asp:ListItem>
							<asp:ListItem Text="Martes" Value="Martes"></asp:ListItem>
							<asp:ListItem Text="Miércoles" Value="Miércoles"></asp:ListItem>
							<asp:ListItem Text="Jueves" Value="Jueves"></asp:ListItem>
							<asp:ListItem Text="Viernes" Value="Viernes"></asp:ListItem>
							<asp:ListItem Text="Sábado" Value="Sábado"></asp:ListItem>
							<asp:ListItem Text="Domingo" Value="Domingo"></asp:ListItem>
						</asp:DropDownList>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlDiaSemana" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4>Lugar donde ocurrió:</h4> 
						<asp:TextBox id="txtLugarEvento" runat="server" CssClass="form-control" readonly ="true"></asp:TextBox>
					</div>

					<div class="col-md-3">
						<h4>Tipo de suceso:</h4> 
						<asp:TextBox id="txtTipo" runat="server" CssClass="form-control" readonly="true">Accidente</asp:TextBox>

					</div>
				</div>
				
				<!-- DATOS DEL ACCIDENTADO -->
				<div class="row">
					<h3>DATOS DEL ACCIDENTADO</h3> 
					<div class="col-md-4">
						<h4>Nombre Completo:</h4> 
						<asp:TextBox id="txtTrabajador" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Cedula de Ciudadania:</h4> 
						<asp:TextBox id="txtCedula" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4>Mano dominante:</h4> 
						<asp:TextBox id="ddlMano" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Tipo de Vinculacion:</h4> 
						<asp:TextBox id="txtTipoVinculacion" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4>Antigüedad en el puesto:</h4> 
						<asp:TextBox id="txtAntiguedad" type="number" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Cargo:</h4> 
						<asp:TextBox id="txtCargo" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Supervisor inmediato:</h4> 
						<asp:TextBox id="txtSupervisor" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Fecha de ingreso:</h4> 
						<asp:TextBox id="txtFechaIngreso" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<h4>Tiempo en el cargo:</h4> 
						<asp:TextBox id="txtTiempoCargo" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Salario devengado:</h4> 
						<asp:TextBox id="txtSalario" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Actividad que realizaba:</h4> 
						<asp:TextBox id="txtActRealizaba" runat="server" CssClass="form-control"></asp:TextBox>
					</div>

				</div>
				
				<!-- DATOS DE EVALUACIÓN DEL MÉDICO -->
				<div class="row">
					<h3>DATOS DE EVALUACIÓN DEL MÉDICO</h3> 
					<div class="col-md-6">
						<h4>Naturaleza de la lesión: </h4> 
						<asp:TextBox id="txtNaturalezaLesion" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Gravedad: </h4> 
						<asp:TextBox id="txtGravedad" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h4>DESCRIPCIÓN DE LA LESIÓN</h4> 
						<asp:TextBox id="txtDescLesion" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<h4>Reposo:</h4> 
						<asp:TextBox id="txtReposo" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-4">
						<h4>No. Días:</h4> 
						<asp:TextBox id="txtNumDias" type="number" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-4">
						<h4>Fecha de reintegro:</h4> 
						<asp:TextBox id="txtFechaReintegro" type="date" runat="server" CssClass="form-control"></asp:TextBox>
					</div>

				</div>
				
				<!-- DESCRIPCIÓN DEL ACCIDENTE -->
				<div class="row">
					<h3>DESCRIPCIÓN DEL ACCIDENTE</h3> 
					<div class="col-md-12">
						<asp:TextBox id="txtDescAccidente" TextMode="multiline" Rows="3" runat="server" CssClass="form-control" readonly="true"></asp:TextBox>
					</div>
				</div>

				<!-- ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR -->
				<div class="row">
					<h3>ADIESTRAMIENTO RECIBIDO POR EL TRABAJADOR</h3> 
					<div class="col-md-12">
						<asp:TextBox id="txtAdiestramiento" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
				<!-- COSTOS -->
				<div class="row">
					<h3>COSTOS</h3> 
					<div class="col-md-6">
						<h4>Transporte:</h4> 
						<asp:TextBox id="txtCostoTransporte" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Reemplazo:</h4> 
						<asp:TextBox id="txtCostoReemplazo" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4>Atención médica:</h4> 
						<asp:TextBox id="txtCostoAtencionMedica" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Reposo médico :</h4> 
						<asp:TextBox id="txtCostoReposoMedico" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4>Tratamiento:</h4> 
						<asp:TextBox id="txtCostoTratamiento" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Daños materiales:</h4> 
						<asp:TextBox id="txtCostoDanhosMateriales" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<h4>Indemnización:</h4> 
						<asp:TextBox id="txtCostoIndemnización" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>Producción diferida:</h4> 
						<asp:TextBox id="txtCostoProdDiferida" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
				<!-- ANÁLISIS DEL ACCIDENTE -->
				<div class="row">
					<h3>ANÁLISIS DEL ACCIDENTE</h3>
					<div class="col-md-12">
						<h4>Actividad: </h4> 
						<asp:TextBox id="txtActividad" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
				<!-- CINCO PORQUE -->
				<div class="row">
					<h3>IDENTIFICACIÓN DE POSIBLES CAUSAS DEL ACCIDENTE: </h3> 
					<div class="col-md-6">
						<h4>PREGUNTAS</h4> 
						<asp:TextBox id="txtPorque1" runat="server" CssClass="form-control">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>RESPUESTAS</h4> 
						<asp:TextBox id="txtRespuesta1" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque2" runat="server" CssClass="form-control">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta2" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque3" runat="server" CssClass="form-control">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque4" runat="server" CssClass="form-control">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta4" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque5" runat="server" CssClass="form-control">¿Por qué ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuesta5" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
				<!-- 5W2H -->
				<div class="row">
					<h3>RECONOCER CAUSAS GENERADORAS DEL ACCIDENTE: </h3> 
					<div class="col-md-6">
						<h4>PREGUNTAS</h4> 
						<asp:TextBox id="txtQue" runat="server" CssClass="form-control">¿Qué Sucedio ...?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<h4>RESPUESTAS</h4> 
						<asp:TextBox id="txtRespuestaQue" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtPorque" runat="server" CssClass="form-control">¿Por qué sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtRespuestaPorque" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtQuien" runat="server" CssClass="form-control">¿Quien fue el afectado ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaQuien" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtDonde" runat="server" CssClass="form-control">¿Dónde sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaDonde" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtCuando" runat="server" CssClass="form-control">¿Cuando sucedio ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaCuando" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtComo" runat="server" CssClass="form-control">¿Cómo sucedió....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaComo" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<asp:TextBox id="txtCuanto" runat="server" CssClass="form-control">¿Cuanto es el costo de ....?</asp:TextBox>
					</div>
					<div class="col-md-6">
						<asp:TextBox id="txtrespuestaCuanto" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<h4>Tipo de Accidente:</h4> 
						<asp:DropDownList  runat="server" id="ddlTipoAccidente" CssClass="form-control">
							<asp:ListItem Text="Salida Oficial" Value=" Salida Oficial"></asp:ListItem>
							<asp:ListItem Text="Propio del Trabajo" Value="Propio del Trabajo"></asp:ListItem>
							<asp:ListItem Text="Comision" Value="Comision"></asp:ListItem>
							<asp:ListItem Text="Violencia" Value="Violencia"></asp:ListItem>
						</asp:DropDownList>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlTipoAccidente" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Tipo de Lesión:</h4> 
						<asp:DropDownList  runat="server" id="ddlTipoLesión" CssClass="form-control">
							<asp:ListItem Text="Fractura" Value="Fractura"></asp:ListItem>
							<asp:ListItem Text="Luxación" Value="Luxación"></asp:ListItem>
							<asp:ListItem Text="Torcedura, esguince, desgarro muscular" Value="Torcedura, esguince, desgarro muscular"></asp:ListItem>
							<asp:ListItem Text="Conmoción o trauma interno" Value="Conmoción o trauma interno"></asp:ListItem>
							<asp:ListItem Text="Amputación o enucleación " Value="Amputación o enucleación "></asp:ListItem>
							<asp:ListItem Text="Herida" Value="Herida"></asp:ListItem>
							<asp:ListItem Text="Trauma superficial (Incluye rasguño, punción o pinchazo)" Value="Trauma superficial (Incluye rasguño, punción o pinchazo)"></asp:ListItem>
							<asp:ListItem Text="Golpe, contusión o aplastamiento" Value="Golpe, contusión o aplastamiento"></asp:ListItem>
							<asp:ListItem Text="Quemadura" Value="Quemadura"></asp:ListItem>
						</asp:DropDownList>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlTipoLesión" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Agente de Lesión:</h4> 
						<asp:DropDownList  runat="server" id="ddlAgenteLesion" CssClass="form-control">
							<asp:ListItem Text="Alturas" Value="Alturas"></asp:ListItem>
							<asp:ListItem Text="Animales (vivos o productos animales)" Value="Animales (vivos o productos animales)"></asp:ListItem>
							<asp:ListItem Text="Ambiente de trabajo " Value="Ambiente de trabajo "></asp:ListItem>
							<asp:ListItem Text="Agentes no clasificados por falta de datos" Value="Agentes no clasificados por falta de datos"></asp:ListItem>
							<asp:ListItem Text="Cuerpo extraño" Value="Cuerpo extraño"></asp:ListItem>
							<asp:ListItem Text="Herramientas" Value="Herramientas"></asp:ListItem>
							<asp:ListItem Text="Radiaciones" Value="Radiaciones"></asp:ListItem>
							<asp:ListItem Text="Medios de Transporte" Value="Medios de Transporte"></asp:ListItem>
							<asp:ListItem Text="Máquinas y/o equipos" Value="Máquinas y/o equipos"></asp:ListItem>
							<asp:ListItem Text="Sustancias" Value="Sustancias"></asp:ListItem>
						</asp:DropDownList>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlAgenteLesion" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Parte del cuerpo afectada:</h4> 
						<asp:DropDownList  runat="server" id="ddlParteCuerpo" CssClass="form-control">
							<asp:ListItem Text="Abdomen" Value="Abdomen"></asp:ListItem>
							<asp:ListItem Text="Cabeza" Value="Cabeza"></asp:ListItem>
							<asp:ListItem Text="Cuello" Value="Cuello"></asp:ListItem>
							<asp:ListItem Text="Miembros Superiores" Value="Miembros Superiores"></asp:ListItem>
							<asp:ListItem Text="Miembros Inferiores" Value="Miembros Inferiores"></asp:ListItem>
							<asp:ListItem Text="Ojos" Value="Ojos"></asp:ListItem>
							<asp:ListItem Text="Pies" Value="Pies"></asp:ListItem>
							<asp:ListItem Text="Manos" Value="Manos"></asp:ListItem>
							<asp:ListItem Text="Sistema Organic" Value="Sistema Organic"></asp:ListItem>
							<asp:ListItem Text="Tronco" Value="Tronco"></asp:ListItem>
						</asp:DropDownList>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
							ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlParteCuerpo" runat="server" 
							ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				
				<!-- MEDIDAS A ADOPTAR -->
				<div class="row">
					<h3>MEDIDAS A ADOPTAR</h3> 
					<div class="col-md-7">
						<h4>Acción</h4> 
						<asp:TextBox id="txtAccion1" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Responsable</h4> 
						<asp:TextBox id="txtResponsable1" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4>Fecha</h4> 
						<asp:TextBox id="txtfecha1" type="date" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<h4>Acción</h4> 
						<asp:TextBox id="txtAccion2" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Responsable</h4> 
						<asp:TextBox id="txtResponsable2" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4>Fecha</h4> 
						<asp:TextBox id="txtFecha2" type="date" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<h4>Acción</h4> 
						<asp:TextBox id="txtAccion3" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-3">
						<h4>Responsable</h4> 
						<asp:TextBox id="txtResponsable3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
					<div class="col-md-2">
						<h4>Fecha</h4> 
						<asp:TextBox id="txtFecha3" type="date" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h4>Nota</h4> 
						<asp:TextBox id="txtNota" TextMode="multiline" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
					</div>
				</div>
				
			
				<!-- Anexos-->
				<div class="row">
					<h3>Soportes fotográficos</h3>
					<div class="col-md-6">
						<asp:FileUpload runat="server" id="fuAnexo" AllowMultiple="true"/>
					</div>
				</div>
				
				<!-- Boton-->
				<div class="row">					
					<div class="col-md-2 col-md-offset-4">
						<asp:Button runat="server" id="btPrintSave" Text="Guardar" class="btn btn-block btn-info" 
							OnClick="btPrintSave_Click" ValidationGroup="ValidationAdd"></asp:Button>
					</div>
					
					<div class="col-md-2">
						<asp:Button runat="server" id="Button1" Text="Volver" class="btn btn-block btn-default" OnClick="Volver"></asp:Button>
					</div>
				</div>



		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger ControlID = "btPrintSave"/>
		</Triggers>

	</asp:updatepanel>
</asp:Content>