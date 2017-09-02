<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_PlanillaEntregaEpp.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.create_PlanillaEntregaEpp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_PlanillaEntregaEpp.aspx">Planilla de Entrega de EPP</a></li>
            <li><a href="#">Crear Planilla de Entrega de EPP</a></li>
        </ol>
        
        <div class="page-header">
            <h1 class="text-center">Planilla de Entrega de EPP</h1>
        </div>

        <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
            <ContentTemplate>
                <asp:hiddenfield runat="server" id="cantEquipos" value="0"></asp:hiddenfield> 
                
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
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                    
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
                    <asp:Button runat="server" id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" Text="Generar" CssClass="btn btn-default" OnClick="btnGenerar_OnClick" />
                </div>
                </div>
                
                <asp:PlaceHolder runat="server" id="phInformacion" Visible="False">
                    <div class="row">
                         <div class="col-md-12">
                             <asp:Panel runat="server" id="pnDatos">
                                 <asp:Table runat="server" id="tb_datos" CssClass="table">
                                     <asp:TableHeaderRow>
                                         <asp:TableHeaderCell>Dotación Entregada</asp:TableHeaderCell>
                                         <asp:TableHeaderCell>Detalles de la Dotación</asp:TableHeaderCell>
                                         <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                                         <asp:TableHeaderCell>Fecha de Entrega</asp:TableHeaderCell>
                                     </asp:TableHeaderRow>
                                 </asp:Table>
                             </asp:Panel>
                         </div>
                    </div>
                    <!--  Fin de Informacion -->
                    
                    <div class="row" align="center">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:Button id="btnDocumento" runat="server" Text="Generar Documento"
                                    OnClick="GenerarDocumento" CssClass="btn btn-block btn-info"/>
                         </div>
                    </div>
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phNoRegistros" Visible="false">
                    <div class="row form-group">                        
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <strong>
                                <label>No existen registros para ese puesto de trabajo.</label>
                            </strong>
                        </div>
                    </div>
                </asp:PlaceHolder>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID = "btnDocumento"/>
            </Triggers>
        </asp:updatepanel>


</asp:Content>