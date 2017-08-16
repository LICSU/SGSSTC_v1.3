﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionExtintores.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionExtintores" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="//www.google.com/jsapi"></script>
        
        

            <ol class="breadcrumb">
                <li><a href="#">Fase: Evaluación Inicial</a></li>
                <li><a href="../EvaluacionInicial/index_Inspecciones.aspx">Inspecciones</a></li>
                <li><a href="#">Crear Inspección de Extintores</a></li>
            </ol>
            
            <div class="page-header">
                 <h1 class="text-center">Inspección de Extintores</h1>
            </div>
            
            <asp:UpdatePanel  id="MyUpdatePanel" runat="server" updatemode="Always">
                <ContentTemplate>
                    
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
                            <h4 class="text-center">Area</h4>
                            <asp:DropDownList runat="server" id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>

                        </div>
                        
                        <div class="col-md-3">
                            <h4 class="text-center">Extintor</h4>
                            <asp:DropDownList runat="server" id="ddlExtintor" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlExtintor_SelectedIndexChanged"></asp:DropDownList>

                        </div>
                    </div>
                    
                    <asp:PlaceHolder runat="server" id="phInformacion" Visible="false"> 
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                
                                <asp:Table runat="server" id="tbl_extintor" CssClass="table">

                                    <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                        <asp:TableHeaderCell CssClass="text-center">CARATERÍSTICA A INSPECCIONAR</asp:TableHeaderCell>
                                        <asp:TableHeaderCell CssClass="text-center" ColumnSpan="2">OBSERVACIONES</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    
                                    <asp:TableRow>
                                        <asp:TableCell><strong>ESPECIFICACIONES DEL EXTINTOR</strong></asp:TableCell>
                                        <asp:TableCell  ColumnSpan="2">
                                            <asp:Table id="Table1" runat="server">
                                                <asp:TableRow>
                                                    <asp:TableCell><strong>Área de ubicación: </strong></asp:TableCell>
                                                    <asp:TableCell CssClass="text-right"><asp:Label runat="server" id="lblArea"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><strong>Peso: </strong></asp:TableCell>
                                                    <asp:TableCell CssClass="text-right"><asp:Label runat="server" id="lblPeso"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><strong>Extintor: </strong></asp:TableCell>
                                                    <asp:TableCell CssClass="text-right"><asp:Label runat="server" id="lblAgenteExt"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><strong>Presión: </strong></asp:TableCell>
                                                    <asp:TableCell CssClass="text-right"><asp:Label runat="server" id="lblPresion"></asp:Label></asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Serial: </strong></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:Label runat="server" id="lblNroExtintor"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Fecha Ultima Recarga: </strong></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:Label runat="server" id="lblFechaUltimaRecarga"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Fecha Proxima Recarga: </strong></asp:TableCell>
                                        <asp:TableCell CssClass="text-center"><asp:Label runat="server" id="lblFechaProximaRecarga"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Accesibilidad: </strong></asp:TableCell>
                                        <asp:TableCell><asp:TextBox runat="server" id="txtAccesibilidad" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Condiciones del Cilindro: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblCondiciones" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Soporte del extintor: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblSoporteExt" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Soporte de la manguera: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblSoporteMan" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Marcación: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblMarcacion" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Precintos y sellos de seguridad: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblPrecintos" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Manómetro: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblManometro" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Conjunto manguera: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblConjuntoMan" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Asa de acarreo: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblAsaAcarreo" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Válvula de acción instantánea: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblValbulaAcc" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Válvula de presurización: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblValvulaPre" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Válvula de dispersión: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblValvulaDis" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Mecanismo de punzado: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblMecanismoPun" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Tapa del cilindro: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblTapaCil" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="APTO" Value="APTO" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO APTO" Value="NO APTO"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell><strong>Señalización y Demarcación: </strong></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:RadioButtonList id="rblSenalizacion" RepeatColumns="2" runat="server">
                                                <asp:ListItem Text="EXISTE" Value="EXISTE" style="margin-right:15px;"></asp:ListItem>
                                                <asp:ListItem Text="NO EXISTE" Value="NO EXISTE"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                    
                    <asp:PlaceHolder runat="server" id="phNoRegistros" Visible="false">
                        <div class="row form-group">
                            <div class="col-md-8 col-md-offset-2 text-center">
                                <strong><label>No existen trabajadores con reposos registrados.</label></strong>
                            </div>
                        </div>
                    </asp:PlaceHolder>

                    <div class="row" align="center">
                        <asp:PlaceHolder runat="server" id="phBotones" Visible="false">
                        <div class="col-md-4">
                            <asp:ImageButton alt="-" id="btnDescargar" runat="server" ImageUrl="~\ico\descargar.png" 
                                OnClick="btnDescargar_Onclick"/><br />
                            <h4>Descargar Formato de Inspecciones</h4>
                        </div>

                        <div class="col-md-4">
                                <asp:ImageButton alt="-" id="btnGuardar" runat="server" ImageUrl="~\ico\print.png" 
                                    OnClick="GenerarDocumento"/>
                                <h4>Generar Documento</h4>
                            </div>
                        </asp:PlaceHolder>
                    </div>
                
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger Controlid="btnDescargar"/>
                    <asp:PostBackTrigger Controlid="btnGuardar"/>
                </Triggers>
            </asp:UpdatePanel>
            
        </div>

</asp:Content>