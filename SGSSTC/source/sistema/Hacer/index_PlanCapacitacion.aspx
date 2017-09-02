<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PlanCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PlanCapacitacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="//www.google.com/jsapi"></script>

		
		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="#">Plan de Capacitación</a></li>
		</ol>
		
		<div class="page-header">
			<h1 class="text-center">Plan de Capacitación</h1>
		</div>

		<asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
				<ContentTemplate> 
						<div class="row form-group">
							<asp:PlaceHolder runat="server" id="phEmpresa">
								<div class="col-md-3">
									<h4 class="text-center">Empresa</h4>
									<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
								</div>
							</asp:PlaceHolder>
							<asp:PlaceHolder runat="server" id="phSucursal">
								<div class="col-md-3">
									<h4 class="text-center">Sucursal</h4>
									<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
								</div>
							</asp:PlaceHolder> 
						</div>
						
					 <asp:PlaceHolder runat="server" id="phInformacion" Visible="False">
						 <div class="row table-responsive">
							 <div class="col-md-12">
								 <asp:Panel runat="server" id="pnDatos">
									 <div class="panel-group" id="accordion">
										<div class="panel panel-default">
										  <div class="panel-heading bg-aqua color-palette bg-aqua color-palette">
											<h4 class="panel-title">
											  <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">TIPO DE RIESGO: Mecánicos</a>
											</h4>
										  </div>
										  <div id="collapse1" class="panel-collapse collapse">
												<div class="panel-body">
													<!-- Mecanicos -->
													<asp:Table runat="server" id="tb_datos" CssClass="table">
														 <asp:TableHeaderRow>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
															 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
														 </asp:TableHeaderRow>
														 <asp:TableHeaderRow>
															 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
															 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
														 </asp:TableHeaderRow>
														 <asp:TableRow>
															 <asp:TableCell>1</asp:TableCell>
															 <asp:TableCell runat="server" id="preg1" Text="Riesgos Mecánicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP1"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP1"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP1"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP1"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP1" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP1" GroupName="p1"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP1" GroupName="p1"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP1"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP1"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>2</asp:TableCell>
															 <asp:TableCell runat="server" id="preg2" Text="Almacenamiento adecuado (Pasillos Libres)"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP2"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP2"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP2"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP2"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP2" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP2" GroupName="p2"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP2" GroupName="p2"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP2"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP2"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>3</asp:TableCell>
															 <asp:TableCell runat="server" id="preg3" Text="Guardas protectoras"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP3"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP3"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP3"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP3"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP3" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP3" GroupName="p3"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP3" GroupName="p3"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP3"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP3"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>4</asp:TableCell>
															 <asp:TableCell runat="server" id="preg4" Text="Organización y Técnicas de Manejo de Almacenes"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP4"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP4"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP4"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP4"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP4" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP4" GroupName="p4"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP4" GroupName="p4"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP4"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP4"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>5</asp:TableCell>
															 <asp:TableCell runat="server" id="preg5" Text="Prevención en el Uso de Escaleras Fijas y Portátiles"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP5"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP5"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP5"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP5"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP5" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP5" GroupName="p5"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP5" GroupName="p5"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP5"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP5"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>6</asp:TableCell>
															 <asp:TableCell runat="server" id="preg6" Text="Primera norma de prevención 'Trabaje Correctamente'"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP6"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP6"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP6"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP6"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP6" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP6" GroupName="p6"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP6" GroupName="p6"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP6"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP6"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>7</asp:TableCell>
															 <asp:TableCell runat="server" id="preg7" Text="Manejo adecuado de Herramientas 'Trabaje Correctamente'"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP7"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP7"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP7"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP7"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP7" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP7" GroupName="p7"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP7" GroupName="p7"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP7"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP7"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>8</asp:TableCell>
															 <asp:TableCell runat="server" id="preg8" Text="Riesgos Mecánicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP8"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP8"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP8"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP8"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP8" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP8" GroupName="p8"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP8" GroupName="p8"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP8"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP8"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>9</asp:TableCell>
															 <asp:TableCell runat="server" id="preg9" Text="Riesgos presentados en las Oficinas"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP9"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP9"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP9"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP9"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP9" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP9" GroupName="p9"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP9" GroupName="p9"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP9"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP9"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>10</asp:TableCell>
															 <asp:TableCell runat="server" id="preg10" Text="Seguridad y Protección Personal en el Ámbito Laboral"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP10"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP10"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP10"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP10"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP10" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP10" GroupName="p10"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP10" GroupName="p10"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP10"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP10"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>11</asp:TableCell>
															 <asp:TableCell runat="server" id="preg11" Text="Trabajo en Alturas"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP11"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP11"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP11"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP11"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP11" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP11" GroupName="p11"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP11" GroupName="p11"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP11"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP11"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>12</asp:TableCell>
															 <asp:TableCell runat="server" id="preg12" Text="Seguridad en el Manejo del Montacargas"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP12"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP12"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP12"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP12"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP12" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP12" GroupName="p12"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP12" GroupName="p12"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP12"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP12"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>13</asp:TableCell>
															 <asp:TableCell runat="server" id="preg13" Text="Diseño de un Plan de Orden y Limpieza en la Empresa según la  Implementación de la metodología de las 5S"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP13"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP13"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP13"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP13"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP13" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP13" GroupName="p13"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP13" GroupName="p13"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP13"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP13"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														</asp:Table>
												</div>
										  </div>
										</div>
										<div class="panel panel-default">
										  <div class="panel-heading bg-aqua color-palette">
											<h4 class="panel-title">
											  <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">TIPO DE RIESGO: Físicos</a>
											</h4>
										  </div>
										  <div id="collapse2" class="panel-collapse collapse">
												<div class="panel-body">
													<!-- Fisicos -->
													<asp:Table runat="server" id="Table2" CssClass="table">
														 <asp:TableHeaderRow>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
															 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
															 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
														 </asp:TableHeaderRow>
														 <asp:TableHeaderRow>
															 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
															 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
														 </asp:TableHeaderRow>
														<asp:TableRow>
															 <asp:TableCell>14</asp:TableCell>
															 <asp:TableCell runat="server" id="preg14" Text="El Ruido y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP14"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP14"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP14"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP14"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP14" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP14" GroupName="p14"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP14" GroupName="p14"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP14"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP14"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														<asp:TableRow>
															 <asp:TableCell>15</asp:TableCell>
															 <asp:TableCell runat="server" id="preg15" Text="Radiaciones Ionizantes"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP15"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP15"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP15"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP15"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP15" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP15" GroupName="p15"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP15" GroupName="p15"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP15"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP15"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>16</asp:TableCell>
															 <asp:TableCell runat="server" id="preg16" Text="Radiaciones No Ionizantes"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP16"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP16"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP16"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP16"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP16" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP16" GroupName="p16"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP16" GroupName="p16"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP16"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP16"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>17</asp:TableCell>
															 <asp:TableCell runat="server" id="preg17" Text="Temperaturas Extremas"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP17"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP17"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP17"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP17"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP17" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP17" GroupName="p17"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP17" GroupName="p17"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP17"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP17"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
														 <asp:TableRow>
															 <asp:TableCell>18</asp:TableCell>
															 <asp:TableCell runat="server" id="preg18" Text="Vibraciones"></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP18"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP18"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP18"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP18"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP18" TextMode="Date"></asp:TextBox></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP18" GroupName="p18"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP18" GroupName="p18"></asp:RadioButton></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP18"></asp:TextBox></asp:TableCell>
															 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP18"></asp:TextBox></asp:TableCell>
														 </asp:TableRow>
													</asp:Table>
												</div>
										  </div>
										</div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">TIPO DE RIESGO: Disergonómicos</a>
												</h4>
											  </div>
											  <div id="collapse3" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Disergonómicos -->
														<asp:Table runat="server" id="Table1" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>19</asp:TableCell>
																 <asp:TableCell runat="server" id="preg19" Text="Manejo  manual de cargas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP19"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP19"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP19"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP19"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP19" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP19" GroupName="p19"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP19" GroupName="p19"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP19"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP19"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>20</asp:TableCell>
																 <asp:TableCell runat="server" id="preg20" Text="Condiciones Disergonómicas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP20"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP20"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP20"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP20"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP20" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP20" GroupName="p20"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP20" GroupName="p20"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP20"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP20"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>21</asp:TableCell>
																 <asp:TableCell runat="server" id="preg21" Text="Ergonomía en la Oficina"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP21"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP21"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP21"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP21"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP21" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP21" GroupName="p21"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP21" GroupName="p21"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP21"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP21"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>22</asp:TableCell>
																 <asp:TableCell runat="server" id="preg22" Text="Higiene Postural"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP22"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP22"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP22"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP22"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP22" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP22" GroupName="p22"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP22" GroupName="p22"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP22"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP22"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>23</asp:TableCell>
																 <asp:TableCell runat="server" id="preg23" Text="Ergonomía de Levantar y Bajar Cargas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP23"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP23"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP23"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP23"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP23" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP23" GroupName="p23"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP23" GroupName="p23"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP23"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP23"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>24</asp:TableCell>
																 <asp:TableCell runat="server" id="preg24" Text="Biomecánica aplicada a la Ergonomía"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP24"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP24"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP24"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP24"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP24" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP24" GroupName="p24"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP24" GroupName="p24"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP24"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP24"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>25</asp:TableCell>
																 <asp:TableCell runat="server" id="preg25" Text="Biomecánica aplicada a la Ergonomía "></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP25"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP25"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP25"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP25"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP25" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP25" GroupName="p25"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP25" GroupName="p25"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP25"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP25"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>26</asp:TableCell>
																 <asp:TableCell runat="server" id="preg26" Text="Evaluación Metabólica de la Actividad Física"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP26"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP26"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP26"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP26"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP26" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP26" GroupName="p26"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP26" GroupName="p26"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP26"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP26"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>27</asp:TableCell>
																 <asp:TableCell runat="server" id="preg27" Text="Gimnasia Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP27"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP27"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP27"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP27"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP27" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP27" GroupName="p27"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP27" GroupName="p27"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP27"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP27"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>28</asp:TableCell>
																 <asp:TableCell runat="server" id="preg28" Text="Lumbagos y el Cuidado de la Columna"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP28"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP28"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP28"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP28"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP28" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP28" GroupName="p28"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP28" GroupName="p28"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP28"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP28"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>29</asp:TableCell>
																 <asp:TableCell runat="server" id="preg29" Text="Síndrome del Túnel Carpiano"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP29"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP29"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP29"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP29"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP29" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP29" GroupName="p29"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP29" GroupName="p29"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP29"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP29"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>30</asp:TableCell>
																 <asp:TableCell runat="server" id="preg30" Text="Problemas Ergonómicos asociados al Diseño de Mobiliario"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP30"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP30"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP30"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP30"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP30" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP30" GroupName="p30"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP30" GroupName="p30"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP30"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP30"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>31</asp:TableCell>
																 <asp:TableCell runat="server" id="preg31" Text="Trastornos Musculo Esqueléticos de origen laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP31"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP31"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP31"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP31"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP31" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP31" GroupName="p31"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP31" GroupName="p31"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP31"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP31"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>32</asp:TableCell>
																 <asp:TableCell runat="server" id="preg32" Text="Pausas Activas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP32"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP32"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP32"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP32"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP32" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP32" GroupName="p32"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP32" GroupName="p32"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP32"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP32"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										  </div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">TIPO DE RIESGO: Químicos</a>
												</h4>
											  </div>
											  <div id="collapse4" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Químicos -->
														<asp:Table runat="server" id="Table3" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>33</asp:TableCell>
																 <asp:TableCell runat="server" id="preg33" Text="Riesgos Químicos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP33"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP33"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP33"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP33"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP33" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP33" GroupName="p33"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP33" GroupName="p33"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP33"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP33"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>34</asp:TableCell>
																 <asp:TableCell runat="server" id="preg34" Text="Prevención en el Uso de la Gasolina"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP34"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP34"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP34"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP34"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP34" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP34" GroupName="p34"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP34" GroupName="p34"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP34"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP34"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>35</asp:TableCell>
																 <asp:TableCell runat="server" id="preg35" Text="Prevención en el Uso de la Soda Caustica"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP35"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP35"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP35"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP35"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP35" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP35" GroupName="p35"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP35" GroupName="p35"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP35"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP35"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>36</asp:TableCell>
																 <asp:TableCell runat="server" id="preg36" Text="Efectos De Productos Químicos En La Salud"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP36"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP36"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP36"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP36"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP36" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP36" GroupName="p36"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP36" GroupName="p36"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP36"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP36"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>37</asp:TableCell>
																 <asp:TableCell runat="server" id="preg37" Text="Factores de Riesgo Químico"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP37"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP37"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP37"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP37"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP37" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP37" GroupName="p37"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP37" GroupName="p37"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP37"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP37"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>38</asp:TableCell>
																 <asp:TableCell runat="server" id="preg38" Text="Prácticas para el Almacenamiento de Productos Químicos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP38"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP38"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP38"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP38"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP38" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP38" GroupName="p38"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP38" GroupName="p38"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP38"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP38"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>39</asp:TableCell>
																 <asp:TableCell runat="server" id="preg39" Text="¿La Seguridad en el transporte de Sustancias Peligrosas?"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP39"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP39"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP39"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP39"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP39" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP39" GroupName="p39"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP39" GroupName="p39"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP39"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP39"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>40</asp:TableCell>
																 <asp:TableCell runat="server" id="preg40" Text="¿Que Hacer en caso de un derrame?"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP40"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP40"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP40"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP40"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP40" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP40" GroupName="p40"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP40" GroupName="p40"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP40"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP40"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>41</asp:TableCell>
																 <asp:TableCell runat="server" id="preg41" Text="Instrucciones para el uso, almacenado y conservación de Respiración semi-facial"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP41"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP41"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP41"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP41"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP41" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP41" GroupName="p41"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP41" GroupName="p41"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP41"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP41"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>42</asp:TableCell>
																 <asp:TableCell runat="server" id="preg42" Text="Incendios en Líquidos y Gases y sus Riesgos Asociados"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP42"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP42"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP42"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP42"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP42" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP42" GroupName="p42"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP42" GroupName="p42"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP42"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP42"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>43</asp:TableCell>
																 <asp:TableCell runat="server" id="preg43" Text="Almacenamiento de Inflamables y Combustibles"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP43"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP43"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP43"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP43"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP43" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP43" GroupName="p43"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP43" GroupName="p43"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP43"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP43"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										 </div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">TIPO DE RIESGO: Eléctricos</a>
												</h4>
											  </div>
											  <div id="collapse5" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Eléctricos -->
														<asp:Table runat="server" id="Table4" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>44</asp:TableCell>
																 <asp:TableCell runat="server" id="preg44" Text="Riesgos Eléctricos y Procedimientos de Acción Frente a los Mismos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP44"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP44"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP44"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP44"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP44" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP44" GroupName="p44"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP44" GroupName="p44"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP44"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP44"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>45</asp:TableCell>
																 <asp:TableCell runat="server" id="preg45" Text="Peligros de Choque en Circuitos de Baja Tensión"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP45"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP45"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP45"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP45"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP45" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP45" GroupName="p45"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP45" GroupName="p45"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP45"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP45"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>46</asp:TableCell>
																 <asp:TableCell runat="server" id="preg46" Text="Trabajo con Herramientas Eléctricas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP46"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP46"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP46"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP46"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP46" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP46" GroupName="p46"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP46" GroupName="p46"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP46"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP46"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>47</asp:TableCell>
																 <asp:TableCell runat="server" id="preg47" Text="Sistemas a Tierra"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP47"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP47"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP47"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP47"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP47" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP47" GroupName="p47"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP47" GroupName="p47"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP47"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP47"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										  </div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">TIPO DE RIESGO: Psicosocial Desarrollo Conductual</a>
												</h4>
											  </div>
											  <div id="collapse6" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Psicosocial Desarrollo Conductual -->
														<asp:Table runat="server" id="Table5" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>48</asp:TableCell>
																 <asp:TableCell runat="server" id="preg48" Text="Calidad de Vida en el Trabajo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP48"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP48"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP48"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP48"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP48" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP48" GroupName="p48"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP48" GroupName="p48"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP48"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP48"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>49</asp:TableCell>
																 <asp:TableCell runat="server" id="preg49" Text="Gerencia Proactiva"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP49"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP49"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP49"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP49"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP49" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP49" GroupName="p49"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP49" GroupName="p49"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP49"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP49"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>50</asp:TableCell>
																 <asp:TableCell runat="server" id="preg50" Text="La Desigualdad y Discriminación en el Contexto Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP50"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP50"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP50"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP50"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP50" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP50" GroupName="p50"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP50" GroupName="p50"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP50"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP50"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>51</asp:TableCell>
																 <asp:TableCell runat="server" id="preg51" Text="La Fisiología y Psicología aplicada a la Ergonomía"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP51"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP51"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP51"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP51"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP51" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP51" GroupName="p51"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP51" GroupName="p51"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP51"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP51"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>52</asp:TableCell>
																 <asp:TableCell runat="server" id="preg52" Text="Actitud Mental Positiva 'Más Importante es Nuestra Actitud que lo que nos Pasa'"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP52"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP52"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP52"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP52"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP52" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP52" GroupName="p52"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP52" GroupName="p52"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP52"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP52"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>53</asp:TableCell>
																 <asp:TableCell runat="server" id="preg53" Text="Alcoholismo y daños Generados a la Salud"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP53"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP53"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP53"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP53"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP53" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP53" GroupName="p53"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP53" GroupName="p53"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP53"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP53"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>54</asp:TableCell>
																 <asp:TableCell runat="server" id="preg54" Text="Drogas y daños Generados a la Salud"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP54"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP54"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP54"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP54"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP54" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP54" GroupName="p54"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP54" GroupName="p54"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP54"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP54"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>55</asp:TableCell>
																 <asp:TableCell runat="server" id="preg55" Text="Estrés Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP55"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP55"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP55"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP55"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP55" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP55" GroupName="p55"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP55" GroupName="p55"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP55"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP55"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>56</asp:TableCell>
																 <asp:TableCell runat="server" id="preg56" Text="Obesidad y sus Consecuencias para la Salud"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP56"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP56"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP56"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP56"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP56" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP56" GroupName="p56"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP56" GroupName="p56"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP56"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP56"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>57</asp:TableCell>
																 <asp:TableCell runat="server" id="preg57" Text="Actitudes Positivas en el Entorno Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP57"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP57"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP57"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP57"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP57" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP57" GroupName="p57"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP57" GroupName="p57"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP57"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP57"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>58</asp:TableCell>
																 <asp:TableCell runat="server" id="preg58" Text="Administración  de Vida para el Rendimiento y Control Efectivo del Tiempo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP58"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP58"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP58"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP58"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP58" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP58" GroupName="p58"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP58" GroupName="p58"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP58"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP58"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>59</asp:TableCell>
																 <asp:TableCell runat="server" id="preg59" Text="Asertividad en el Contexto Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP59"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP59"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP59"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP59"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP59" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP59" GroupName="p59"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP59" GroupName="p59"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP59"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP59"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>60</asp:TableCell>
																 <asp:TableCell runat="server" id="preg60" Text="Autoestima y Motivación al Logro"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP60"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP60"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP60"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP60"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP60" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP60" GroupName="p60"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP60" GroupName="p60"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP60"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP60"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>61</asp:TableCell>
																 <asp:TableCell runat="server" id="preg61" Text="Como Ser un Triunfador a través de la Programación Neurolingüística (PNL)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP61"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP61"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP61"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP61"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP61" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP61" GroupName="p61"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP61" GroupName="p61"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP61"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP61"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>62</asp:TableCell>
																 <asp:TableCell runat="server" id="preg62" Text="Conciencia y Compromiso Organizacional"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP62"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP62"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP62"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP62"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP62" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP62" GroupName="p62"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP62" GroupName="p62"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP62"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP62"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>63</asp:TableCell>
																 <asp:TableCell runat="server" id="preg63" Text="Conductas Toxicas que Afectan la Vida Personal y Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP63"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP63"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP63"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP63"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP63" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP63" GroupName="p63"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP63" GroupName="p63"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP63"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP63"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>64</asp:TableCell>
																 <asp:TableCell runat="server" id="preg64" Text="Controlando las Emociones en vez de que ellas te Controlen"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP64"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP64"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP64"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP64"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP64" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP64" GroupName="p64"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP64" GroupName="p64"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP64"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP64"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>65</asp:TableCell>
																 <asp:TableCell runat="server" id="preg65" Text="Desarrollo del Potencial Humano"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP65"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP65"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP65"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP65"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP65" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP65" GroupName="p65"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP65" GroupName="p65"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP65"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP65"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>66</asp:TableCell>
																 <asp:TableCell runat="server" id="preg66" Text="Psicología Aplicada a la Supervisión, Manejo del Stress, Control de Situaciones"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP66"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP66"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP66"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP66"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP66" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP66" GroupName="p66"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP66" GroupName="p66"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP66"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP66"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>67</asp:TableCell>
																 <asp:TableCell runat="server" id="preg67" Text="Sentir Pensar y Actuar."></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP67"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP67"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP67"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP67"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP67" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP67" GroupName="p67"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP67" GroupName="p67"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP67"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP67"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>68</asp:TableCell>
																 <asp:TableCell runat="server" id="preg68" Text="Desarrollo Personal y Crecimiento Empresarial"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP68"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP68"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP68"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP68"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP68" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP68" GroupName="p68"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP68" GroupName="p68"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP68"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP68"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>69</asp:TableCell>
																 <asp:TableCell runat="server" id="preg69" Text="'El Modelo de Fluir', la Respuesta a Como Motivar a otros y a Auto motivarse"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP69"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP69"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP69"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP69"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP69" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP69" GroupName="p69"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP69" GroupName="p69"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP69"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP69"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>70</asp:TableCell>
																 <asp:TableCell runat="server" id="preg70" Text="El Zen del Trabajo en Equipo: Equipos Colaboradores “Altos Niveles de Confianza"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP70"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP70"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP70"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP70"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP70" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP70" GroupName="p70"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP70" GroupName="p70"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP70"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP70"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>71</asp:TableCell>
																 <asp:TableCell runat="server" id="preg71" Text="Establecimiento de Prioridades"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP71"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP71"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP71"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP71"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP71" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP71" GroupName="p71"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP71" GroupName="p71"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP71"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP71"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>72</asp:TableCell>
																 <asp:TableCell runat="server" id="preg72" Text="Estrés Ocupacional y Bienestar Integral en la Empresa"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP72"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP72"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP72"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP72"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP72" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP72" GroupName="p72"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP72" GroupName="p72"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP72"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP72"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>73</asp:TableCell>
																 <asp:TableCell runat="server" id="preg73" Text="Garantizar Bienestar en el Campo Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP73"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP73"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP73"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP73"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP73" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP73" GroupName="p73"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP73" GroupName="p73"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP73"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP73"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>74</asp:TableCell>
																 <asp:TableCell runat="server" id="preg74" Text="Imagen y Calidad en el Servicio al Cliente"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP74"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP74"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP74"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP74"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP74" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP74" GroupName="p74"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP74" GroupName="p74"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP74"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP74"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>75</asp:TableCell>
																 <asp:TableCell runat="server" id="preg75" Text="Integración de Equipos de Alto Rendimiento"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP75"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP75"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP75"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP75"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP75" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP75" GroupName="p75"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP75" GroupName="p75"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP75"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP75"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>76</asp:TableCell>
																 <asp:TableCell runat="server" id="preg76" Text="Inteligencia Emocional en el Contexto Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP76"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP76"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP76"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP76"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP76" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP76" GroupName="p76"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP76" GroupName="p76"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP76"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP76"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>77</asp:TableCell>
																 <asp:TableCell runat="server" id="preg77" Text="La Manipulación en las Relaciones Humanas (Personales y Laborales)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP77"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP77"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP77"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP77"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP77" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP77" GroupName="p77"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP77" GroupName="p77"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP77"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP77"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>78</asp:TableCell>
																 <asp:TableCell runat="server" id="preg78" Text="Los Efectos Psicosociales Espirituales de la Queja y la Murmuración"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP78"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP78"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP78"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP78"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP78" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP78" GroupName="p78"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP78" GroupName="p78"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP78"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP78"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>79</asp:TableCell>
																 <asp:TableCell runat="server" id="preg79" Text="Manejo constructivo del Conflicto"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP79"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP79"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP79"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP79"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP79" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP79" GroupName="p79"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP79" GroupName="p79"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP79"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP79"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>80</asp:TableCell>
																 <asp:TableCell runat="server" id="preg80" Text="Manejo del Enojo “Las caras de la Ira”"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP80"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP80"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP80"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP80"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP80" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP80" GroupName="p80"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP80" GroupName="p80"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP80"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP80"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>81</asp:TableCell>
																 <asp:TableCell runat="server" id="preg81" Text="Técnicas Básicas de Supervisión y Gerencia"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP81"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP81"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP81"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP81"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP81" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP81" GroupName="p81"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP81" GroupName="p81"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP81"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP81"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>82</asp:TableCell>
																 <asp:TableCell runat="server" id="preg82" Text="Toma de Decisiones"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP82"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP82"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP82"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP82"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP82" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP82" GroupName="p82"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP82" GroupName="p82"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP82"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP82"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>83</asp:TableCell>
																 <asp:TableCell runat="server" id="preg83" Text="Acoso Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP83"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP83"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP83"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP83"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP83" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP83" GroupName="p83"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP83" GroupName="p83"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP83"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP83"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>84</asp:TableCell>
																 <asp:TableCell runat="server" id="preg84" Text="Atención Al Cliente (Reacción Ante Personas Difíciles, Indecisas O Sumisas)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP84"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP84"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP84"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP84"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP84" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP84" GroupName="p84"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP84" GroupName="p84"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP84"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP84"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>85</asp:TableCell>
																 <asp:TableCell runat="server" id="preg85" Text="Liderazgo y Trabajo en Equipo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP85"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP85"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP85"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP85"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP85" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP85" GroupName="p85"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP85" GroupName="p85"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP85"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP85"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>86</asp:TableCell>
																 <asp:TableCell runat="server" id="preg86" Text="Empleo del Vocabulario adecuado en el trabajo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP86"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP86"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP86"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP86"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP86" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP86" GroupName="p86"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP86" GroupName="p86"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP86"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP86"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>87</asp:TableCell>
																 <asp:TableCell runat="server" id="preg87" Text="Creer, crear y crecer. Las tres C de la Excelencia"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP87"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP87"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP87"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP87"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP87" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP87" GroupName="p87"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP87" GroupName="p87"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP87"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP87"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>88</asp:TableCell>
																 <asp:TableCell runat="server" id="preg88" Text="Manejo del stress, distres y eutres"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP88"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP88"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP88"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP88"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP88" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP88" GroupName="p88"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP88" GroupName="p88"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP88"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP88"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>89</asp:TableCell>
																 <asp:TableCell runat="server" id="preg89" Text="El Despertar de los Valores"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP89"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP89"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP89"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP89"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP89" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP89" GroupName="p89"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP89" GroupName="p89"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP89"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP89"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>90</asp:TableCell>
																 <asp:TableCell runat="server" id="preg90" Text="Motivación al Logro 'Alcanzando Metas Profesionales y Personales'"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP90"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP90"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP90"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP90"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP90" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP90" GroupName="p90"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP90" GroupName="p90"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP90"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP90"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>91</asp:TableCell>
																 <asp:TableCell runat="server" id="preg91" Text="Negociación Ganar/Ganar"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP91"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP91"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP91"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP91"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP91" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP91" GroupName="p91"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP91" GroupName="p91"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP91"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP91"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>92</asp:TableCell>
																 <asp:TableCell runat="server" id="preg92" Text="Clima y Cultura Organizacional"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP92"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP92"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP92"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP92"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP92" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP92" GroupName="p92"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP92" GroupName="p92"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP92"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP92"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>93</asp:TableCell>
																 <asp:TableCell runat="server" id="preg93" Text="Desarrollar condiciones y relaciones de trabajo más satisfactorias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP93"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP93"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP93"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP93"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP93" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP93" GroupName="p93"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP93" GroupName="p93"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP93"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP93"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>94</asp:TableCell>
																 <asp:TableCell runat="server" id="preg94" Text="Elevar la concepción de valores de ética y moral más el compromiso organizacional"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP94"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP94"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP94"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP94"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP94" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP94" GroupName="p94"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP94" GroupName="p94"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP94"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP94"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>95</asp:TableCell>
																 <asp:TableCell runat="server" id="preg95" Text="Manejo de conflictos intrapersonales"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP95"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP95"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP95"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP95"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP95" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP95" GroupName="p95"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP95" GroupName="p95"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP95"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP95"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>96</asp:TableCell>
																 <asp:TableCell runat="server" id="preg96" Text="Trabajo Efectivo en Equipo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP96"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP96"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP96"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP96"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP96" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP96" GroupName="p96"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP96" GroupName="p96"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP96"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP96"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>97</asp:TableCell>
																 <asp:TableCell runat="server" id="preg97" Text="Contribuir el mejoramiento humano integral y continuo de cada talento, en lo social, moral,"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP97"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP97"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP97"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP97"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP97" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP97" GroupName="p97"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP97" GroupName="p97"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP97"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP97"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>98</asp:TableCell>
																 <asp:TableCell runat="server" id="preg98" Text="Calidad De Servicio Aplicado A Las Ventas, Promociones Y Cobranzas (Gerencia, Ventas, Plataforma, Cobranzas, Administración)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP98"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP98"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP98"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP98"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP98" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP98" GroupName="p98"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP98" GroupName="p98"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP98"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP98"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										  </div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">TIPO DE RIESGO: Prevención de Emergencias</a>
												</h4>
											  </div>
											  <div id="collapse7" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Prevención de Emergencias -->
														<asp:Table runat="server" id="Table6" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>99</asp:TableCell>
																 <asp:TableCell runat="server" id="preg99" Text="Uso y manejo de Extintores (Teórico – Práctico)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP99"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP99"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP99"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP99"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP99" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP99" GroupName="p99"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP99" GroupName="p99"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP99"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP99"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>100</asp:TableCell>
																 <asp:TableCell runat="server" id="preg100" Text="Identificación y Manejo de Materiales y Sustancias Peligrosas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP100"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP100"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP100"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP100"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP100" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP100" GroupName="p100"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP100" GroupName="p100"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP100"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP100"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>101</asp:TableCell>
																 <asp:TableCell runat="server" id="preg101" Text="Evacuación y Desalojo de Estructuras (Teórico – Práctico)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP101"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP101"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP101"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP101"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP101" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP101" GroupName="p101"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP101" GroupName="p101"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP101"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP101"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>102</asp:TableCell>
																 <asp:TableCell runat="server" id="preg102" Text="Conformación de Brigadas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP102"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP102"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP102"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP102"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP102" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP102" GroupName="p102"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP102" GroupName="p102"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP102"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP102"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>103</asp:TableCell>
																 <asp:TableCell runat="server" id="preg103" Text="Nociones Básicas de un Plan de Emergencias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP103"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP103"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP103"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP103"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP103" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP103" GroupName="p103"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP103" GroupName="p103"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP103"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP103"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>104</asp:TableCell>
																 <asp:TableCell runat="server" id="preg104" Text="Conocimientos Básicos de Control y Prevención de Incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP104"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP104"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP104"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP104"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP104" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP104" GroupName="p104"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP104" GroupName="p104"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP104"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP104"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>105</asp:TableCell>
																 <asp:TableCell runat="server" id="preg105" Text="Logística y Planificación Estratégica, Contingencias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP105"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP105"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP105"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP105"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP105" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP105" GroupName="p105"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP105" GroupName="p105"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP105"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP105"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>106</asp:TableCell>
																 <asp:TableCell runat="server" id="preg106" Text="Manejo del Plan de Evacuación y Plan de Emergencias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP106"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP106"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP106"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP106"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP106" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP106" GroupName="p106"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP106" GroupName="p106"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP106"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP106"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>107</asp:TableCell>
																 <asp:TableCell runat="server" id="preg107" Text="Administración de Emergencias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP107"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP107"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP107"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP107"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP107" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP107" GroupName="p107"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP107" GroupName="p107"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP107"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP107"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>108</asp:TableCell>
																 <asp:TableCell runat="server" id="preg108" Text="Articulación de la Brigada con el Cuerpo de Bomberos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP108"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP108"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP108"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP108"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP108" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP108" GroupName="p108"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP108" GroupName="p108"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP108"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP108"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>109</asp:TableCell>
																 <asp:TableCell runat="server" id="preg109" Text="Gestión para el Control de Emergencias   "></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP109"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP109"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP109"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP109"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP109" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP109" GroupName="p109"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP109" GroupName="p109"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP109"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP109"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>110</asp:TableCell>
																 <asp:TableCell runat="server" id="preg110" Text="Prevención e Inspección de Incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP110"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP110"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP110"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP110"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP110" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP110" GroupName="p110"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP110" GroupName="p110"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP110"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP110"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>111</asp:TableCell>
																 <asp:TableCell runat="server" id="preg111" Text="Comportamiento del Fuego"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP111"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP111"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP111"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP111"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP111" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP111" GroupName="p111"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP111" GroupName="p111"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP111"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP111"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>112</asp:TableCell>
																 <asp:TableCell runat="server" id="preg112" Text="Métodos, Agentes y Equipos de Extinción"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP112"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP112"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP112"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP112"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP112" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP112" GroupName="p112"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP112" GroupName="p112"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP112"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP112"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>113</asp:TableCell>
																 <asp:TableCell runat="server" id="preg113" Text="Mangueras y Accesorios para Control de Incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP113"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP113"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP113"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP113"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP113" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP113" GroupName="p113"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP113" GroupName="p113"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP113"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP113"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>114</asp:TableCell>
																 <asp:TableCell runat="server" id="preg114" Text="Chorros para Control de Incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP114"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP114"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP114"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP114"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP114" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP114" GroupName="p114"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP114" GroupName="p114"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP114"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP114"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>115</asp:TableCell>
																 <asp:TableCell runat="server" id="preg115" Text="Equipos de Respiración Autónoma"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP115"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP115"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP115"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP115"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP115" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP115" GroupName="p115"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP115" GroupName="p115"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP115"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP115"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>116</asp:TableCell>
																 <asp:TableCell runat="server" id="preg116" Text="Escaleras para Operaciones de Incendios        "></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP116"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP116"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP116"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP116"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP116" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP116" GroupName="p116"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP116" GroupName="p116"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP116"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP116"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>117</asp:TableCell>
																 <asp:TableCell runat="server" id="preg117" Text="Técnicas de Control de Incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP117"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP117"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP117"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP117"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP117" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP117" GroupName="p117"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP117" GroupName="p117"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP117"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP117"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>118</asp:TableCell>
																 <asp:TableCell runat="server" id="preg118" Text="Sistemas de Protección Contra incendios"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP118"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP118"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP118"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP118"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP118" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP118" GroupName="p118"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP118" GroupName="p118"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP118"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP118"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>119</asp:TableCell>
																 <asp:TableCell runat="server" id="preg119" Text="Primer Respondiente en Materiales Peligrosos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP119"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP119"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP119"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP119"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP119" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP119" GroupName="p119"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP119" GroupName="p119"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP119"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP119"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>120</asp:TableCell>
																 <asp:TableCell runat="server" id="preg120" Text="Simulaciones y Simulacros"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP120"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP120"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP120"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP120"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP120" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP120" GroupName="p120"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP120" GroupName="p120"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP120"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP120"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>121</asp:TableCell>
																 <asp:TableCell runat="server" id="preg121" Text="Primer Respondiente a Emergencias Médicas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP121"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP121"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP121"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP121"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP121" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP121" GroupName="p121"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP121" GroupName="p121"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP121"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP121"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>122</asp:TableCell>
																 <asp:TableCell runat="server" id="preg122" Text="Reanimación Cardio Pulmonar (RCP)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP122"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP122"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP122"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP122"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP122" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP122" GroupName="p122"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP122" GroupName="p122"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP122"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP122"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>123</asp:TableCell>
																 <asp:TableCell runat="server" id="preg123" Text="Primer Respondiente en Rescate"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP123"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP123"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP123"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP123"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP123" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP123" GroupName="p123"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP123" GroupName="p123"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP123"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP123"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>124</asp:TableCell>
																 <asp:TableCell runat="server" id="preg124" Text="Procedimiento Operativo Normalizado"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP124"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP124"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP124"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP124"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP124" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP124" GroupName="p124"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP124" GroupName="p124"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP124"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP124"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										  </div>
										 <div class="panel panel-default">
											  <div class="panel-heading bg-aqua color-palette">
												<h4 class="panel-title">
												  <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">TIPO DE RIESGO: Generales</a>
												</h4>
											  </div>
											  <div id="collapse8" class="panel-collapse collapse">
													<div class="panel-body">
														<!-- Generales -->
														<asp:Table runat="server" id="Table7" CssClass="table">
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">N°</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">TEMA DE CAPACITACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DURACIÓN</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">POBLACIÓN OBJETO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">PONENTE O INSTRUCTOR</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">DOCUMENTO DE  SOPORTE</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">FECHA PROGRAMADA</asp:TableHeaderCell>
																 <asp:TableHeaderCell ColSpan="2" CssClass="text-center">ESTATUS DE CUMPLIMIENTO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">LUGAR O SITIO</asp:TableHeaderCell>
																 <asp:TableHeaderCell RowSpan="2" CssClass="text-center">OBSERVACIONES</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															 <asp:TableHeaderRow>
																 <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
																 <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
															 </asp:TableHeaderRow>
															<asp:TableRow>
																 <asp:TableCell>125</asp:TableCell>
																 <asp:TableCell runat="server" id="preg125" Text="Herramientas Preventivas en Seguridad y Salud en el Trabajo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP125"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP125"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP125"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP125"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP125" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP125" GroupName="p125"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP125" GroupName="p125"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP125"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP125"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>126</asp:TableCell>
																 <asp:TableCell runat="server" id="preg126" Text="Educación Vial"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP126"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP126"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP126"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP126"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP126" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP126" GroupName="p126"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP126" GroupName="p126"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP126"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP126"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>127</asp:TableCell>
																 <asp:TableCell runat="server" id="preg127" Text="Conocimiento Teórico sobre las Normas de Tránsito y el Comportamiento en la Vía"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP127"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP127"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP127"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP127"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP127" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP127" GroupName="p127"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP127" GroupName="p127"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP127"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP127"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>128</asp:TableCell>
																 <asp:TableCell runat="server" id="preg128" Text="Cultura de prevención"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP128"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP128"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP128"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP128"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP128" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP128" GroupName="p128"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP128" GroupName="p128"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP128"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP128"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>129</asp:TableCell>
																 <asp:TableCell runat="server" id="preg129" Text="Accidentes en el Trayecto"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP129"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP129"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP129"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP129"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP129" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP129" GroupName="p129"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP129" GroupName="p129"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP129"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP129"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>130</asp:TableCell>
																 <asp:TableCell runat="server" id="preg130" Text="Los Incidentes son advertencias"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP130"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP130"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP130"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP130"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP130" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP130" GroupName="p130"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP130" GroupName="p130"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP130"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP130"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>131</asp:TableCell>
																 <asp:TableCell runat="server" id="preg131" Text="Importancia Y Consecuencias Del Cumplimiento de Lineamientos Seguridad Salud Higiene Y Ambiente"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP131"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP131"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP131"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP131"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP131" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP131" GroupName="p131"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP131" GroupName="p131"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP131"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP131"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>132</asp:TableCell>
																 <asp:TableCell runat="server" id="preg132" Text="Equipos de Protección Personal"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP132"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP132"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP132"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP132"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP132" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP132" GroupName="p132"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP132" GroupName="p132"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP132"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP132"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>133</asp:TableCell>
																 <asp:TableCell runat="server" id="preg133" Text="Distracción en el Trabajo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP133"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP133"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP133"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP133"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP133" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP133" GroupName="p133"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP133" GroupName="p133"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP133"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP133"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>134</asp:TableCell>
																 <asp:TableCell runat="server" id="preg134" Text="Tipo, Uso  y Mantenimiento de Equipos de Protección Personal"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP134"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP134"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP134"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP134"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP134" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP134" GroupName="p134"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP134" GroupName="p134"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP134"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP134"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>135</asp:TableCell>
																 <asp:TableCell runat="server" id="preg135" Text="Seguridad Basada en el Comportamiento"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP135"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP135"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP135"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP135"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP135" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP135" GroupName="p135"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP135" GroupName="p135"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP135"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP135"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>136</asp:TableCell>
																 <asp:TableCell runat="server" id="preg136" Text="Análisis de la Causa Raíz en Incidentes y Accidentes Laborales"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP136"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP136"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP136"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP136"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP136" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP136" GroupName="p136"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP136" GroupName="p136"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP136"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP136"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>137</asp:TableCell>
																 <asp:TableCell runat="server" id="preg137" Text="Aspectos Humanos en la Prevención de Riesgos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP137"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP137"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP137"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP137"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP137" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP137" GroupName="p137"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP137" GroupName="p137"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP137"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP137"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>138</asp:TableCell>
																 <asp:TableCell runat="server" id="preg138" Text="Autoprotección"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP138"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP138"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP138"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP138"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP138" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP138" GroupName="p138"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP138" GroupName="p138"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP138"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP138"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>139</asp:TableCell>
																 <asp:TableCell runat="server" id="preg139" Text="Ecología y Reciclaje"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP139"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP139"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP139"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP139"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP139" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP139" GroupName="p139"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP139" GroupName="p139"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP139"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP139"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>140</asp:TableCell>
																 <asp:TableCell runat="server" id="preg140" Text="Herramientas de comunicación en Campañas de Seguridad y Salud Laboral"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP140"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP140"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP140"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP140"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP140" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP140" GroupName="p140"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP140" GroupName="p140"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP140"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP140"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>141</asp:TableCell>
																 <asp:TableCell runat="server" id="preg141" Text="Participación Activa de los Trabajadores en el Desarrollo de Análisis de Riesgo de Trabajo"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP141"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP141"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP141"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP141"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP141" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP141" GroupName="p141"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP141" GroupName="p141"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP141"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP141"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>142</asp:TableCell>
																 <asp:TableCell runat="server" id="preg142" Text="Prevención de Accidentes en Carretera y otras Instalaciones"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP142"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP142"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP142"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP142"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP142" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP142" GroupName="p142"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP142" GroupName="p142"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP142"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP142"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>143</asp:TableCell>
																 <asp:TableCell runat="server" id="preg143" Text="Prevención de Accidentes en las Manos y Piel"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP143"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP143"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP143"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP143"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP143" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP143" GroupName="p143"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP143" GroupName="p143"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP143"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP143"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>144</asp:TableCell>
																 <asp:TableCell runat="server" id="preg144" Text="Prevención en accidentes de motos"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP144"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP144"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP144"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP144"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP144" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP144" GroupName="p144"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP144" GroupName="p144"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP144"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP144"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>145</asp:TableCell>
																 <asp:TableCell runat="server" id="preg145" Text="Seguridad después del Trabajo y en el Hogar"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP145"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP145"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP145"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP145"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP145" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP145" GroupName="p145"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP145" GroupName="p145"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP145"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP145"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>146</asp:TableCell>
																 <asp:TableCell runat="server" id="preg146" Text="Alimentación Saludable"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP146"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP146"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP146"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP146"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP146" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP146" GroupName="p146"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP146" GroupName="p146"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP146"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP146"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>147</asp:TableCell>
																 <asp:TableCell runat="server" id="preg147" Text="Ecología Y Reciclaje En  Las Empresas"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP147"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP147"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP147"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP147"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP147" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP147" GroupName="p147"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP147" GroupName="p147"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP147"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP147"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>148</asp:TableCell>
																 <asp:TableCell runat="server" id="preg148" Text="Impacto Ambiental"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP148"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP148"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP148"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP148"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP148" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP148" GroupName="p148"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP148" GroupName="p148"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP148"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP148"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>149</asp:TableCell>
																 <asp:TableCell runat="server" id="preg149" Text="Las 3 R (Recicla, Reduce Y Reutiliza)"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP149"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP149"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP149"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP149"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP149" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP149" GroupName="p149"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP149" GroupName="p149"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP149"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP149"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
															<asp:TableRow>
																 <asp:TableCell>150</asp:TableCell>
																 <asp:TableCell runat="server" id="preg150" Text="Señalización de Seguridad y Código de Colores"></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="durP150"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="pobP150"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ponP150"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="docP150"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="fecP150" TextMode="Date"></asp:TextBox></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="siP150" GroupName="p150"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell CssClass="text-center"><asp:RadioButton runat="server" id="noP150" GroupName="p150"></asp:RadioButton></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="lugP150"></asp:TextBox></asp:TableCell>
																 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="ObsP150"></asp:TextBox></asp:TableCell>
															</asp:TableRow>
														</asp:Table>
													</div>
											  </div>
										  </div>
									<!-- Fin de Panel Padre--> 
									</div>
								 </asp:Panel>
							 </div>
						</div>
						 <!--  Fin de Informacion -->
					<div class="row" align="center">	
					
						<div class="col-md-4 col-md-offset-4">
							<asp:ImageButton alt="-" id="btnDocumento" runat="server" ImageUrl="~\ico\print.png" 
									OnClick="GenerarDocumento"/>
								<h4>Generar Documento</h4>
						 </div>
						 
					</div>
					</asp:PlaceHolder>
				  </ContentTemplate>
				<Triggers>
					<asp:PostBackTrigger ControlID = "btnDocumento"/>
				</Triggers>
			</asp:updatepanel>

</asp:Content>