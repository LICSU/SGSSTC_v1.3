﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ActaCierre.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ActaCierre" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
            <li><a href="#">Acta de cierre</a></li>
        </ol>
        
        <div class="page-header">
			<h1 class="text-center">Acta de cierre de las votaciones para elección de los candidatos al comité 
				paritario de seguridad y salud en el trabajo</h1>
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
						<td class="col-md-4">
							<h3>Siendo las:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox1" runat="server" clientidmode="Static" cssclass="form-control" 
								type="time"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>De la fecha:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox2" runat="server" clientidmode="Static" cssclass="form-control" 
								type="date"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								se dio por finalizado el proceso de votación para elección de los candidatos al COMITÉ 
								PARITARIO DE SEGURIDAD Y SALUD EN EL TRABAJO  para el período  que va de
							</h3>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>De:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox3" runat="server" clientidmode="Static" cssclass="form-control" 
								type="date"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">
							<h3>Hasta:</h3>
						</td>
						<td class="col-md-4">
							<asp:textbox id="Textbox4" runat="server" clientidmode="Static" cssclass="form-control" 
								type="date"></asp:textbox>

							<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
								display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
								controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								Como jurados de mesa estuvieron presentes los señores (as):
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox5" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox6" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox7" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox8" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<asp:textbox id="Textbox9" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								Nombre y Firma del Coordinador de la mesa de votación:
								<br /><br />
								______________________________________________________________
							</h3>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-md-11">
							<h3>
								Nombre y Firma del Coordinador de la mesa de votación:
								<br /><br />
								______________________________________________________________
							</h3>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br />

		<div class="row" align="center">

			<div class="col-md-4 col-md-offset-4">
				<asp:imagebutton id="btnPrint" runat="server" imageurl="~\ico\print.png"
					onclick="GenerarDocumento" validationgroup="ValidationAdd"/>
				<h4>Generar Documento</h4>
			</div>

		</div>

	</div>

</asp:Content>