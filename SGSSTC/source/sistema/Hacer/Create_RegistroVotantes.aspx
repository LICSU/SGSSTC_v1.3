<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_RegistroVotantes.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_RegistroVotantes" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
            <li><a href="#">Crear Registro de Votantes</a></li>
        </ol>
		
        <div class="page-header">
			<h3 class="text-center">Registro de votantes comité paritario de seguridad y salud en el trabajo</h1>
        </div>
		
		<div class="row">

			<asp:placeholder runat="server" id="phEmpresa">
				<div class="col-md-4">
					<h4 class="text-center">Empresa</h4>
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
				</div>
			</asp:placeholder>

			<asp:placeholder runat="server" id="phSucursal" visible="false">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
					
					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						runat="server" ValidationGroup="ValidationAdd"/>
				</div>
			</asp:placeholder>
		</div>
		<br />

		
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-condensed">					
					<tbody>

					<tr class="bg-aqua color-palette">
						<th class="col-md-1 text-center">N°</th>
						<th class="col-md-4 text-center">NOMBRE</th>
						<th class="col-md-3 text-center">CEDULA</th>
						<th class="col-md-4 text-center">FIRMA TRABAJADOR</th>
					</tr>
				   
					<asp:panel runat="server" id="pDatos"></asp:panel>


					</tbody>
					
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