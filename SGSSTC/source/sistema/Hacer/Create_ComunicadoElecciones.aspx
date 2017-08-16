<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ComunicadoElecciones.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ComunicadoElecciones" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
            <li><a href="#">Crear Comunicado de Elecciones</a></li>
        </ol>
        
        <div class="page-header">
			<h1 class="text-center">Comunicado de Elecciones</h1>
        </div>

		<div class="row">
			<asp:placeholder runat="server" id="phEmpresa">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Empresa</h4>
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
				</div>
			</asp:placeholder>

			<asp:placeholder runat="server" id="phSucursal" visible="false">
				<div class="col-md-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
					
					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						runat="server" ValidationGroup="ValidationAdd"/>
				</div>
			</asp:placeholder>
		</div>
		<br />
		<br />

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<table align="justify">

					<tr>
						<td class="col-md-4">
							<h3>Ciudad y Fecha:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="txtFecha" runat="server" clientidmode="Static" cssclass="form-control" type="date"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtFecha"
								runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Dirigido a:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="txtDirigido" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtDirigido"
								runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>De:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="txtDe" runat="server" clientidmode="Static" cssclass="form-control"
								placeholder="(Gerencia General, Dirección de RRHH, etc.)"></asp:textbox>
							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtDe"
								runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Asunto:</h3>
						</td>
						<td class="col-md-8">
							<p>
								Elección de candidatos en representación de los trabajadores para la conformación 
								del Comité Paritario de Seguridad y Salud en el Trabajo con vigencia del año
							</p>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Del Año:</h3>
						</td>
						<td class="col-md-6">
							<asp:textbox id="txtAnho1" placeholder="Año Inicio" min="2000" max="2100" runat="server" clientidmode="Static"
								cssclass="form-control" type="number" width="100"></asp:textbox>
							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtAnho1"
								runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Al Año:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="txtAnho2" placeholder="Año Fin" min="2000" max="2100" runat="server" clientidmode="Static"
								cssclass="form-control" type="number" width="100"></asp:textbox>
							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtAnho2"
								runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								<asp:label runat="server" id="txtEmpresa" cssclass="control-label" text="Nombre Empresa"></asp:label>
								Dando cumplimiento a la legislación laboral relacionada con la conformación del 
								Comité Paritario de Seguridad y Salud en el Trabajo, convoca a la inscripción de los:
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>N° de Trabajadores:</h3>
						</td>
						<td class="col-md-11">
							<h3>
								<asp:textbox id="txtNumTrab" runat="server" clientidmode="Static" cssclass="form-control"
									type="number" min="0" placeholder="(N° de trabajadores según resolución 2013 de 1986)"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtNumTrab"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>candidatos con sus respectivos suplentes en representación de los trabajadores.
								<br />
								La hoja de inscripción de candidatos debe reclamarse en la oficina de:
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Contacto de salud ocupacional:</h3>
						</td>
						<td class="col-md-11">
							<h3>
								<asp:textbox id="txtContacto" runat="server" clientidmode="Static" cssclass="form-control"
									placeholder="(contacto de salud ocupacional)"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtContacto"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>hasta el día
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Máximo dos días hábiles:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="txtMaxDiasHabiles" runat="server" clientidmode="Static" cssclass="form-control"
									type="date"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtMaxDiasHabiles"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-12">
							<h3>y  deberá ser diligenciada y entregada nuevamente como fecha límite el día .</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Máximo tres días hábiles:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox1" runat="server" clientidmode="Static" cssclass="form-control"
									type="date"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox1"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-12">
							<h3>Las planchas presentadas serán publicadas en cartelera para conocimiento de todos los trabajadores por </h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Máximo dos días hábiles:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox2" runat="server" clientidmode="Static" cssclass="form-control"
									type="date"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox2"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-12">
							<h3>La votación de las diferentes planchas que se presenten se realizará el día</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Máximo 4 días de entregadas las hojas de inscripción:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox3" runat="server" clientidmode="Static" cssclass="form-control"
									type="date"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox3"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>En:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox4" runat="server" clientidmode="Static" cssclass="form-control"
									placeholder="(lugar de votación: la portería, la entrada al restaurante, la entrada al vestuario, la entrada al salón de producción o área de servicio)"></asp:textbox>
								
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox4"
									runat="server" validationgroup="ValidationAdd"/>
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>A las:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox5" runat="server" clientidmode="Static" cssclass="form-control"
									type="time"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox5"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-12">
							<h3>El conteo de votos se realizará el día </h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Día:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox6" runat="server" clientidmode="Static" cssclass="form-control"
									type="date"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox6"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>A las:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox7" runat="server" clientidmode="Static" cssclass="form-control"
									type="time"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox7"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-12">
							<h3>en presencia de un representante de cada una de las planchas presentadas y el jurado de votación.</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Cordialmente:</h3>
						</td>
						<td class="col-md-8">
							<h3>
								<asp:textbox id="Textbox8" runat="server" clientidmode="Static" cssclass="form-control"
									placeholder="Gerente/ Director RRHH/ Jefe de Personal"></asp:textbox>
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox8"
									runat="server" validationgroup="ValidationAdd"/>

							</h3>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br />

		<div class="row" align="center">

			<div class="col-md-4 col-md-offset-2">
				<asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
					onclick="GenerarDocumento" validationgroup="ValidationAdd"/>
				<h4>Generar Documento</h4>
			</div>

		</div>

	</div>

</asp:Content>