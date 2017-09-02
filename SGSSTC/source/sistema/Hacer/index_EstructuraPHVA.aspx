<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_EstructuraPHVA.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_EstructuraPHVA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="#">Estructura PHVA</a></li>
        </ol>

        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <!-- Evaluacion inicial-->
                <div class="panel-heading bg-teal color-palette">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">EVALUACION INICIAL</a></h4>
                </div>
                <div id="collapse1" class="panel-collapse collapse">

                    <div class="panel-body">
                        <div class="row text-center">
                            <div class="box">
                                <div class="box-body no-padding">
                                    <table class="table table-condensed" style="overflow: scroll;">

                                        <tbody>

                                            <tr class="bg-green color-palette">
                                                <th class="col-md-1 text-center">N°</th>
                                                <th class="col-md-11  text-left">MODULO</th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label1" runat="server" text="1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label2" runat="server" text="Documento de Autoevaluación" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label3" runat="server" text="2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label4" runat="server" text="Análisis de vulnerabilidad" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label5" runat="server" text="3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label6" runat="server" text="Descripción Sociodemográfica" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label7" runat="server" text="4" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label8" runat="server" text="Indicadores de la Empresa" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label9" runat="server" text="5" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label10" runat="server" text="Inspecciones de seguridad" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label11" runat="server" text="6" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label12" runat="server" text="Matriz Legal" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label13" runat="server" text="7" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label14" runat="server" text="Matriz de Riesgos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label15" runat="server" text="8" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label16" runat="server" text="Plan de Emergencias" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label17" runat="server" text="9" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label18" runat="server" text="Plan de trabajo anual" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label19" runat="server" text="10" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label20" runat="server" text="Porcentaje de cumplimiento de Capacitaciones" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label21" runat="server" text="11" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label22" runat="server" text="Reportes de Accidentes" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label23" runat="server" text="12" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label24" runat="server" text="Reportes de los trabajadores" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label25" runat="server" text="13" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label26" runat="server" text="Vigilancia Epidemiológica" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Planear-->
                <div class="panel-heading bg-teal color-palette">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">PLANEAR</a></h4>
                </div>
                <div id="collapse2" class="panel-collapse collapse">

                    <div class="panel-body">
                        <div class="row text-center">
                            <div class="box">
                                <div class="box-body no-padding">
                                    <table class="table table-condensed" style="overflow: scroll;">

                                        <tbody>

                                            <tr class="bg-green color-palette">
                                                <th class="col-md-1 text-center">N°</th>
                                                <th class="col-md-11  text-left">MODULO</th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label27" runat="server" text="1"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label28" runat="server" text="Liderazgo y compromiso"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label29" runat="server" text="1.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label30" runat="server" text="Política SST" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label31" runat="server" text="1.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label32" runat="server" text="Encuesta de Conocimiento de la Política de SST" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label33" runat="server" text="1.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label34" runat="server" text="Encuesta de Conocimiento de los Objetivos de SST" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label35" runat="server" text="1.4" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label36" runat="server" text="Indicadores definidos por la Empresa" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label37" runat="server" text="1.5" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label38" runat="server" text="Recursos Económicos aprobados por la Gerencia" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label39" runat="server" text="1.6" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label40" runat="server" text="Acta de Reunión de Copasst" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label41" runat="server" text="2"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label42" runat="server" text="Administración de la Documentación"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label43" runat="server" text="2.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label44" runat="server" text="Control de Documentos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label45" runat="server" text="2.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label46" runat="server" text="Mecanismos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label47" runat="server" text="3"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label48" runat="server" text="Funciones, responsabilidades y competencias"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label49" runat="server" text="3.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label50" runat="server" text="Matriz de Responsabilidades y competencias" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label51" runat="server" text="3.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label52" runat="server" text="Evaluación del desempeño" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label53" runat="server" text="4"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label54" runat="server" text="Capacitación y entrenamiento"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label55" runat="server" text="4.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label56" runat="server" text="Plan de Capacitación, Matriz de Capacitación" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label57" runat="server" text="4.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label58" runat="server" text="Programa de Inducción y reinducción" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label59" runat="server" text="5"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label60" runat="server" text="Identificación de peligros"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label61" runat="server" text="5.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label62" runat="server" text="Metodología para la identificación de riesgos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label63" runat="server" text="5.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label64" runat="server" text="Matriz de Riesgos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label65" runat="server" text="6"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label66" runat="server" text="Requisitos Legales"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label67" runat="server" text="6.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label68" runat="server" text="Matriz Legal" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label69" runat="server" text="6.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label70" runat="server" text="Reglamento Higiene y Salud" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>



                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Hacer-->
                <div class="panel-heading bg-teal color-palette">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">HACER</a></h4>
                </div>
                <div id="collapse3" class="panel-collapse collapse">

                    <div class="panel-body">
                        <div class="row text-center">
                            <div class="box">
                                <div class="box-body no-padding">
                                    <table class="table table-condensed" style="overflow: scroll;">

                                        <tbody>

                                            <tr class="bg-green color-palette">
                                                <th class="col-md-1 text-center">N°</th>
                                                <th class="col-md-11  text-left">MODULO</th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label71" runat="server" text="1"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label72" runat="server" text="Control Operacional"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label73" runat="server" text="1.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label74" runat="server" text="Procedimientos operativos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label75" runat="server" text="2"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label76" runat="server" text="Seguridad y Salud en el Trabajo"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label77" runat="server" text="2.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label78" runat="server" text="Plan Anual de Trabajo" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label79" runat="server" text="2.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label80" runat="server" text="Programa de Inspecciones" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label81" runat="server" text="2.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label82" runat="server" text="Programa EPP" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label83" runat="server" text="2.4" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label84" runat="server" text="Inventario EPP" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label85" runat="server" text="2.5" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label86" runat="server" text="Planilla Entrega de Epp" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label87" runat="server" text="2.6" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label88" runat="server" text="Inspección para el Control y uso de EPP" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label89" runat="server" text="2.7" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label90" runat="server" text="Señalización" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label91" runat="server" text="2.8" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label92" runat="server" text="Programa de Vigilancia Epidemiológica" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label93" runat="server" text="2.9" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label94" runat="server" text="Vigilancia Epidemiológica" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label95" runat="server" text="2.10" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label96" runat="server" text="Riesgos" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label97" runat="server" text="3"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label98" runat="server" text="Comunicación, Participación y Consulta"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label99" runat="server" text="3.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label100" runat="server" text="Plan de Comunicaciones" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label101" runat="server" text="3.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label102" runat="server" text="Programa de motivación en SST" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label103" runat="server" text="4"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label104" runat="server" text="Prevención y respuesta ante emergencias"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label105" runat="server" text="4.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label106" runat="server" text="Plan de prevención" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label107" runat="server" text="4.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label108" runat="server" text="Plan de ayuda mutua" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label109" runat="server" text="4.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label110" runat="server" text="Programa de simulacros" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label111" runat="server" text="4.4" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label112" runat="server" text="Brigadas de emergencia" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label113" runat="server" text="5"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label114" runat="server" text="Gestión del cambio"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label115" runat="server" text="5.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label116" runat="server" text="Programa del gestión del cambio" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label117" runat="server" text="6"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label118" runat="server" text="Adquisiciones"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label119" runat="server" text="6.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label120" runat="server" text="Programa de selección y evaluación de proveedores" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label121" runat="server" text="7"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label122" runat="server" text="Administración de contratistas"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label123" runat="server" text="7.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label124" runat="server" text="Manual de contratistas y proveedores" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label125" runat="server" text="8"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label126" runat="server" text="Obligaciones"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label127" runat="server" text="9"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label128" runat="server" text="Alarmas"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label129" runat="server" text="10"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label130" runat="server" text="Exámenes Laborales"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label131" runat="server" text="11"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label132" runat="server" text="Gestiones Laborales"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label133" runat="server" text="12"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label134" runat="server" text="Mapa de Riesgos"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label135" runat="server" text="13"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label136" runat="server" text="Gestión de Datos"></asp:label>
                                                </th>
                                            </tr>



                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Verificar-->
                <div class="panel-heading bg-teal color-palette">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">VERIFICAR</a></h4>
                </div>
                <div id="collapse4" class="panel-collapse collapse">

                    <div class="panel-body">
                        <div class="row text-center">
                            <div class="box">
                                <div class="box-body no-padding">
                                    <table class="table table-condensed" style="overflow: scroll;">

                                        <tbody>

                                            <tr class="bg-green color-palette">
                                                <th class="col-md-1 text-center">N°</th>
                                                <th class="col-md-11  text-left">MODULO</th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label137" runat="server" text="1"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label138" runat="server" text="Auditoria de cumplimiento del SGSST"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label139" runat="server" text="1.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label140" runat="server" text="Programa de auditoria" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label141" runat="server" text="1.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label142" runat="server" text="Planificación" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label143" runat="server" text="2"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label144" runat="server" text="Revisión por la alta dirección"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label145" runat="server" text="2.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label146" runat="server" text="Comité de la alta dirección" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label147" runat="server" text="3"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label148" runat="server" text="Investigación de Incidentes Accidentes y Enfermedades Laborales"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label149" runat="server" text="3.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label150" runat="server" text="Procedimiento de investigación de Accidentes e Incidentes" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label151" runat="server" text="3.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label152" runat="server" text="Accidentes Laborales" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label153" runat="server" text="3.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label154" runat="server" text="Incidentes Laborales" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label155" runat="server" text="3.4" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label156" runat="server" text="Lecciones aprendidas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label157" runat="server" text="4"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label158" runat="server" text="Registro de Transacciones"></asp:label>
                                                </th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Actuar-->
                <div class="panel-heading bg-teal color-palette">
                    <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">ACTUAR</a></h4>
                </div>
                <div id="collapse5" class="panel-collapse collapse">

                    <div class="panel-body">
                        <div class="row text-center">
                            <div class="box">
                                <div class="box-body no-padding">
                                    <table class="table table-condensed" style="overflow: scroll;">

                                        <tbody>

                                            <tr class="bg-green color-palette">
                                                <th class="col-md-1 text-center">N°</th>
                                                <th class="col-md-11  text-left">MODULO</th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label159" runat="server" text="1"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label160" runat="server" text="Acciones correctivas y preventivas"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label161" runat="server" text="1.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label162" runat="server" text="Instructivo para las acciones preventivas y correctivas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>

                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label163" runat="server" text="1.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label164" runat="server" text="Análisis de causalidad" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label165" runat="server" text="1.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label166" runat="server" text="Formato de acciones preventivas y acciones correctivas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label167" runat="server" text="2"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label168" runat="server" text="Mejora continua"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label169" runat="server" text="2.1" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label170" runat="server" text="Revisión de las acciones correctivas o preventivas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label171" runat="server" text="2.2" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label172" runat="server" text="Comunicación de resultados de las acciones preventivas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:label id="label173" runat="server" text="2.3" font-size="Smaller"></asp:label>
                                                </th>
                                                <th class="text-left">
                                                    <asp:label id="label174" runat="server" text="omunicación de resultados de las acciones correctivas" font-size="Smaller"></asp:label>
                                                </th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    <div class="row" align="center">
        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
                onclick="GenerarDocumento"/>
            <h4>Generar Documento</h4>
        </div>
    </div>

</asp:Content>