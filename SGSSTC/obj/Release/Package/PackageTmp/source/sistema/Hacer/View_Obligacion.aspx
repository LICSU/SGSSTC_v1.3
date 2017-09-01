﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_Obligacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_Obligacion" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
	<div class="container" style="width: 100%;">
    
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_Obligaciones.aspx">Obligaciones</a></li>
            <li><a href="#">Consultar Obligación</a></li>
        </ol>    
    
        <div class="page-header">
            <h1 class="text-center">Consultar Obligación</h1>
        </div>

        <div class="row">
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Fecha de Entrega</h4>
                <asp:label runat="server" id="txtFechaEntrega" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Responsable</h4>
                <asp:label runat="server" id="txtResponsable" cssclass="control-label"></asp:label>
            </div>

        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Categoria</h4>
                <asp:label runat="server" id="txtCategoria" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Prioridad</h4>
                <asp:label runat="server" id="txtPrioridad" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Frecuencia de Control</h4>
                <asp:label runat="server" id="txtFrecuencia" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Estatus</h4>
                <asp:label runat="server" id="txtEstatus" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Actividad del Plan de Trabajo</h4>
                <asp:label runat="server" id="txtActividad" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Descripcion</h4>
                <asp:label runat="server" id="txtDescripcion" cssclass="control-label"></asp:label>
            </div>
        </div>

        <br />

        <div class="row"> 
            <div class="col-md-11 col-md-offset-1">
                <h4 class="text-left">Acciones</h4>
                <asp:label runat="server" id="txtAcciones" cssclass="control-label"></asp:label>
            </div>
        </div>
		
    </div>
    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
</asp:Content>