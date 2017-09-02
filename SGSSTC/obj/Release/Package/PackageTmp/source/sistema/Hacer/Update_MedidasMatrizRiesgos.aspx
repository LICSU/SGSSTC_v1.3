<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_MedidasMatrizRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_MedidasMatrizRiesgos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" 
	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

		
		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_MatrizRiesgos.aspx">Matriz de Riesgos</a></li>
			<li><a href="#">Seguimiento de Medidas de la Norma</a></li>
		</ol>
		
		<div class="page-header">
			<h1 class="text-center">Seguimiento de Medidas de los Riesgos</h1>
		</div>

		<div class="row">
			<h2 class="text-info text-left">Tipo de Riesgo:
				 <h3 class="text-left">
					 <asp:label runat="server" text="estatus" id="lbTipoRiesgo"></asp:label>
				 </h3>
			</h2>

			<h2 class="text-info text-left">Factor de Riesgo:
				 <h3 class="text-left">
					 <asp:label runat="server" text="estatus" id="lbFactorRiesgo"></asp:label>
				 </h3>
			</h2>

		</div>
		<br />
		<hr />

		<div class="row">
			<div class="col-md-6">
				<h3 class="text-left">Medidas Asignadas al Riesgo</h3>
			</div>
		</div>
		<br />

		<div class="row">
			<div class="col-md-12">
				<asp:checkboxlist id="chkMedidas" runat="server"></asp:checkboxlist>
			</div>
		</div>
		<br />
		<hr />

		<div class="row">
			<div class="col-md-10">
				<div class="box box-solid">
					<div class="box-header with-border">
						<h3 class="box-title">Estatus de cumplimiento del Riesgo =
							<asp:label runat="server" text="estatus" id="lbestatus"/>
							%</h3>
					</div>
					<div class="box-body">
						<div class="progress">
							<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <% =lbestatus.Text%>%">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />

		<div class="row">

			<div class="col-md-2 col-md-offset-5">
				<asp:button text="Guardar Cambios" id="btnGuardar" runat="server" onclick="GuardarRegistro" 
					class="btn btn-block btn-info"/>
			</div>

		</div>

		<br />

	<!-- Msj Modal -->
	<ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>