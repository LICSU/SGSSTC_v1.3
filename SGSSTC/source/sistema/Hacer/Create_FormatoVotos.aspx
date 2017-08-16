<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_FormatoVotos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_FormatoVotos" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
            <li><a href="#">Crear Formato de Votos</a></li>
        </ol>
        
        <div class="page-header">
			<h1 class="text-center">Votos por candidatos individuales</h1>
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
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
					
					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						runat="server" ValidationGroup="ValidationAdd"/>
				</div>
			</asp:placeholder>
		</div>
		<br />
		<br />

		<div class="row">
			<div class="col-md-11 col-md-offset-1">
				<asp:Panel runat="server" id="pnDatos">
					<table class="table table-condensed">
						
						<tr class="bg-aqua color-palette">
							<th class="col-md-5 text-center">TRABAJADOR</th>
							<th class="col-md-5 text-center">FOTO</th>
							<th class="col-md-2 text-center">CAMPO VOTAR</th>
						</tr>

						<tr>
							<td>
								<asp:DropDownList runat="server" id="ddlTrabajador1" class="form-control" 
									AutoPostBack="true" OnSelectedIndexChanged="ddlTrabajador1_SelectedIndexChanged"></asp:DropDownList>
							</td>

							<td align="center">
								<asp:Image alt="-" runat="server" id="Image1" class="img-circle" width="128" height="128"/>
							</td>
							<td>

							</td>
						</tr>
						<tr>
							<td>
								<asp:DropDownList runat="server" id="ddlTrabajador2" class="form-control" 
									AutoPostBack="true" OnSelectedIndexChanged="ddlTrabajador2_SelectedIndexChanged"></asp:DropDownList>
							</td>

							<td align="center">
								<asp:Image alt="-" runat="server" id="Image2" class="img-circle" width="128" height="128"/>
							</td>
							<td>

							</td>
						</tr>
						<tr>
							<td>
								<asp:DropDownList runat="server" id="ddlTrabajador3" class="form-control" 
									AutoPostBack="true" OnSelectedIndexChanged="ddlTrabajador3_SelectedIndexChanged"></asp:DropDownList>
							</td>

							<td align="center">
								<asp:Image alt="-" runat="server" id="Image3" class="img-circle" width="128" height="128"/>
							</td>
							<td>

							</td>
						</tr>
						<tr>
							<td>
								<asp:DropDownList runat="server" id="ddlTrabajador4" class="form-control" 
									AutoPostBack="true" OnSelectedIndexChanged="ddlTrabajador4_SelectedIndexChanged"></asp:DropDownList>
							</td>

							<td align="center">
								<asp:Image alt="-" runat="server" id="Image4" class="img-circle" width="128" height="128"/>
							</td>
							<td>

							</td>
						</tr>

					</table>
				</asp:Panel>
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