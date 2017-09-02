<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_EvaluacionPuesto.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.View_EvaluacionPuesto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="../Hacer/index_EvaluacionRiesgo.aspx">Evaluación de Riesgo Laboral</a></li>
                    <li><a href="#">Crear Evaluación</a></li>
                </ol>
                
                <div class="page-header">
                   <h1 class="text-center">Nueva Evaluación de Riesgo Laboral</h1>
                </div>
                
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Sucursal</h4>
                        <asp:Label runat="server" id="txtSucursal"></asp:Label>
                    </div>
                    
                    <div class="col-md-4">
                        <h4>Área</h4>
                        <asp:Label runat="server" id="txtArea"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Puesto de Trabajo</h4>
                        <asp:Label runat="server" id="txtPuestos"></asp:Label>
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4>Descripción Puesto de Trabajo</h4>
                        <asp:Label runat="server" id="txtDescripcionPuesto"></asp:Label>
                    </div>
                </div>
                <br />
                
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-center">Identificación del Peligro</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Tipo de Riesgo</h4>
                        <asp:Label id="txtTipoRiesgo" runat="server"></asp:Label>

                    </div>
                    <div class="col-md-4">
                        <h4>Factor de Riesgo</h4>
                        <asp:Label id="txtFactorRiesgo" type="date" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Posibles Consecuencias</h4>
                        <asp:Label id="txtConsecuencias" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Tiempo de Exposición</h4>
                        <asp:Label id="txtTiempoExposicion" runat="server"></asp:Label>

                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-center">Evaluación del Riesgo</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h4>Medidas en la Fuente</h4>
                        <asp:Label id="txtControlFuente" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Medidas en el Medio</h4>
                        <asp:Label id="txtControlMedio" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Medidas en el Individuo</h4>
                        <asp:Label id="txtControlIndividuo" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Responsable del SGSST</h4>
                        <asp:Label id="txtResponsableSGSST" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Fecha de Evaluación</h4>
                        <asp:Label id="txtFechaEvaluacion" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <h4>Nivel de Deficiencia</h4>
                        <asp:Label id="txtNivelDeficiencia" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-justify">Interpretación del Nivel de Deficiencia</h4>
                        <asp:Label id="txtInterpretacionNivelDeficiencia" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <h4>Nivel de Exposición</h4>
                        <asp:Label id="txtNivelExposicion" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-justify">Interpretación del Nivel de Exposición</h4>
                        <asp:Label id="txtInterpretacionNivelExposicion" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <h4>Nivel de Probabilidad</h4>
                        <asp:Label id="txtNivelProbabilidad" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-justify">Interpretación del Nivel de Probabilidad</h4>
                        <asp:Label id="txtInterpretacionNivelProbabilidad" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <h4>Nivel de Consecuencia</h4>
                        <asp:Label id="txtNivelConsecuencia" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-justify">Interpretación del Nivel de Consecuencia</h4>
                        <asp:Label id="txtInterpretacionNivelConsecuencia" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-3 col-md-offset-2">
                        <h4>Nivel de Riesgo</h4>
                        
                        <asp:Label id="txtNivelRiesgo" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-justify">Interpretación del Nivel de Riesgo</h4>
                        <asp:Label id="txtInterpretacionNivelRiesgo" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4>Aceptabilidad de Riesgo</h4>
                        
                        <asp:Label id="txtAceptabilidadRiesgo" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-center">Criterios para Establecer Controles</h3>
                    </div>
                </div>
                <br />

                <div class ="row">
                    <h3 class="text-center">N° Personal Expuesto</h3>
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Planta</h4>
                        <asp:Label id="txtPlanta" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Contratistas</h4>
                        <asp:Label id="txtContratistas" runat="server"></asp:Label>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Visitantes</h4>
                        <asp:Label id="txtVisitantes" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h4>Total</h4>
                        <asp:Label id="txtTotalPersonalExpuesto" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4>Peor Consecuencia</h4>
                        <asp:Label id="txtPeorConsecuencia" runat="server"></asp:Label>
                    </div>
                </div>
                <hr />

                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-center">Medidas de Intervención</h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Eliminación</h4>
                        <asp:Label id="txtEliminación" runat="server"></asp:Label>
                    </div>

                    <div class="col-md-4">
                        <h4>Sustitución</h4>
                        <asp:Label id="txtSustitución" runat="server"></asp:Label>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4>Controles de Ingeniería</h4>
                        <asp:Label id="txtIngenieria" runat="server"></asp:Label>
                    </div>
                    
                    <div class="col-md-4">
                        <h4>Controles Administrativos</h4>
                        <asp:Label id="txtAdministrativos" runat="server"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Fecha de Ejecución</h4>
                        <asp:Label id="txtFechaEjecucion" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                <hr />

                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="text-center">Equipos de Proteccion Personal del Puesto de Trabajo</h3>
                    </div>
                    
                    <asp:Label id="txtEpp" runat="server"></asp:Label>
                </div>
                <br />
                <hr />
                
                <!-- Boton-->
                <div class="row">                    
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" id="Button2" Text="Volver" class="btn btn-block btn-primary" 
                            OnClick="Volver"></asp:Button>
                    </div>
                </div>
                <br />

            

        </ContentTemplate>
    </asp:updatepanel>
</asp:Content>