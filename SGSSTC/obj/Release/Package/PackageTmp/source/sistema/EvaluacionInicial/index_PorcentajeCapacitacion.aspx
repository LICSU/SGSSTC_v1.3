﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PorcentajeCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_PorcentajeCapacitacion" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <asp:scriptmanager id="ScriptManager1" runat="server"/>

    <ol class="breadcrumb">
        <li><a href="#">Fase: Evaluación Inicial</a></li>
        <li><a href="#">Porcentaje de Capacitaciónes</a></li>
    </ol>    
    
    <div class="page-header">
        <h1 class="text-center">Capacitación Anual de Trabajadores</h1>
    </div>

    <asp:updatepanel runat="server">
        <ContentTemplate> 

            <div class="row form-group">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            </div>

            <asp:PlaceHolder runat="server" id="phEncabezado" Visible="false">
                <div class="row form-group">
                    <div class="col-md-12 table-responsive" style="overflow:auto;">
                        <asp:Panel id="pnTablaCapacitacion" runat="server"></asp:Panel>
                    </div>
                </div>
                
                <asp:PlaceHolder runat="server" id="phAsistenciasLeyenda" Visible="false">
                    <div class="row form-group">
                        <div class="col-md-3 col-md-offset-3">
                            <div class="row form-group">
                                <div class="col-md-9 col-md-offset-1"><asp:Label runat="server" id="lblInasistenciasIn" Text="Inasistencia Injustificada"></asp:Label></div>
                                <div class="col-md-1 text-left"><img src="../../../ico/injust.png" alt="Injustificada"/></div>
                            </div>
                            <div class="row form-group"> 
                                <div class="col-md-9 col-md-offset-1"><asp:Label runat="server" id="Label1" Text="Inasistencia Justificada"></asp:Label></div>
                                <div class="col-md-1 text-left"><img src="../../../ico/just.png" alt="Justificada"/></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="row form-group">
                                <div class="col-md-9 col-md-offset-1"><asp:Label runat="server" id="Label2" Text="Total Inasistencias"></asp:Label></div>
                                <div class="col-md-1 text-left"><asp:Label runat="server" id="lblTotalInasistencias" Text=" -"></asp:Label></div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-9 col-md-offset-1"><asp:Label runat="server" id="Label3" Text="Total Asistencias"></asp:Label></div>
                                <div class="col-md-1"><asp:Label runat="server" CssClass="text-left" id="lblTotalAsistencias" Text=" -"></asp:Label></div>
                            </div>
                        </div> 
                    </div>
                    
                    <div class="row form-group">
                         <div class="col-md-8 col-md-offset-2 text-center">
                             <h3 class="text-center">PORCENTAJE DE CUMPLIMIENTO</h3>
                            <asp:Chart id="graficoAsistencia" runat="server">
                                <Series>
                                    <asp:Series Name="asistencias" ChartType="Pie"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                         </div>
                     </div>
                </asp:PlaceHolder>
            </asp:PlaceHolder>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>