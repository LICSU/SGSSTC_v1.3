<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.View_PuestoTrabajo" %>

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
                            <h4 class="text-left">Empresa</h4>
                            <asp:Label id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phSucursal1" Visible="false">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
							<h4 class="text-left">Sucursal</h4>
							<asp:Label id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" Text=""></asp:Label>
						</div>
                    </div>
                    <br />
                </asp:PlaceHolder>

				<div class="row">
					<div class="col-md-4 col-md-offset-2">
						<h4 class="text-left">Nombre del puesto de trabajo:</h4>
                        <asp:Label id="txtNombre" runat="server" Text=""></asp:Label> 
					</div>

					<div class="col-md-4">
						<h4 class="text-left">Area</h4>
                        <asp:Label id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área"
                             runat="server" Text=""></asp:Label>
					</div>
				</div>

				<br />

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Descripción del Proceso:</h4>
						<asp:Label id="txtDescripcion" runat="server" Text=""></asp:Label>
					</div>
				</div>

                <br />
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Recurso Humano: </h4>
						<asp:Label id="txtRecursoHumano" runat="server" Text=""></asp:Label>
					</div>
				</div>

                <br />
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Objeto de Trabajo:</h4>
						<asp:Label id="txtObjetoTrabajo" runat="server" Text=""></asp:Label>
					</div>
				</div>

                <br />
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Insumos:</h4>
						<asp:Label id="txtInsumos" runat="server" Text=""></asp:Label>
					</div>
				</div>

                <br />
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Máquinas/Equipos:</h4>
						<asp:Label id="txtMaquinas" runat="server" Text=""></asp:Label>
					</div>
				</div>

                <br />
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Herramientas: </h4>
						<asp:Label id="txtHerramientas" runat="server" Text=""></asp:Label>
					</div>
				</div>
				
                <br />

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Emisiones: </h4>
						<asp:Label id="txtEmisiones" runat="server" Text=""></asp:Label>
					</div>
				</div>
				
                <br />

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Desechos Sólidos/ Líquidos: </h4>
						<asp:Label id="txtDesechos" runat="server" Text=""></asp:Label>
					</div>
				</div>
				
                <br />

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Productos o servicios:</h4>
						<asp:Label id="txtProductos" runat="server" Text=""></asp:Label>
					</div>
				</div>

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Equipos de Protección Personal</h4>
                        <asp:Label id="txtEquipos" runat="server" Text=""></asp:Label>
					</div>
				</div>

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Soporte fotográfico</h4>
						<asp:Image alt="-" runat="server" id="ImgFoto" CssClass="img-thumbnail"/>
					</div>
				</div>

			</div>

		</ContentTemplate>
		<Triggers>
		</Triggers>
	</asp:updatepanel>
	
	<!-- Msj Modal -->
	<div class="modal fade" id="Msjmodal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
					<h4 class="modal-title">
						<label id="lblMsjTitle1"></label>
					</h4>
				</div>
				<div class="modal-body form-group">
					<div class="row">
						<div class="col-md-1">
							<span id="icoModal1" class="fa fa-times fa-2x text-danger"></span>
						</div>
						<div class="col-md-11">
							<label id="lblMsjModal1"></label>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- /modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
	

</asp:Content>