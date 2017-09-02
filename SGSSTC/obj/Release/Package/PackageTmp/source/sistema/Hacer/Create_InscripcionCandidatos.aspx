<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_InscripcionCandidatos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_InscripcionCandidatos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
			<li><a href="#">Crear Inscripción de Candidato</a></li>
		</ol>
		
		<div class="page-header">
			<h1 class="text-center">Hoja de inscripción de los candidatos al comité paritario de seguridad y salud en el trabajo</h1>
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
				<asp:Panel runat="server" id="pnDatos">
					<table class="table table-condensed">
						
						<tr class="bg-aqua color-palette">
							<th class="col-md-3 text-center">NOMBRE</th>
							<th class="col-md-3 text-center">OFICIO</th>
							<th class="col-md-3 text-center">SECCION</th>
							<th class="col-md-3 text-center">FECHA</th>
						</tr>

						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox1" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox2" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox3" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox4" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox5" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox6" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox7" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox8" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox9" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox10" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox11" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox12" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox13" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox14" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox15" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox16" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox17" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox18" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox19" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox20" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox21" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox22" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox23" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox24" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox25" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox26" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox27" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox28" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox29" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox30" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox31" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox32" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox33" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox34" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox35" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox36" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>
						<tr>
							<td class="col-md-3">
								<asp:textbox id="Textbox37" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox1" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox38" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox2" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox39" runat="server" clientidmode="Static" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox3" runat="server" validationgroup="ValidationAdd"/>
							</td>
							<td class="col-md-3">
								<asp:textbox id="Textbox40" runat="server" clientidmode="Static" type="date" cssclass="form-control"></asp:textbox>
							
								<asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
									display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
									controltovalidate="Textbox4" runat="server" validationgroup="ValidationAdd"/>
							</td>
						</tr>

					</table>
				</asp:Panel>
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

</asp:Content>