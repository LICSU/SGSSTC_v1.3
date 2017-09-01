﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="VerRespuesta.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.VerRespuesta" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" 
	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<asp:updatepanel id="updatePanelPrinicpal" runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="index.aspx">Menu Principal</a></li>
				<li><a href="#">Ver Respuestas</a></li>
			</ol>
	
			<div class="page-header">
				<h1 class="text-center">Ver Respuestas</h1>
			</div>

	
			<div class="row">
				<div class="col-md-8">
					<h3><strong>Usuario:</strong></h3>
					<asp:Label ID="lbUsuario" runat="server" Text="-"></asp:Label>
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-md-8">
					<h3><strong>Pregunta:</strong></h3>
					<asp:Label ID="lbPregunta" runat="server" Text="-"></asp:Label>
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-md-8">
					<h3><strong>Respuesta:</strong></h3>
					<asp:Label ID="lbRespuesta" runat="server" Text="-"></asp:Label>
				</div>
			</div>
	
			<hr />
			
			<asp:PlaceHolder runat="server" id="phCalificar">
				<div class="row">

					<div class="col-md-3">
			
						<h4><strong>Calificar Respuesta</strong></h4>

						<asp:DropDownList runat="server" CssClass="form-control" id="ddlCalificacion">
							<asp:ListItem Text="Sin Calificar"  Value="0"></asp:ListItem>
							<asp:ListItem Text="Mala"       Value="1"></asp:ListItem>
							<asp:ListItem Text="Regular"    Value="2"></asp:ListItem>
							<asp:ListItem Text="Buena"      Value="3"></asp:ListItem>
							<asp:ListItem Text="Excelente"  Value="4"></asp:ListItem>
						</asp:DropDownList>

						<br />

						<asp:button text="Calificar" id="Button1" runat="server" class="btn btn-block btn-info" 
							onclick="CalificarRespuesta" data-toggle="tooltip" data-placement="bottom" 
							title="Presione para calificar una respuesta"/>
					</div>
				</div>
			</asp:PlaceHolder>
		
		</ContentTemplate>
		<Triggers></Triggers>
	</asp:updatepanel>
	
	<!-- Msj Modal -->
	<ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>