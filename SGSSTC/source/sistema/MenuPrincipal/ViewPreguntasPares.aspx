<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ViewPreguntasPares.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.ViewPreguntasPares" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<asp:updatepanel runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="index.aspx">Menu Principal</a></li>
				<li><a href="#">Ver Preguntas Pares</a></li>
			</ol>
			
			<div class="page-header">
				<h1 class="text-center">Ver Preguntas Pares</h1>
			</div>
			
			<div class="row">
				<div class="col-md-4">
					<h4 class="text-center">Fecha inicio: </h4>
					<asp:TextBox id="txtFechaInicio" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date" 
					  AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
				</div>

				<div class="col-md-4">
					<h4 class="text-center">Fecha fin: </h4>
					<asp:TextBox id="txtFechaFin" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date" 
					  AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
				</div>
			</div>

			
			<div class="row">
				<div class="box-body">
					<div class="dataTables_wrapper form-inline dt-bootstrap">
						<ucpag:pagination runat="server" id="pagination"/>
					
						<asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server" 
							AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
							onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
							EmptyDataText="No existen Registros">

							<rowstyle  HorizontalAlign="Center"/>
						
							<Columns>
								<asp:TemplateField  Visible="false" HeaderStyle-CssClass="text-center">
									<ItemTemplate><asp:Label id="id_pregunta" runat="server" Text='<%# Eval("id_pregunta") %>'/></ItemTemplate>
								</asp:TemplateField>

								<asp:TemplateField HeaderText="Pregunta" HeaderStyle-CssClass="text-center">
									<ItemTemplate><asp:Label id="titulo" runat="server" Text='<%# Eval("titulo") %>'/></ItemTemplate>
								</asp:TemplateField>
				
								<asp:TemplateField HeaderText="Fecha" HeaderStyle-CssClass="text-center">
									<ItemTemplate><asp:Label id="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>'/></ItemTemplate>
								</asp:TemplateField>

								<asp:ButtonField HeaderText="Ver" CommandName="Ver" ButtonType="Image" ImageUrl="~\ico\view.png">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

								<asp:ButtonField HeaderText="Responder" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
									<ControlStyle></ControlStyle>
								</asp:ButtonField>

							</Columns>

						</asp:GridView>

					</div>
				</div>
			</div>

		</ContentTemplate>
		<Triggers></Triggers>
	</asp:updatepanel>

</asp:Content>