<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_GestionLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_GestionLaboral" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" id="zonaPrint" style="width: 100%;">

        <script>
            function imprimir() {
                w = window.open();
                w.document.write($('#zonaPrint').html());
                w.print();
                w.close();
            }
        </script>
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_GestionLaboral.aspx">Gestión Laboral</a></li>
            <li><a href="#">Consultar Gestión Laboral</a></li>
        </ol>

        <div class="page-header">
           <h1 class="text-center">Consultar Gestion Laboral</h1>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h3>Empresa: </h3>
            </div>
            <div class="col-md-8 text-left">
                <br />
                <h4 class="text-left">
                    <asp:label runat="server" text="lbEmpresa" id="lbEmpresa"></asp:label>
                </h4>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h3>Fecha: </h3>
            </div>
            <div class="col-md-8 text-left">
                <br />
                <h4 class="text-left">
                    <asp:label runat="server" text="lbEmpresa" id="lbFecha"></asp:label>
                </h4>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h3>Descripción: </h3>
            </div>
            <div class="col-md-8 text-left">
                <br />
                <h4 class="text-left">
                    <asp:label runat="server" text="lbEmpresa" id="lbDesc"></asp:label>
                </h4>
            </div>
        </div>

        <asp:placeholder runat="server" id="phCapacitacion" visible="false">
            <div class="row">
                <div class="col-md-4 text-left"><h3>Objetivo de la Capacitación: </h3></div>
                <div class="col-md-8 text-left"><br /><h4 class="text-left"><asp:label runat="server" text="lbEmpresa" id="lbObj"></asp:label></h4></div>
            </div>

            <div class="row">
                <div class="col-md-4 text-left"><h3>Cantidad de Horas: </h3></div>
                <div class="col-md-8 text-left"><br /><h4 class="text-left"><asp:label runat="server" text="lbEmpresa" id="lbHoras"></asp:label></h4></div>
            </div>
            </asp:placeholder>

        <div class="row">
            <div class="col-md-4">
                <h3>Responsable: </h3>
            </div>
            <div class="col-md-8 text-left">
                <br />
                <h4 class="text-left">
                    <asp:label runat="server" text="lbEmpresa" id="lbResponsable"></asp:label>
                </h4>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h3>Soporte: </h3>
            </div>
            <div class="col-md-8 text-left">
                <br />
                <h4 class="text-left">
                    <asp:hyperlink runat="server" id="hpSoporte">Soporte</asp:hyperlink>
                </h4>
            </div>
        </div>
        <hr />

        <div class="row">
            <h3 class="col-md-12 text-info text-center">Lista de Trabajadores que Asistiran a la Gestión</h3>
        </div>
        <br />

        <!-- campos lista -->
        <asp:panel id="pListaTrab" runat="server"></asp:panel>
        <br />

       
    </div>
</asp:Content>