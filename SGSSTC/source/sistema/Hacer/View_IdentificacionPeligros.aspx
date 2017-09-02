<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_IdentificacionPeligros.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_IdentificacionPeligros" %>

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
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="../Hacer/index_IdentificacionPeligros.aspx">Identificación de Peligros</a></li>
                    <li><a href="#">Consultar Identificacion de Peligro</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Consultar Identificacion de Peligro</h1>
                </div>
                
                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4>Empresa</h4>
                            <asp:label runat="server" id="txtEmpresa"></asp:label>
                        </div>
                    </asp:PlaceHolder>
                </div>
                <br />

                <!-- titulo puestos-->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-left">Puestos de Trabajo Afectados</h3>
                        <asp:Label id="txtPuestos" runat="server"></asp:Label>
                    </div>
                </div>

                <!-- titulo Riesgos-->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-left">Peligros</h3>
                        <asp:Label id="txtPeligros" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-left">Medidas de control existentes:</h3>
                        <asp:Label id="txtMedidas" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-left">Observaciones:</h3>
                        <asp:Label id="txtObservaciones" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

        </ContentTemplate>
    </asp:updatepanel>

</asp:Content>