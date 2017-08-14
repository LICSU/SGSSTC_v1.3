﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_DesignacionVigia.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_DesignacionVigia" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">
        
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
                <li><a href="#">Crear Designación Vigia</a></li>
            </ol>
        
        <div class="page-header">
			<h1 class="text-center">Acta de designación del Vigía en Seguridad y Salud en el Trabajo</h1>
        </div>

		<div class="row">
			<asp:PlaceHolder runat="server" id="phEmpresa">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Empresa</h4>
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
				</div>
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
				<div class="col-md-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
					
					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						runat="server" ValidationGroup="ValidationAdd"/>
				</div>
			</asp:PlaceHolder>
		</div>
		
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<p><h3>
					En cumplimiento a lo establecido en el Decreto 1072 del 2015, se designa como Vigía en Seguridad y 
					Salud en el Trabajo a:
					<br /><br />
					<asp:TextBox id="txtVigia" runat="server" ClientIDMode="Static" CssClass="form-control" 
						placeholder="(indique nombre del vigía, y el cargo)"></asp:TextBox>
					<br />
					En virtud a lo anterior, el referido actuará como vigía en Seguridad y Salud en el Trabajo por el 
					término de 2 años de conformidad con el Decreto 1295 de 1994, período durante el cual el empleador 
					se obliga a facilitar el tiempo necesario dentro de la jornada laboral para que realice sus
					respectivas funciones.
					<br /><br />
					
					La presente se firma el <br /><br />
					<div class="col-md-4">
						<asp:TextBox id="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" type="date"></asp:TextBox>
					</div>
					<br /><br />, con la aprobación de los trabajadores que integran la organización:
				</h3></p>
				
				<div class="row">
					<div class="col-md-12">
						<asp:Panel runat="server" id="pnDatos">
						<table class="table table-condensed">
							<tbody>
								<tr class="bg-aqua color-palette">
									<th class="col-md-1 text-center">N°</th>
									<th class="col-md-6 text-center">Nombre</th>
									<th class="col-md-5 text-center">Cargo</th>
								</tr>
								
								<tr>
									<td>1</td>
									<td>										
										<asp:textbox id="Textbox1" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox2" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>2</td>
									<td>							
										<asp:textbox id="Textbox3" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox4" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>3</td>
									<td>							
										<asp:textbox id="Textbox5" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox6" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>4</td>
									<td>							
										<asp:textbox id="Textbox7" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox8" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>5</td>
									<td>							
										<asp:textbox id="Textbox9" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox10" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>6</td>
									<td>							
										<asp:textbox id="Textbox11" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox12" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>7</td>
									<td>							
										<asp:textbox id="Textbox13" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox14" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>8</td>
									<td>							
										<asp:textbox id="Textbox15" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox16" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								<tr>
									<td>9</td>
									<td>							
										<asp:textbox id="Textbox17" CssClass="form-control" runat="server"></asp:textbox>
									</td>
									<td>
										<asp:textbox id="Textbox18" CssClass="form-control" runat="server"></asp:textbox>
									</td>
								  </tr>
								
							</tbody>
						</table>

						</asp:Panel>
					</div>
				</div>
			</div>
		</div>

		<div class="row" align="center">

			<div class="col-md-4 col-md-offset-2">
				<asp:imagebutton id="btnPrint" runat="server" imageurl="~\ico\print.png"
					onclick="GenerarDocumento" ValidationGroup="ValidationAdd"/>
				<h4>Generar Documento</h4>
			</div>

		</div>

	</div>

</asp:Content>