<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionCrono.aspx.cs"   Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionCrono" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="//www.google.com/jsapi"></script>

	<div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="../EvaluacionInicial/index_Inspecciones.aspx">Inspecciones</a></li>
            <li><a href="#">Crear Cronograma de Inspecciones</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Cronograma de Inspecciones</h1>
        </div>

		<asp:hiddenfield runat="server" id="cantInspecciones" value="0"></asp:hiddenfield>

		<div class="row form-group">

			<asp:placeholder runat="server" id="phEmpresa">
				<div class="col-md-4">
					<h4 class="text-center">Empresa</h4>
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>

				</div>
			</asp:placeholder>

			<asp:placeholder runat="server" id="phSucursal">
				<div class="col-md-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
				</div>
			</asp:placeholder>
		</div>

		<asp:placeholder runat="server" id="phInformacion" Visible="false">
			 <div class="row">
				  <div class="col-md-12">
                      <table class="table table-condensed">
							  <tbody>
								  <tr class="bg-aqua color-palette">
									  <th class="col-md-2 text-center">Area</th>
									  <th class="col-md-2 text-center">Tipo de Inspección</th>
									  <th class="col-md-2 text-center">Fecha Inspección</th>
									  <th class="col-md-2 text-center">Responsables</th>
									  <th class="col-md-4 text-center">Objetivo</th>
								  </tr>
								  <asp:panel id="pTabla" runat="server">
								  <tr>
									<td>
										<asp:dropdownlist id="ddlArea0" CssClass="form-control" runat="server"></asp:dropdownlist>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
											setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="ddlArea0" runat="server" 
											ValidationGroup="ValidationAdd"/>
									</td>
									<td>
										  <asp:dropdownlist id="ddlTipo0" CssClass="form-control" runat="server">
											 <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
											 <asp:ListItem Text="Extintores" Value="Extintores"></asp:ListItem>
											 <asp:ListItem Text="Areas" Value="Areas"></asp:ListItem>
											 <asp:ListItem Text="Medios de Escape" Value="MediosEscape"></asp:ListItem>
											 <asp:ListItem Text="Puesto de Trabajo Operativo" Value="PuestoOperativo"></asp:ListItem>
											 <asp:ListItem Text="Puesto de Trabajo Administrativo" Value="PuestoAdministrativo"></asp:ListItem>
											 <asp:ListItem Text="Inspección de Equipos de Protección" Value="InspeccionEpp"></asp:ListItem>
											 <asp:ListItem Text="Cronograma de Inspecciones" Value="CronogramaInspecciones"></asp:ListItem>
											 <asp:ListItem Text="Inspección uso de EPP" Value="UsoEpp"></asp:ListItem>
											 <asp:ListItem Text="Inspección Botiquín de Primeros Auxilios" Value="PrimAux"></asp:ListItem>
										  </asp:DropDownList>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
											setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="ddlTipo0" runat="server" 
											ValidationGroup="ValidationAdd"/>
									</td>
									<td>
										<asp:textbox id="txtFecha0" type="date" CssClass="form-control" runat="server"></asp:textbox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
											setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtFecha0" runat="server" 
											ValidationGroup="ValidationAdd"/>
									</td>
									<td>
										<asp:textbox id="txtResp0" CssClass="form-control" runat="server"></asp:textbox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
											setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtResp0" runat="server" 
											ValidationGroup="ValidationAdd"/>
									</td>
									<td>
										<asp:textbox id="txtObj0" CssClass="form-control" runat="server" TextMode="MultiLine"
											  Rows="3"></asp:textbox>
										<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
											setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
											Font-Bold="true" ControlToValidate="txtObj0" runat="server" 
											ValidationGroup="ValidationAdd"/>
									</td>
								  </tr>
								  </asp:panel>
							  </tbody>
						  </table>
				  </div>
			 </div>
			 <div class="row">
				 <div class="col-md-9"></div>
				 <div class="col-md-3 text-right">
					 <asp:Button runat="server" id="btnAgregar" Text="Agregar Inspección" ValidationGroup="ValidationAdd"
						 CssClass="btn btn-block btn-info" OnClick="Guardar"/>
				 </div>
			 </div><br />

			 <div class="row" align="center">				 
				 <div class="col-md-3 col-md-offset-2">
					 <asp:Button runat="server" id="btnDocumento" Text="Generar Documento" 
						 CssClass="btn btn-block btn-info" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd"/>

				 </div>
			 </div>

		</asp:placeholder>

		<asp:placeholder runat="server" id="phNoRegistros" visible="false">
			<div class="row form-group">
				<div class="col-md-8 col-md-offset-2" text-center">
					<strong><h4 class="text-left">No existen registros para ese puesto de trabajo.</h4></strong>
				</div>
			</div>
		</asp:placeholder>

	</div>

</asp:Content>