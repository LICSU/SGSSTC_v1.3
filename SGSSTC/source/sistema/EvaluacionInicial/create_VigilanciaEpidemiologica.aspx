<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_VigilanciaEpidemiologica.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_VigilanciaEpidemiologica" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="../EvaluacionInicial/index_VigilanciaEpidemiologica.aspx">Vigilancia Epidemiologica</a></li>
            <li><a href="#">Crear Vigilancia Epidemiologica</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Vigilancia Epidemiologica</h1>
        </div>

        <asp:updatepanel runat="server">
            <ContentTemplate> 
                <div class="row form-group">
                    
                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-center">Año</h4>
                        <asp:DropDownList runat="server" id="ddlYear" class="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder> 

                    <div class="col-md-2">
                        <h4 class="text-center">&nbsp;</h4>
                        <asp:Button id="btnGenerar" Text="Generar Resultados" CssClass="btn btn-block btn-info"
                            OnClick="btnGenerarClic" runat="server"/>
                    </div>

                </div>

                    <asp:PlaceHolder runat="server" id="phInformacion" Visible="false">
                        <!-- Informacion -->
                        <div class="row form-group text-center">
                            <asp:Label runat="server" Text="" CssClass="h4" id="lblTotalTrab"></asp:Label>
                        </div>
                        <div class="row form-group">
                            <asp:Table runat="server" CssClass="table table-bordered" id="tbFuerzaLaboral">
                                <asp:TableHeaderRow CssClass="text-center">
                                    <asp:TableHeaderCell runat="server" id="lb1" Text="# DE ACCIDENTES DE TRABAJO"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb2" Text="# DE ACCIDENTES COMÚNES"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb3" Text="# DE ENFERMEDADES COMUNES"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb4" Text="# DE ENFERMEDADES DE POSIBLE ORIGEN OCUPACIONAL"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb5" Text="# DE ENFERMEDADES OCUPACIONALES"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb6" Text="# DE TRABAJADORES REFERENCIADOS A CENTROS ESPECIALIZADOS"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb7" Text="# DE TRABAJADORES CON DISCAPACIDAD"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb8" Text="RESULTADOS DE EVALUACIONES CLÍNICAS"></asp:TableHeaderCell>
                                    <asp:TableHeaderCell runat="server" id="lb9" Text="MONITOREO DE REPOSOS MÉDICOS"></asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow CssClass="text-center">
                                    <asp:TableCell><asp:Label runat="server" id="nroAccTrab" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroAccCom" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroEnfCom" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroEnfPOO" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroEnfOcu" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroTrabRef" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroTrabDis" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="nroResEvaCli" Text="0"></asp:Label></asp:TableCell>
                                    <asp:TableCell><asp:Label runat="server" id="monRepMed" Text="0"></asp:Label></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-8 col-md-offset-2">
                                <asp:Chart id="graficoFuerzaLab" runat="server" Height="466px" Width="800px" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="fuerzaLaboral" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <Area3DStyle Enable3D="true" WallWidth="0"/>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-6 text-center">
                                <asp:Label runat="server" id="lblResEvaCli" Text="Resultados de Evaluaciones Clínicas"></asp:Label>
                                <asp:Table runat="server" CssClass="table" id="Table1">
                                    <asp:TableHeaderRow CssClass="text-center">
                                        <asp:TableHeaderCell runat="server" id="cellEvaPreEmp" Text="Evaluación Pre empleo"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaPreVac" Text="Evaluación Pre vacacional"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaPosVac" Text="Evaluación Post vacacional"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaPer" Text="Evaluación Periódica"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaEsp" Text="Evaluación Especial"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaPosEmp" Text="Evaluación Post Empleo"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellEvaAsi" Text="Evaluación Asistencial o curativa"></asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow CssClass="text-center">
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaPreEmpV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaPreVacV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaPosVacV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaPerV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaEspV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaPosEmpV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellEvaAsiV" Text="0"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col-md-6 text-center">
                                <!-- Grafica -->
                                <asp:Chart id="graficaEvaCli" runat="server" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="serieEvaCli" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <Area3DStyle Enable3D="true" WallWidth="0"/>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-6 text-center">
                                <asp:Label runat="server" id="lblMonResMed" Text="Monitoreo de Reposos Médicos"></asp:Label>
                                <asp:Table runat="server" CssClass="table" id="Table2">
                                    <asp:TableHeaderRow CssClass="text-center">
                                        <asp:TableHeaderCell runat="server" id="cellNroRep" Text="N° de Reposos"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellDiaRep" Text="Días de Reposos"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellNroRepEnfCom" Text="N° de Reposos por Enfermedad Común"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellRepEnfOcu" Text="N° de Reposos Enfermedad Ocupacional"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell runat="server" id="cellRepAccCom" Text="N° de Reposos Accidente Común"></asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow CssClass="text-center">
                                        <asp:TableCell><asp:Label runat="server" id="cellNroRepV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellDiaRepV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellNroRepEnfComV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellRepEnfOcuV" Text="0"></asp:Label></asp:TableCell>
                                        <asp:TableCell><asp:Label runat="server" id="cellRepAccComV" Text="0"></asp:Label></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                            <div class="col-md-6 text-center">
                                <!-- Grafica -->
                                <asp:Chart id="graficaRepMed" runat="server" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="serieRepMed" CustomProperties="DrawingStyle=Cylinder"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                             <Area3DStyle Enable3D="true" WallWidth="0"/>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-6 text-center">
                                <asp:Label runat="server" id="Label14" Text="Diagnósticos presentes en los Trabajadores"></asp:Label>
                                <asp:Panel id="pnGraficaEnf" runat="server"></asp:Panel>

                            </div>
                            <div class="col-md-6 text-center">
                                <asp:Label runat="server" id="Label15" Text="Sistema Orgánico Afectado"></asp:Label>
                                <asp:Panel id="pnGraficaSis" runat="server"></asp:Panel>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-6 text-center">
                                <!-- Grafica -->
                                <asp:Chart id="graficaDiagnostico" runat="server" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="serieDiag1" LegendText="Trabajadores Atendidos" YValuesPerPoint="1"></asp:Series>
                                        <asp:Series Name="serieDiag2" LegendText="Trabajadores con Reposo" YValuesPerPoint="1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="LegendDiag"> 
                                            <Position Height="12.70903" Width="50" X="50"/>
                                        </asp:Legend>
                                    </Legends>
                                </asp:Chart>
                            </div>
                            <div class="col-md-6 text-center">
                                <!-- Grafica -->
                                <asp:Chart id="graficaSistema" runat="server" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="serieSist1" LegendText="Trabajadores Atendidos" YValuesPerPoint="1"></asp:Series>
                                        <asp:Series Name="serieSist2" LegendText="Trabajadores con Reposo" YValuesPerPoint="1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                    <Legends>
                                        <asp:Legend Name="LegendSis">
                                            <Position Height="12.70903" Width="50" X="50"/> 
                                        </asp:Legend>
                                    </Legends>
                                </asp:Chart>
                            </div>
                        </div>
                        <div class="row" align="center">                        
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
                                <strong><label>No existen trabajadores con reposos registrados.</label></strong>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                  </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger Controlid="btnGuardar"/>
                </Triggers>
            </asp:updatepanel>

    </div>

    </asp:Content>