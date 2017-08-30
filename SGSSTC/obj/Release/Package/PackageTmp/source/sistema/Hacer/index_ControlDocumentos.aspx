<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ControlDocumentos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ControlDocumentos" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    
    <div class="container" style="width: 100%;">
        
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Control De Documentos</a></li>
            </ol>
            
            <div class="page-header">
                <h1 class="text-center">Control De Documentos</h1>
            </div>  

            <div class="box">


                <div class="box-body no-padding">
                    <table class="table table-condensed" style="overflow: scroll;">
                        <tbody>

                            <tr class="bg-aqua color-palette">
                                <th class="col-md-1 text-center">N°</th>
                                <th class="col-md-5 text-center">TIPO DE DOCUMENTO</th>
                                <th class="col-md-2 text-center">RESPONSABLE</th>
                                <th class="col-md-2 text-center">REVISADO POR</th>
                                <th class="col-md-2 text-center">APROBADO</th>
                                <th class="col-md-2 text-center"></th>
                            </tr>

                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="1" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Política de SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox1" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox2" runat="server"></asp:textbox>
                                    </t>
                                    <th class="text-center">
                                        <asp:checkbox id="Checkbox1" runat="server"></asp:checkbox>
                                    </th>
                                <th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="2" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Documentos para la divulgación de la Política ( Trípticos, Publicaciones en Carteleras o cualquier otro medio informativo)" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox3" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox4" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox2" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_ComunicacionPoliticaSST.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="3" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Encuestas para validar que el personal haya conocido y comprendido la Política del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox5" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox6" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox3" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_Encuesta_PoliticaSST.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="4" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Evaluación Inicial del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox7" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox8" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox4" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../EvaluacionInicial/index_AutoEvaluacion.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="5" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Descripción del Alcance del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox9" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox10" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox5" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="6" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Objetivos de Seguridad y Salud en el Trabajo" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox11" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox12" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox6" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_Politica_SST.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="7" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Descripción de la Estructura PHVA del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox13" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox14" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox7" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_EstructuraPHVA.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="8" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Caracterización de Procesos del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox15" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox16" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox8" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="9" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Inspecciones de Seguridad" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox17" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox18" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox9" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../EvaluacionInicial/index_Inspecciones.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="10" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Acciones preventivas, correctivas y de mejoras generadas en las inspecciones de seguridad." font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox19" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox20" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox10" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="11" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Establecimiento de Indicadores de Medición del SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox21" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox22" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox11" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="12" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Normas y Reglamentos Internos de la Organización" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox23" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox24" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox12" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="13" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan de Trabajo Anual" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox25" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox26" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox13" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="14" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="No conformidades detectadas en el seguimiento al plan de trabajo anual en Seguridad y Salud en el Trabajo" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox27" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox28" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox14" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="15" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Matriz Legal Actualizada en relación a toda la normatividad legal vigente aplicable en materia de SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox29" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox30" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox15" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_MatrizLegal.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="16" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Documentar los Requisitos concretos que hay que cumplir ( Generales y Específicos)" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox31" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox32" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox16" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="17" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Actualización de la Normativa que Sustituye, Reemplaza o Corrige la Existente" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox33" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox34" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox17" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="18" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Matriz de Peligros, Evaluación y Valoración de los riesgos Actualizada acorde a los peligros y priorización de riesgos de la organización" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox35" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox36" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox18" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_MatrizRiesgos.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="19" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Resultados de las Evaluaciones de Riesgo " font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox37" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox38" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox19" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="20" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Medidas de Seguimiento y Control de Riesgos" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox39" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox40" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox20" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="21" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Reportes de las Condiciones de Trabajo peligrosas realizadas por los trabajadores" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox41" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox42" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox21" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="22" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan de Acción ( Recursos y Plazos para alcanzar los objetivos planteados)" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox43" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox44" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox22" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="23" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Manual y Programas de Seguridad y Salud en el Trabajo" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox45" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox46" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox23" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="24" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan de Inducción" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox47" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox48" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox24" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="25" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Constancia de Registro de la Inducción ( información de de las condiciones inseguras o insalubres y riesgos a los que estará expuesto el trabajador  y los daños que puede causar a la salud" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox49" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox50" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox25" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="26" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan para la Prevención y Atención de Emergencias en la organización" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox51" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox52" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox26" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="27" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Mapas de Riesgo Actualizados" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox53" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox54" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox27" runat="server"></asp:checkbox>
                                </th>
                                <th class="text-center"><a href="../Hacer/index_MapaRiesgos.aspx">Enlace</a></th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="28" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Registro de Mapas de Ubicación de Extintores, Lámparas de Emergencia  y Sistemas de Alarma contra Incendio, Planos de Evacuación" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox55" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox56" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox28" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="29" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan de Capacitación en Seguridad y Salud en el Trabajo" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox57" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox58" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox29" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="30" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Registro de Capacitaciones" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox59" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox60" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox30" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="31" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Reporte e investigación de los incidentes, accidentes de trabajo " font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox61" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox62" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox31" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="32" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Registro estadístico de  accidentes e incidentes de trabajo" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox63" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox64" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox32" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="33" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Investigación de Accidentes e Incidentes" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox65" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox66" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox33" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="34" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Acciones preventivas, correctivas y de mejora, generadas en las investigaciones de los incidentes, accidentes y enfermedades laborales" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox67" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox68" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox34" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="35" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Actas de reunión mensual  del Comité Paritario de Seguridad y Salud en el Trabajo acorde al tamaño de la organización" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox69" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox70" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox35" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="36" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Programas de Vigilancia Epidemiológica de acuerdo con el análisis de las condiciones de salud y de trabajo y a los riesgos priorizados" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox71" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox72" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox36" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="37" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Plan de Equipos de Protección Personal ( Selección y Dotación de Epp)" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox73" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox74" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox37" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="38" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Evidencias del Registro de Entrega de Equipos de Protección Personal" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox75" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox76" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox38" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="39" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Programación de Selección y Evaluador de Proveedores" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox77" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox78" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox39" runat="server"></asp:checkbox>
                                </th>
                            </tr>
                            <tr>
                                <th class="text-center">
                                    <asp:label runat="server" text="40" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-left">
                                    <asp:label runat="server" text="Auditoria y Revisión por la Alta Dirección al SG-SST" font-size="Smaller"></asp:label>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox79" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:textbox id="Textbox80" runat="server"></asp:textbox>
                                </th>
                                <th class="text-center">
                                    <asp:checkbox id="Checkbox40" runat="server"></asp:checkbox>
                                </th>
                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>

        <div class="row" align="center">

            <div class="col-md-4 col-md-offset-2">
                <asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
                    onclick="GenerarDocumento"/>
                <h4>Generar Documento</h4>
            </div>

        </div>

    </div>

</asp:Content>