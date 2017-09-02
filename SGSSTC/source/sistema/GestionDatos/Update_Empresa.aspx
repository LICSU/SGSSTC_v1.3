<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Update_Empresa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>

				
				<ol class="breadcrumb">
					<li><a href="#">Gestión de Datos</a></li>
					<li><a href="../GestionDatos/index_Empresa.aspx">Empresa</a></li>
					<li><a href="#">Editar empresa</a></li>
				</ol>

				<div class="page-header">
					<h1 class="text-center">Editar Empresa</h1>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<asp:Image alt="-" runat="server" id="imgLogo" CssClass="thumbnail" 
							ImageUrl="~/source/archivos/LogosEmpresas/LICSU.jpg"/>
					</div>
				</div>
				<br />
				
				<div class="row text-left">
					<div class="col-md-3">
						<h4>Nombre de la Empresa</h4>
					</div>
					<div class="col-md-9">
						<asp:TextBox runat="server" id="txtNombreEmpresa" MaxLength="50" CssClass="form-control" 
							PlaceHolder="Nombre"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtNombreEmpresa" runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />
				
				<div class="row text-left">
					<div class="col-md-3">
						<h4>NIT</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" id="txtNit" MaxLength="50" CssClass="form-control" PlaceHolder="NIT">
						</asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNit" 
							runat="server" ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Código de la Empresa</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" MaxLength="50" id="txtCodigoEmpresa" CssClass="form-control" 
							PlaceHolder="Código"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtCodigoEmpresa" runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />

				<style>
					span.valerror[style*="inline"] 
					{
						display: block !Important;
						background-color: #f56954;
						border: 1px solid #f56954;
						font-size: 1em;
					}

				</style>
				<div class="row text-left">
					<div class="col-md-3">
						<h4>Email</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" id="txtEmail" MaxLength="100" TextMode="Email" CssClass="form-control" 
							PlaceHolder="mi_correo@grupoli.com"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtEmail" runat="server" ValidationGroup="ValidationAdd"/>
						
						<asp:RegularExpressionValidator id="regexEmailValid" runat="server" SetFocusOnError="True" 
							CssClass="valerror" Display="Dynamic" 
							ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" 
							ErrorMessage="Email inválido"></asp:RegularExpressionValidator>
					</div>

					<div class="col-md-3">
						<h4>Representante</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" id="txtRepresentante" MaxLength="100" CssClass="form-control" 
							PlaceHolder="Representante"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtRepresentante" runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />
				
				<div class="row text-left">
					<div class="col-md-3">
						<h4>Teléfono Fijo</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" id="txtTelFijo" MaxLength="50" CssClass="form-control" PlaceHolder="Fijo" 
							TextMode="Number"></asp:TextBox>

						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtTelFijo" runat="server" ValidationGroup="ValidationAdd"/>
					</div>

					<div class="col-md-3">
						<h4>Teléfono Movil</h4>
					</div>
					<div class="col-md-3">
						<asp:TextBox runat="server" id="txtTelMovil" MaxLength="50" CssClass="form-control" 
							PlaceHolder="Movil" TextMode="Number"></asp:TextBox>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="txtTelMovil" runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />
				
				<div class="row text-left">
					<div class="col-md-3">
						<h4>Logo</h4>
						<asp:HiddenField runat="server" id="hfLogo"/>
					</div>
					<div class="col-md-3">
						<asp:FileUpload runat="server" id="fuLogoEmpresa"/>
						
						<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
							Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
							ControlToValidate="fuLogoEmpresa" runat="server" ValidationGroup="ValidationAdd"/>
					</div>
				</div>
				<br />
				
				<div class="row" align="center">
					<div class="col-md-4 col-md-offset-4">
						<asp:ImageButton alt="-" id="btnActualizar" runat="server" ImageUrl="~\ico\editar.png" 
							OnClick="EditarRegistro" ValidationGroup="ValidationAdd"/>

						<h4>Actualizar</h4>
					</div>
				</div>

		
		</ContentTemplate> 
		<Triggers>
			<asp:PostBackTrigger Controlid="btnActualizar"/>
		</Triggers>
	</asp:updatepanel>

	</asp:Content>