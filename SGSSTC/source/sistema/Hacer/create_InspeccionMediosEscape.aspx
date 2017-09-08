<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionMediosEscape.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionMediosEscape" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"   Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>


        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_Inspecciones.aspx">Inspecciones</a></li>
            <li><a href="#">Crear Inspección de Medios de Escape</a></li>
        </ol>

        <div class="page-header">
             <h1 class="text-center">Inspección de Medios de Escape</h1>
         </div>

        <asp:updatepanel runat="server">
            <ContentTemplate>
                
                <div class="row form-group"> 

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                    
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3 col-md-offset-2">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                </div>
                
                <asp:PlaceHolder runat="server" id="phInformacion" Visible="False">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <asp:Table runat="server" id="tbl_medios_escape" CssClass="table">
                                    <asp:TableHeaderRow CssClass="text-center">
                                        <asp:TableHeaderCell  CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">LAMPARAS DE EMERGENCIA</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell >AREA DE UBICACIÓN</asp:TableHeaderCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-paletter" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Estado de Conservación</asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstadoLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstadoLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstadoLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstadoLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstadoLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Fuentes de iluminación</asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsFuenteLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsFuenteLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsFuenteLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsFuenteLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsFuenteLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Señalización</asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsMarcaLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsMarcaLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsMarcaLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsMarcaLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsMarcaLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Luces de Operación</asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsLucesLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsLucesLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsLucesLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsLucesLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsLucesLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Cajetín</asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsCajetLamp1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsCajetLamp2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsCajetLamp3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsCajetLamp4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsCajetLamp5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableHeaderRow CssClass="text-center">
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">SEÑALIZACIÓN DE SEGURIDAD</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>AREA DE UBICACIÓN</asp:TableHeaderCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Existencia </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsExiSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsExiSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsExiSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsExiSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsExiSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Estado de Conservación </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Señal </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsSenaSena1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsSenaSena2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsSenaSena3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsSenaSena4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsSenaSena5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableHeaderRow CssClass="text-center">
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="6">PASILLOS Y ESCALERAS</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell>AREA DE UBICACIÓN</asp:TableHeaderCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="text-center panel-heading bg-teal color-palette" ColumnSpan="5">OBSERVACIONES</asp:TableHeaderCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Estado de conservación </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsEstPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Accesibilidad </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAccPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAccPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAccPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAccPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAccPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>Ausencia de obstáculos </asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAusPasi1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAusPasi2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAusPasi3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAusPasi4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtObsAusPasi5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>

                        <div class="row text-center>                        
                            <div class="col-md-4 col-md-offset-2">
                                <asp:ImageButton alt="-" id="btnGuardar" runat="server" ImageUrl="~\ico\print.png" 
                                    OnClick="GenerarDocumento"/>
                                <h4>Generar Documento</h4>
                            </div>
                        </div>
                         <!--  Fin de Informacion -->

                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" id="phNoRegistros" Visible="false">
                        <div class="row form-group">
                            <div class="col-md-8 col-md-offset-2 text-center">
                                <h4><strong>No existen trabajadores con reposos registrados.</strong></h4>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                  </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger Controlid="btnGuardar"/>
                </Triggers>
            </asp:updatepanel>

</asp:Content>