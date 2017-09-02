<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.View_PuestoTrabajo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" 
	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>
			
			<ol class="breadcrumb">
				<li><a href="#">Gestión de Datos</a></li>
				<li><a href="../GestionDatos/index_PuestoTrabajo.aspx">Puesto de Trabajo</a></li>
				<li><a href="#">Ver Puesto de Trabajo</a></li>
			</ol>
			
			<div class="page-header">
				<h1 class="text-center">Ver Puesto de Trabajo</h1>
			</div>
			
			<asp:PlaceHolder runat="server" id="phEmpresa1">
				<div class="row">
						<div class="col-md-4">
							<h4>Empresa</h4>
							<asp:Label id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
								runat="server" Text=""></asp:Label>
						</div>
					</div>
			</asp:PlaceHolder>
			
			<asp:PlaceHolder runat="server" id="phSucursal1" Visible="false">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4>Sucursal</h4>
						<asp:Label id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
							runat="server" Text=""></asp:Label>
					</div>
				</div>
				<br />
			</asp:PlaceHolder>

			<div class="row">
				<div class="col-md-4 col-md-offset-2">
					<h4>Nombre del puesto de trabajo:</h4>
					<asp:Label id="txtNombre" runat="server" Text=""></asp:Label> 
				</div>

				<div class="col-md-4">
					<h4>Area</h4>
					<asp:Label id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área"
						 runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Descripción del Proceso:</h4>
					<asp:Label id="txtDescripcion" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />
			
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Recurso Humano: </h4>
					<asp:Label id="txtRecursoHumano" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />
			
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Objeto de Trabajo:</h4>
					<asp:Label id="txtObjetoTrabajo" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />
			
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Insumos:</h4>
					<asp:Label id="txtInsumos" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />
			
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Máquinas/Equipos:</h4>
					<asp:Label id="txtMaquinas" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<br />
			
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Herramientas: </h4>
					<asp:Label id="txtHerramientas" runat="server" Text=""></asp:Label>
				</div>
			</div>
			
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Emisiones: </h4>
					<asp:Label id="txtEmisiones" runat="server" Text=""></asp:Label>
				</div>
			</div>
			
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Desechos Sólidos/ Líquidos: </h4>
					<asp:Label id="txtDesechos" runat="server" Text=""></asp:Label>
				</div>
			</div>
			
			<br />

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Productos o servicios:</h4>
					<asp:Label id="txtProductos" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Equipos de Protección Personal</h4>
					<asp:Label id="txtEquipos" runat="server" Text=""></asp:Label>
				</div>
			</div>

			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h4>Soporte fotográfico</h4>
					<asp:Image alt="-" runat="server" id="ImgFoto" CssClass="img-thumbnail"/>
				</div>
			</div>


		</ContentTemplate>
		<Triggers>
		</Triggers>
	</asp:updatepanel>
	
</asp:Content>