<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_MedidasMatrizLegal.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_MedidasMatrizLegal" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" 
	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="container" style="width: 100%;">
		
		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_MatrizLegal.aspx">Matriz Legal</a></li>
			<li><a href="#">Seguimiento de Medidas de la Norma</a></li>
		</ol>

		<div class="page-header">
			<h1 class="text-center">Seguimiento de las Medidas de la Norma</h1>
		</div>

		<div class="row">
			<h2 class="text-info text-left">Documento:
				 <h3 class="text-left">
					 <asp:label runat="server" text="estatus" id="lbDocumento"></asp:label>
				 </h3>
			</h2>

			<h2 class="text-info text-left">Tema:
				 <h3 class="text-left">
					 <asp:label runat="server" text="estatus" id="lbTemaEspecifico"></asp:label>
				 </h3>
			</h2>
		</div>

		<br />

		<div class="row">
			<div class="col-md-2">
				<h4 class="text-center">Medidas que aplican</h4>
			</div>
			<div class="col-md-10">
				<h4 class="text-center">Medidas</h4>
			</div>
		</div>
		<hr />
		

		<style>
			.ChLst TR {
				height: 150px;
			}
			.BLst li {
				height: 150px;
				list-style-type:none;
			}
		</style>
		<div class="row">
			<div class="col-md-12">
				
				<table class="table table-condensed">
					<tbody>
						<tr class="bg-aqua color-palette">
							<th class="col-md-1 text-center">Medidas que aplican</th>
							<th class="col-md-10 text-center">Medidas</th>
							<th class="col-md-1">Crear Obligación</th>
						</tr>
						
						<tr>
							<td>
								<asp:checkboxlist id="chkAplica" runat="server" cssclass="ChLst"/>
							</td>

							<td>
								<asp:checkboxlist id="chkMedidas" runat="server" cssclass="ChLst"/>
							</td>
							<td>
								<asp:bulletedlist id="listSeg" runat="server" cssclass="BLst" runat="server"
									DisplayMode ="HyperLink" align="left"></asp:bulletedlist>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br />

		<div class="row">
			<div class="col-md-10">
				<div class="box box-solid">
					<div class="box-header with-border">
						<h3 class="box-title">Estatus de cumplimiento de la Norma =
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
					class="btn btn-block btn-info" data-toggle="tooltip" data-placement="bottom" 
					title="Presiona para guardar el estatus de la medida"/>
			</div>
		</div>
		<br />


	</div>

</asp:Content>