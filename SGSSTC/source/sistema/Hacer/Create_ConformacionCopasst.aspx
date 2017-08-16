<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ConformacionCopasst.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ConformacionCopasst" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
            <li><a href="#">Crear Conformación Copasst</a></li>
        </ol>
        
        <div class="page-header">
			<h1 class="text-center">Acta de conformación del comité paritario de seguridad y salud en el trabajo o 
				vigía de seguridad y salud en el trabajo</h1>
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

		<div class="row">
			<div class="col-md-4 col-md-offset-1">
				<h3>Empresa: </h3>
				<asp:label runat="server" id="txtEmpresa" cssclass="control-label" text="Nombre Empresa"></asp:label>

			</div>
		</div>
		
		<div class="row"> 
			<div class="col-md-4 col-md-offset-1">
				<h3>Período: </h3>
				<asp:textbox id="txtPeriodo" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
				
				<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
					display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="Textbox1" 
					runat="server" validationgroup="ValidationAdd"/>
			</div>
		</div>
		<br />

		<div class="row"> 
			<div class="col-md-11 col-md-offset-1">
				<table align="justify">

					<tr>
						<td class="col-md-8">
							<h3>El día :</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="txtFecha" runat="server" clientidmode="Static" cssclass="form-control" type="date"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="txtFecha" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								Se eligió el Comité Paritario de Seguridad y Salud en el Trabajo o el vigía de seguridad y 
								salud en el trabajo dando así cumplimiento a las exigencias de la Resolución  2013 de 1986, 
								al Decreto 1295 de 1994 y a la División de Salud Ocupacional del Ministerio de Protección 
								Social.
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-8">
							<h3>La modalidad utilizada para su elección fue </h3>
						</td>
						<td class="col-md-4">
							<h3>
								<asp:textbox id="txtModalidad" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
								
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="txtModalidad" runat="server" validationgroup="ValidationAdd"/>
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>Resultaron elegidos:</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox1" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox2" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox3" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox4" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox5" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td class="col-md-8">
							<h3>El número de votos obtenidos fue:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox6" runat="server" clientidmode="Static" cssclass="form-control" 
								type="number" min="0"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox6" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-8">
							<h3>El representante legal de la empresa designa a </h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox7" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox7" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-8">
							<h3>Como presidente del comité y por votación del comité se nombra a:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox8" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox8" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>						
						<td colspan="2" class="col-md-11">
							<h3>Como secretario (a) del mismo.</h3>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br />

		<div class="row" align="center">

			<div class="col-md-4 col-md-offset-4">
				<asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
					onclick="GenerarDocumento" validationgroup="ValidationAdd"/>
				<h4>Generar Documento</h4>
			</div>

		</div>

	</div>

</asp:Content>