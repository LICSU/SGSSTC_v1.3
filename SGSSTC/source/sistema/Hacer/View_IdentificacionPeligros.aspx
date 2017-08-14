<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_IdentificacionPeligros.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_IdentificacionPeligros" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <div class="container" style="width:100%;">
                
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
                            <h4 class="text-left">Empresa</h4>
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


            </div>

        </ContentTemplate>
    </asp:updatepanel>
</asp:Content>