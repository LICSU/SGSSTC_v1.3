<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_PuestoTrabajo" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:scriptmanager id="ScriptManager1" runat="server"/>

	<asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>

			<div class ="container" style="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="../GestionDatos/index_PuestoTrabajo.aspx">Puesto Trabajo</a></li>
                    <li><a href="#">Crear Puesto Trabajo</a></li>
                </ol>
                
                <div class="page-header">
                    <h1 class="text-center">Agregar Puesto de Trabajo</h1>
                </div>

				<div class="row">
					<asp:PlaceHolder runat="server" id="phEmpresa1">
                        <div class="col-md-4 col-md-offset-2">
							<h4 class="text-left">Empresa</h4>
							<asp:DropDownList runat="server" id="ddlEmpresa" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged"></asp:DropDownList>
							
							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
								ControlToValidate="ddlEmpresa" runat="server" ValidationGroup="ValidationAdd"/>
						</div>
					</asp:PlaceHolder>
					
					<asp:PlaceHolder runat="server" id="phSucursal1" Visible="false">
                        <div class="col-md-4 col-md-offset-2">
							<h4 class="text-left">Sucursal</h4>
							<asp:DropDownList runat="server" id="ddlSucursal" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                CssClass="form-control" AutoPostBack="true" 
								OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
							
							<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
								Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
								runat="server" ValidationGroup="ValidationAdd"/>
						</div>
					</asp:PlaceHolder>
				</div>

				<br />

				<div class="row">
					<div class="col-md-4 col-md-offset-2">
						<h4 class="text-left">Nombre del puesto de trabajo:</h4>
						<asp:TextBox id="txtNombre" runat="server" class="form-control"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del Puesto de Trabajo" ></asp:TextBox>
					</div>

					<div class="col-md-4">
						<h4 class="text-left">Area</h4>
						
						<asp:DropDownList runat="server" id="ddlArea" 
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" 
                            CssClass="form-control"></asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlArea" 
                            runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Descripción del Proceso:</h4>
						<asp:TextBox id="txtDescripcion" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese una breve descripción de lo que se realiza en este Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Recurso Humano: </h4>
						<asp:TextBox id="txtRecursoHumano" runat="server" class="form-control" TextMode="MultiLine" Rows="3" 
                            data-toggle="tooltip" data-placement="bottom" title="Especifique el personal humano que hace uso del Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Objeto de Trabajo:</h4>
						<asp:TextBox id="txtObjetoTrabajo" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique el objeto de trabajo relacionado al Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Insumos:</h4>
						<asp:TextBox id="txtInsumos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique los insumos que consume el Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Máquinas/Equipos:</h4>
						<asp:TextBox id="txtMaquinas" runat="server" class="form-control" TextMode="MultiLine" Rows="3"                            
                            data-toggle="tooltip" data-placement="bottom" title="Especifique la maquinaria y/o equipos que se utilizan en este Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Herramientas: </h4>
						<asp:TextBox id="txtHerramientas" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique las herramientas que se usan en el Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Emisiones: </h4>
						<asp:TextBox id="txtEmisiones" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique las emisiones producidas por el Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Desechos Sólidos/ Líquidos: </h4>
						<asp:TextBox id="txtDesechos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique los desechos generados solidos y liquidos por el Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Productos o servicios:</h4>
						<asp:TextBox id="txtProductos" runat="server" class="form-control" TextMode="MultiLine" Rows="3"
                            data-toggle="tooltip" data-placement="bottom" title="Especifique los Productos o servicios generados por el Puesto de Trabajo"></asp:TextBox>
					</div>
				</div>

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Equipos de Protección Personal</h4>
						<asp:ListBox id="ddlEpp" runat="server" SelectionMode="Multiple" ClientIDMode="Static" 
							CssClass="form-control" Rows="10"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione de la lista los Equipos de Protección Personal usados por el Puesto de Trabajo"></asp:ListBox>
					</div>
				</div>

				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h4 class="text-left">Soporte fotográfico</h4>
						<asp:FileUpload runat="server" id="fuAnexo" 
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese imagenes y/o fotos relacionadas al Puesto de Trabajo"/>
					</div>
				</div>

				<!-- aceptar y cancelar-->
                <br />
				<div class="row">
					<div class="col-md-2 col-md-offset-5">
						<asp:Button runat="server" id="btnAceptar" Text="Aceptar" OnClick="btnAceptar_Click" 
							class="btn btn-block btn-info" ValidationGroup="ValidationAdd"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para registrar Puesto de Trabajo"></asp:Button>
					</div>
				</div>

			</div>

		</ContentTemplate>
		<Triggers>
			<asp:PostBackTrigger Controlid="btnAceptar"/>
		</Triggers>
	</asp:updatepanel>

</asp:Content>

