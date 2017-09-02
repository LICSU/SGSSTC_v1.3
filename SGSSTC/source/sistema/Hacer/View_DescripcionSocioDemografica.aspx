<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_DescripcionSocioDemografica" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_DescripcionSocioDemografica.aspx">Descripción SocioDemografica</a></li>
			<li><a href="#">Consultar Descripción SocioDemografica</a></li>
		</ol>

		<div class="page-header">
			<h1 class="text-center">Consultar Descripción SocioDemografica</h1>
		</div>

		<div class="row">

			<div class="col-md-12">
				<div class="col-md-6">
					<h4>Trabajador</h4>
					<asp:label runat="server" id="ddlTrabajador" cssclass="control-label"></asp:label>
					<hr />
				</div>
				<div class="col-md-6">
					<h4>Lugar de Nacimiento</h4>
					<asp:label runat="server" id="txtLugar" cssclass="form-label" placeholder="Lugar de Nacimiento"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6">
					<h4>Nivel de escolaridad</h4>
					<asp:label runat="server" placeholder="Nivel Escolar" id="txtNivel" cssclass="form-label"></asp:label>
					<hr />
				</div>
				<asp:placeholder runat="server" id="phAñosApr" visible="false">
						<div class="col-md-6 text-left">
							<h4>Años aprobados en ese último nivel</h4>
							<asp:Label  runat="server" id="txtAnhosApro" CssClass="form-label" placeholder="Años Aprobados"></asp:Label>
							<hr />
						</div>
					</asp:placeholder>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>¡Es cabeza de familia!</h4>
					<asp:label runat="server" id="lblCabeza" cssclass="control-label"></asp:label>
					<hr />
				</div>
				<div class="col-md-6 text-left">
					<h4>Cantidad de hijos</h4>
					<asp:label runat="server" id="lblHijos" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>¿Reparte la responsabilidad económica de su familia?</h4>
					<asp:label runat="server" id="lblResponsabilidad" cssclass="control-label"></asp:label>
					<hr />
				</div>

				<div class="col-md-6 text-left">
					<h4>¿Cuantos menores dependen económicamente de ud?</h4>
					<asp:label runat="server" id="lblMenores" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>¿Socialmente en que condición se encuentra usted?</h4>
					<asp:label runat="server" id="lblCondicion" cssclass="control-label"></asp:label>
					<hr />
				</div>

				<asp:placeholder runat="server" id="phMotivoD" visible="false">
					<div class="col-md-6 text-left">
						<h4>En caso de ser desplazado, ¿Cual fue el motivo del desplazamiento?</h4>
						 <asp:Label runat="server" id="lblMotivo" CssClass="control-label"></asp:Label><hr />
					</div>
				</asp:placeholder>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>La vivienda donde habita es:</h4>
					<asp:label runat="server" id="lblVivienda" cssclass="control-label"></asp:label>
					<hr />
				</div>

				<div class="col-md-6 text-left">
					<h4>Servicios públicos cuenta su vivienda</h4>
					<asp:label runat="server" id="lblServicios" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Su vivienda es:</h4>
					<asp:label runat="server" id="lblVivienda2" cssclass="control-label"></asp:label>
					<hr />
				</div>
				<div class="col-md-6 text-left">
					<h4>Esta Cerca de Industrias</h4>
					<asp:label runat="server" id="lblIndustrias" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Hay mucho ruido:</h4>
					<asp:label runat="server" id="lblRuido" cssclass="control-label"></asp:label>
					<hr />
				</div>

				<div class="col-md-6 text-left">
					<h4>Hay Mucha Contaminación</h4>
					<asp:label runat="server" id="lblContaminacion" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Describa el techo, paredes y piso:</h4>
					<asp:label runat="server" id="lblDescripcion" cssclass="control-label"></asp:label>
					<hr />
				</div>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Se encuentra afiliado al sistema de seguridad social en salud</h4>
					<asp:label runat="server" id="lblSistema" cssclass="control-label"></asp:label>
					<hr />
				</div>

				<asp:placeholder runat="server" id="phRegimen" visible="false">
					<div class="col-md-6 text-left">
						<h4>Régimen de Afiliación</h4>
						<asp:Label runat="server" id="lblRegimen" CssClass="control-label"></asp:Label><hr />
					</div>
				</asp:placeholder>
			</div>

			<div class="col-md-12">
				<asp:placeholder runat="server" id="phNivel" visible="false">
					<div class="col-md-6 text-left">
						 <h4>Nivel de SISBEN
						 </h4>
						<asp:Label runat="server" id="lblNivel" CssClass="control-label"></asp:Label><hr />
					</div>
				</asp:placeholder>

				<asp:placeholder runat="server" id="phEps" visible="false">
					<div class="col-md-6 text-left">
						 <h4>EPS</h4>
						<asp:Label runat="server" id="txtEps" CssClass="control-label" placeholder="EPS"></asp:Label><hr />
					</div>
				</asp:placeholder>
			</div>

			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Se encuentra afiliado al sistema de seguridad social en pensiones</h4>
					<asp:label runat="server" id="lblPensiones" cssclass="control-label" placeholder="EPS"></asp:label>
					<hr />
				</div>

				<asp:placeholder runat="server" id="phFondo" visible="false">
					<div class="col-md-6 text-left">
						<h4>Fondo</h4>
						<asp:Label runat="server" id="txtFondo" CssClass="control-label" placeholder="Fondo"></asp:Label><hr />
					</div>
				</asp:placeholder>
			</div>


			<div class="col-md-12">
				<div class="col-md-6 text-left">
					<h4>Estrato que registran sus facturas de los servicios públicos de la vivienda donde reside</h4>
					<asp:label runat="server" id="lblEstrato" cssclass="control-label" placeholder="EPS"></asp:label>
					<hr />
				</div>
			</div>

			<asp:placeholder runat="server" id="phEmpleos" visible="false">
				<div class="col-md-12 text-left">
					 <h4>18) Empleos Anteriores</h4>
				</div>
				<div class="col-md-12">
						<asp:Table runat="server" id="tblEmpleos" CssClass="table">
							<asp:TableRow runat="server" id="row1">
								<asp:TableCell Text="Empresa"></asp:TableCell>
								<asp:TableCell Text="Área"></asp:TableCell>
								<asp:TableCell Text="Cargo u Oficio"></asp:TableCell>
								<asp:TableCell Text="Años"></asp:TableCell>
								<asp:TableCell Text="Meses"></asp:TableCell>
								<asp:TableCell Text="Enfermedades adquiridas en el cargo Ninguna/Nombre Enfermedad"></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow runat="server" id="TableRow1" Visible="false">
								<asp:TableCell><asp:TextBox runat="server" id="txtEmpresa1" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtArea1" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtCargo1" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtAños1" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtMeses1" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades1" CssClass="form-control"></asp:TextBox></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow runat="server" id="TableRow2" Visible="false">
								<asp:TableCell><asp:TextBox runat="server" id="txtEmpresa2" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtArea2" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtCargo2" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtAños2" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtMeses2" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades2" CssClass="form-control"></asp:TextBox></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow runat="server" id="TableRow3" Visible="false">
								<asp:TableCell><asp:TextBox runat="server" id="txtEmpresa3" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtArea3" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtCargo3" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtAños3" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtMeses3" CssClass="form-control"></asp:TextBox></asp:TableCell>
								<asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades3" CssClass="form-control"></asp:TextBox></asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</div>
			</asp:placeholder>

			<!-- Msj Modal -->
			<ucm:ucMsjModal runat="server" id="ucMsjModal"/>
	
		</div>


</asp:Content>