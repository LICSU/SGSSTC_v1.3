<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionUsoEpp.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionUsoEpp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="../EvaluacionInicial/index_Inspecciones.aspx">Inspecciones</a></li>
            <li><a href="#">Crear Inspección de Uso de EPP</a></li>
        </ol>
        
        <div class="page-header">
             <h1 class="text-center">Inspección de Uso de EPP</h1>
         </div>

        <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
            <ContentTemplate>
                <asp:hiddenfield runat="server" id="cantInspecciones" value="0"></asp:hiddenfield> 
                
                <div class="row form-group">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder> 
                    
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-3">
                        <h4 class="text-center">Área</h4>
                        <asp:DropDownList runat="server" id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <h4 class="text-center">Puesto de Trabajo</h4>
                        <asp:DropDownList runat="server" id="ddlPuesto"  data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <h4 class="text-center">Trabajador</h4>
                        <asp:TextBox id="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                        <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1" 
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlid="txtTrabajador" id="AutoCompleteExtender1" runat="server" 
                            FirstRowSelected = "false" 
                            CompletionListCssClass="completionList"
                            CompletionListItemCssClass="listItem"
                            CompletionListHighlightedItemCssClass="itemHighlighted">
                        </cc1:AutoCompleteExtender>
                    </div>
                    <div class="col-md-3">
                        <h4 class="text-center">&nbsp;</h4>
                        <asp:Button runat="server" id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" Text="Buscar" CssClass="btn btn-default" OnClick="btnBuscar_OnClick" />
                    </div>
                </div>
                        
                
                <asp:PlaceHolder runat="server" id="phInformacion" Visible="False">
                    <div class="row">
                         <div class="col-md-12">
                                 <asp:Panel runat="server" id="pnDatos">
                                     <asp:Table runat="server" id="tb_datos" CssClass="table">
                                         <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                             <asp:TableHeaderCell RowSpan="2">EQUIPO DE PROTECCION PERSONAL</asp:TableHeaderCell>
                                             <asp:TableHeaderCell CssClass="text-center" ColumnSpan="2">USO</asp:TableHeaderCell>
                                             <asp:TableHeaderCell CssClass="text-center" ColumnSpan="2">ESTADO</asp:TableHeaderCell>
                                             <asp:TableHeaderCell RowSpan="2">OBSERVACIONES</asp:TableHeaderCell>
                                         </asp:TableHeaderRow>
                                         <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                             <asp:TableHeaderCell CssClass="text-center">SI</asp:TableHeaderCell>
                                             <asp:TableHeaderCell CssClass="text-center">NO</asp:TableHeaderCell>
                                             <asp:TableHeaderCell CssClass="text-center">APTO</asp:TableHeaderCell>
                                             <asp:TableHeaderCell CssClass="text-center">NO APTO</asp:TableHeaderCell>
                                         </asp:TableHeaderRow>
                                     </asp:Table>
                                 </asp:Panel>
                             </div>
                    </div>
                    
                    <div class="row" align="center">
					
                        <div class="col-md-4 col-md-offset-2">
                            <asp:Button runat="server" id="btnDocumento" Text="Generar Documento" CssClass="btn btn-block btn-info" 
                                OnClick="GenerarDocumento"/>
                         </div>
						
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" id="phNoRegistros" Visible="false">
                    <div class="row form-group">
                            <div class="col-md-8 col-md-offset-2 text-center">
                                <strong><h4 class="text-left">No existen registros para ese puesto de trabajo.</h4></strong>
                            </div>
                        </div>
                </asp:PlaceHolder>
            
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID = "btnDocumento"/>
            </Triggers>
        </asp:updatepanel>
    </div>
</asp:Content>