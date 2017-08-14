<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ReporteAccidentes.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_ReporteAccidentes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  

    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="#">Reporte de Accidentes Laborales</a></li>
        </ol> 

        <div class="page-header">
            <h1 class="text-center">Reporte Accidentes Laborales</h1>
        </div>

        <div class="row">
            <asp:placeholder runat="server" id="phEmpresa" visible="true">
                    <div class="col-md-4 text-center">
                        <label>Empresa</label>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:placeholder>
        </div>
        <br />

        <div class="row">
            <asp:placeholder runat="server" id="phSucursal" visible="true">
                    <div class="col-md-4 text-center">
                        <label>Sucursal</label>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:placeholder>

            <asp:placeholder runat="server" id="phAnho" visible="true"> 
                <div class="col-md-4 text-center">
                    <label>Año</label>
                    <asp:DropDownList runat="server" id="ddlAnho" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnho_SelectedIndexChanged"></asp:DropDownList>
                </div>
                </asp:placeholder>

            <div class="col-md-4 text-center">
                <label>Tipo de Periodo</label>
                <asp:dropdownlist runat="server" id="ddlPeriodo" cssclass="form-control" autopostback="true" onselectedindexchanged="ddlPeriodo_SelectedIndexChanged">
                        <asp:ListItem Text="Seleccione Uno" Value=""/>
                        <asp:ListItem Text="Mensual" Value="1"/>
                        <asp:ListItem Text="Trimestral" Value="2"/>
                        <asp:ListItem Text="Semestral" Value="3"/>
                        <asp:ListItem Text="Anual" Value="4"/>
                    </asp:dropdownlist>
            </div>
        </div>
        <br />

        <div class="row" style="overflow: auto;">
            <div class="box-body">
                <div class="dataTables_wrapper form-inline dt-bootstrap">
                    <ucpag:pagination runat="server" id="pagination"/>

                    <asp:placeholder runat="server" id="phMensual" visible="false">
                        <asp:GridView id="GridView1" 
                            class="table table-bordered table-hover dataTable"
                            runat="server">
                        </asp:GridView>
                        </asp:placeholder>

                    <asp:placeholder runat="server" id="phSemestral" visible="false">
                        <asp:GridView id="GridView2" 
                            class="table table-bordered table-hover dataTable"
                            runat="server">
                        </asp:GridView>
                        </asp:placeholder>

                    <asp:placeholder runat="server" id="phTrimestral" visible="false"> 
                        <asp:GridView id="GridView3" 
                            class="table table-bordered table-hover dataTable"
                            runat="server">
                        </asp:GridView>
                        </asp:placeholder>

                    <asp:placeholder runat="server" id="phAnual" visible="false"> 
                        <asp:GridView id="GridView4" 
                            class="table table-bordered table-hover dataTable"
                            runat="server">
                        </asp:GridView>
                        </asp:placeholder>

                    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
                    <script type="text/javascript" src="//www.google.com/jsapi"></script>


                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:literal id="ltIF" runat="server"></asp:literal>
                            <div id="chartIF"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:literal id="ltIS" runat="server"></asp:literal>
                            <div id="chartIS"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:literal id="ltIDP" runat="server"></asp:literal>
                            <div id="chartIDP"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <asp:literal id="ltILI" runat="server"></asp:literal>
                            <div id="chartILI"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />

    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>