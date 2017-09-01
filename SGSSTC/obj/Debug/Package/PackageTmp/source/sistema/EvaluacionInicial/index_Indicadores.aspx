<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Indicadores.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_Indicadores" %>


<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
        <ContentTemplate>

            <div class="container" style="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Evaluación Inicial</a></li>
                    <li><a href="#">Indicadores</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Indicadores Definidos por la Empresa</h1>
                </div>
            
                <div class="row">                
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4 col-md-offset-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                        <div class="col-md-4">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    </asp:PlaceHolder>
                </div>
                
                <br />

                <div class="row text-center">
                    <div class="box">
                        <div class="panel-group" id="accordion">
                    
                            <!-- Primer Panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">INDICADOR DE ESTRUCTURA</a>
                                    </h4>
                                </div>
                        
                                <div id="collapse1" class="panel-collapse collapse">
                                    <div class="panel-body">                                
                                        <div class="box-body no-padding">                                    
                                            <table class="table table-condensed" style="overflow: scroll;">
                                                <tbody>                                            
                                                    <!-- fila 1 -->
                                                    <tr class="bg-aqua color-palette">
                                                        <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                        <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                        <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                        <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                        <th class="col-md-1 text-center">RESPONSABLE</th>
                                                        <th class="col-md-1 text-center">FRECUENCIA</th>
                                                        <th class="col-md-1 text-center">UNIDAD</th>
                                                        <th class="col-md-1 text-center">META</th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Política de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existe el documento de la Política de SST y está firmada, divulgada y fechada." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Documento de la Política de SST firmada y fechada." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist id="resultado1" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Compromiso de la Organización" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Evidenciar el compromiso de la Empresa con la Seguridad y Salud en el Trabajo a través de la declaración de la Política" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="La política incluya objetivos específicos en materia de SST de acuerdo a los riesgos, cumpliendo con la normatividad y garantizando la mejora continua " Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Inspeccionar la inclusión de los requerimientos en el documento de la política" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento total" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist id="resultado2" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Política de  SST, comunicada." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="La Política de SST ha sido difundida al __% de los trabajadores." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Número de trabajadores que conocen la Política de SST / Número total de Trabajadores ) X 100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Encuesta realizada a una muestra de trabajadores en donde se evalúan los conocimientos respecto a la política de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="100% de los Trabajadores" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de trabajadores que conocen la Política SST
                                                                <asp:textbox  id="Textbox1" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox1_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número total de Trabajadores<br />
                                                                <asp:label id="Label1" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado3" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Objetivos y metas, divulgados" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Los objetivos y metas de seguridad  se encuentran escritos y divulgados." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Número de Trabajadores que conocen los Objetivos y metas de seguridad informados por escrito /Número total de Trabajadores ) X 100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Encuesta realizada a una muestra de trabajadores en donde se evalúan los conocimientos respecto a los objetivos de la política de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Mensual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="100% de los Trabajadores" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de Trabajadores que conocen los Objetivos y Metas de seguridad informados por escrito
                                                                <asp:textbox  id="Textbox2" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox2_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número total de Trabajadores<br />
                                                                <asp:label id="Label2" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado4" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Evaluación Inicial del SGSST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existe un Formato para la Evaluación Inicial del SGSST con los criterios contemplados en el Decreto 1072 en su Artículo 2.2.4.6.16" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Formato para la Evaluación Inicial del SGSST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST Gerencia" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist   id="resultado5" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Plan de trabajo anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Establecer un Plan Anual de Trabajo en Seguridad y Salud en el Trabajo que evidencie el compromiso gerencial." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia del documento de plan de trabajo firmado por el Representante Legal." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST Gerencia" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist   id="resultado6" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Existe" Value="Existe"></asp:ListItem>
                                                                    <asp:ListItem Text="No Existe" Value="No Existe"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Responsabilidades" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Asignación de responsabilidades a los distintos niveles de la empresa frente al desarrollo del Sistema de Gestión de la Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(N° total de Jefes con delegación de responsabilidad en SST/Total de Jefes de la estructura) x100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="100 % de Compromiso en todos los Niveles" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° total de Jefes con delegación de responsabilidad en SST
                                                                <asp:textbox  id="Textbox3" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox3_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Total de Jefes de la estructura
                                                                <asp:textbox  id="Textbox4" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox3_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado7" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Identificación de peligros y riesgos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Método definido para la identificación de peligros" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existe un Método definido para la identificación de peligros." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Identificación de peligros realizado" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist  id="resultado8" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Reporte de las condiciones inseguras" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Instrumento para que los trabajadores reporten las condiciones de trabajo peligrosas" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existe un instrumento o formato para que los trabajadores reporten las condiciones de trabajo inseguras" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia del Reporte" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist  id="resultado9" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia del COPASST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="La empresa cuenta con un COPASST en funcionamiento y con delegación de funciones." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist  id="resultado10" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Funcionamiento del Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Número de reuniones anuales del Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Nº de Reuniones ordinarias realizadas del Copasst/ 12) x 100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Copasst" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Número de reuniones anuales del Copasst" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Reuniones ordinarias realizadas del Copasst
                                                                <asp:textbox  id="Textbox5" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox5_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado11" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Asignación de Recursos Humanos requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo. ( Número de Comités en funcionamiento y número de encargados del SGSST)" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="N° de recursos humanos disponibles según el tamaño de la empresa, y especialistas requeridos en materia de SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Gerente COPASST Coordinador SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Numérico" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Equipo de Trabajo Interdisciplinario" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:textbox id="resultado12" runat="server" class="form-control" type="number" placeholder="0"></asp:textbox>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Recursos Financieros" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="La asignación de recursos financieros y físicos  requeridos para la implementación del Sistema de Gestión de la Seguridad y Salud en el Trabajo." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Asignación de recursos aprobados para las necesidades contempladas por el SGSST / Recursos Necesarios para cubrir el total de necesidades del SGSST) X 100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Empleador Gerente COPASST Coordinador SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="100% de Recursos Aprobados" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Asignación de recursos aprobados para las necesidades contempladas por el SGSST
                                                                <asp:textbox  id="Textbox6" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox6_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Recursos Necesarios para cubrir el total de necesidades del SGSST
                                                                <asp:textbox  id="Textbox7" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox6_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado13" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Documentos de Soporte" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existen Documentos de Soporte de la Gestión de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Documentos en físico o en digital del respaldo en materia de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Cumplimiento" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Existencia" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado
                                                                <asp:dropdownlist id="resultado14" runat="server" class="form-control">
                                                                    <asp:ListItem Text="Cumple" Value="Cumple"></asp:ListItem>
                                                                    <asp:ListItem Text="No Cumple" Value="No Cumple"></asp:ListItem>
                                                                </asp:dropdownlist></div>
                                                        </th>
                                                    </tr>

                                                   <tr>
                                                       <th><asp:label runat="server" text="Diagnóstico de las Condiciones de Seguridad y Salud en el Trabajo" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="La existencia de un procedimiento para efectuar el diagnóstico de las condiciones de salud de los trabajadores, para la definición de las prioridades de control e intervención" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="(N° de inspecciones realizadas por Área / Total de Áreas) x 100" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Coordinador SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="100 % de Cobertura de las áreas" Font-Size="Smaller"></asp:label></th>
                                                   </tr>
                                                   <tr>
                                                       <th>
                                                           <div class="external-event bg-green">
                                                               Resultado
                                                               <asp:label runat="server" id="resultado15"></asp:label>
                                                           </div>
                                                       </th>
                                                   </tr>

                                                   <tr>
                                                       <th><asp:label runat="server" text="Plan de emergencias" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Existencia de un plan para prevención y atención de emergencias en la organización ( y en sus sedes si aplica)" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text=" (N° de sedes con plan de emergencia/Nro. total de Sedes) x 100" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Coordinador de SST Comité de emergencias" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Anual " Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Valor Numérico" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Existencia del Plan de Prevención" Font-Size="Smaller"></asp:label></th>
                                                   </tr>
                                                   <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° de sedes con plan de emergencia
                                                                <asp:textbox  id="Textbox8" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox8_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número total de Áreas<br />
                                                                <asp:label id="Label3" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado16" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                   </tr>

                                                   <tr>
                                                       <th><asp:label runat="server" text="Capacitación en SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Existe un Plan de Capacitación anual en SST (y en sus sedes si aplica)" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="(N° de Áreas con plan de capacitación anual en SST/Total de áreas) x 100" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="SG-SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                       <th><asp:label runat="server" text="Existencia del Plan de Capacitación" Font-Size="Smaller"></asp:label></th>
                                                   </tr>
                                                   <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° de Áreas con plan de capacitación anual en SST
                                                                <asp:textbox  id="Textbox9" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox9_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Total de áreas<br />
                                                                <asp:label id="Label4" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado17" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                   </tr>
                                        
                                                </tbody>
                                            </table>                                
                                        </div>
                                    </div>
                                </div>
                    
                            </div>

                            <!-- Segundo Panel -->
                            <div class="panel">
                        
                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">INDICADOR DE PROCESO</a>
                                    </h4>
                                </div>
                        
                                <div id="collapse2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                
                                        <div class="box-body no-padding">
                                            <table class="table table-condensed" style="overflow: scroll;">
                                                <tbody>

                                                    <tr class="bg-aqua color-palette">
                                                        <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                        <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                        <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                        <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                        <th class="col-md-1 text-center">RESPONSABLE</th>
                                                        <th class="col-md-1 text-center">FRECUENCIA</th>
                                                        <th class="col-md-1 text-center">UNIDAD</th>
                                                        <th class="col-md-1 text-center">META</th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Autoevaluación" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Evaluación inicial del SG-SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="( Nº de Criterios contemplados e implementados en el Formato de Evaluación Inicial / Número de Criterios mínimos establecidos para la evaluación inicial en el decreto 1072) x 100" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Instrumento de evaluación inicial del SG-SST diligenciado por el Coordinador del SST" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST Copasst  Otras áreas" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="100%, de los aspectos contemplados en la evaluación inicial del SG-SST deben estar implementados en la empresa." Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Criterios contemplados e implementados en el Formato de Evaluación Inicial
                                                                <asp:textbox  id="Textbox10" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox10_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de Criterios mínimos establecidos para la evaluación inicial en el decreto 1072<br />
                                                                <asp:textbox  id="Textbox11" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox10_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado18" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Ejecución del plan de trabajo anual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de actividades cumplidas del plan de trabajo  en el SGSST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° de Actividades Ejecutadas del Plan de Trabajo / Nº de Actividades programadas en el Plan de Trabajo) X 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Plan Anual de Trabajo" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100 % de las actividades programadas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° de Actividades Ejecutadas del Plan de Trabajo
                                                                <asp:textbox  id="Textbox12" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox12_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Actividades programadas en el Plan de Trabajo<br />
                                                                <asp:textbox  id="Textbox13" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox12_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado19" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Intervención de peligros y riesgos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Intervención de los peligros identificados" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° Total De Riesgos Intervenidos en el Período/Total De Riesgos Identificados en el Período) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Inspecciones de Seguridad,Matriz de Riesgos,Investigaciones de AT,Reportes Del COPASST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de los Peligros intervenidos" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° Total De Riesgos Intervenidos en el Período
                                                                <asp:textbox  id="Textbox14" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox14_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Total De Riesgos Identificados en el Período<br />
                                                                <asp:textbox  id="Textbox15" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox14_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado20" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Ejecución del plan de capacitación en SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de Capacitaciones Desarrolladas en el Período" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° Total de Capacitaciones Ejecutadas en el período  / Nº de Capacitaciones programadas en el Plan de Capacitación para ese período) X 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Documento de Registro de Capacitaciones " Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Ejecución del 100% de las Capacitaciones programadas en el Plan " Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° Total de Capacitaciones Ejecutadas en el período
                                                                <asp:textbox  id="Textbox16" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox16_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Capacitaciones programadas en el Plan de Capacitación para ese período<br />
                                                                <asp:textbox  id="Textbox17" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox16_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado21" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Cultura de Prevención" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Generar comportamientos seguros y de autocuidado en los trabajadores de la empresa" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Nº de Capacitaciones ejecutadas de autocuidado/ Nº de Capacitaciones programadas en autocuidado) X 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Plan de Capacitación y Registro de Capacitaciones ejecutadas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Ejecución del 100% de las Capacitaciones programadas en materia de auto cuidado personal" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Capacitaciones ejecutadas de autocuidado
                                                                <asp:textbox  id="Textbox18" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox18_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Capacitaciones programadas en autocuidado<br />
                                                                <asp:textbox  id="Textbox19" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox18_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado22" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Reducir accidentalidad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Reducir la accidentalidad en general" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Acciones de Mejora implementadas en base a los Siniestros / Acciones de Mejora Identificadas en dicho Siniestro) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Reporte de Accidentes/ Incidentes" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de Mejoras Implementadas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Acciones de Mejora implementadas en base a los Siniestros
                                                                <asp:textbox  id="Textbox20" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox20_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Acciones de Mejora Identificadas en dicho Siniestro<br />
                                                                <asp:textbox  id="Textbox21" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox20_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado23" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Inspecciones" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de Inspecciones Realizadas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Promedio((Nº de Inspecciones realizadas por área / Total de tipo de inspecciones del área) x 100)" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Control de Inspecciones	" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100 % de cobertura de las áreas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Inspecciones realizadas por área
                                                                <asp:textbox  id="Textbox22" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox22_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Total de tipo de inspecciones del área<br />
                                                                <asp:textbox  id="Textbox23" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox22_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado24" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Plan de accidentalidad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Ejecución del plan de intervención de la accidentalidad, actividades cumplidas del Plan" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° De Actividades Desarrolladas En La Intervención De Los Riesgos Prioritarios/Actividades Propuestas Para La Intervención  De Los Riesgos Prioritarios) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Análisis De Causalidad,Investigación De Accidente de Trabajo,Reporte De Incidentes" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Cumplimiento del 100% de las actividades propuestas en el Plan de Prevención" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° De Actividades Desarrolladas En La Intervención De Los Riesgos Prioritarios
                                                                <asp:textbox  id="Textbox24" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox24_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Actividades Propuestas Para La Intervención De Los Riesgos Prioritarios<br />
                                                                <asp:textbox  id="Textbox25" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox24_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado25" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Investigación de accidentes e incidentes" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Porcentaje de accidentes e incidentes investigados" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° De Accidentes e Incidentes investigados/Nro. De Accidentes e Incidentes Reportados) x 100%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Reporte de Accidentes e incidentes" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de reportes realizados" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° De Accidentes e Incidentes investigados
                                                                <asp:textbox  id="Textbox26" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox26_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nro. De Accidentes e Incidentes Reportados<br />
                                                                <asp:textbox  id="Textbox27" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox26_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado26" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Reducción de Casos Médicos Musculo Esqueléticos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Reducir las enfermedades Musculo esqueléticas a través del Programa de Vigilancia Epidemiológica" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Nº de Casos Musculo Esqueléticos reportados en la Vigilancia Epidemiológica / N° Investigación realizada al Puesto de trabajo respecto a los casos ) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Vigilancia Epidemiológica,Inspecciones,Reporte de los Trabajadores" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de investigaciones realizadas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de Casos Musculo Esqueléticos reportados en la Vigilancia Epidemiológica
                                                                <asp:textbox  id="Textbox28" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox28_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° Investigación realizada al Puesto de trabajo respecto a los casos <br />
                                                                <asp:textbox  id="Textbox29" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox28_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado27" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Simulacros" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Porcentaje de simulacros ejecutados" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(N° De Simulacros Realizados / Nro. De Simulacros Programados) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Plan Anual De Trabajo En SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Gerente,Jefes de Área,COPASST,Área de Gestión de la SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de Simulacros Realizados en cuanto a la Programación" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° De Simulacros Realizados
                                                                <asp:textbox  id="Textbox30" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox30_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nro. De Simulacros Programados<br />
                                                                <asp:textbox  id="Textbox31" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox30_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado28" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                    
                            </div>
                    
                            <!-- Tercer Panel -->
                            <div class="panel">

                                <div class="panel-heading bg-aqua color-palette">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">INDICADOR DE RESULTADO</a>
                                    </h4>
                                </div>
                            
                                <div id="collapse3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                
                                        <div class="box-body no-padding">
                                            <table class="table table-condensed" style="overflow: scroll;">
                                                <tbody>

                                                    <tr class="bg-aqua color-palette">
                                                        <th class="col-md-2 text-center">DEFINICIÓN</th>
                                                        <th class="col-md-2 text-center">INTERPRETACIÒN</th>
                                                        <th class="col-md-2 text-center">MÉTODO DE CÁLCULO</th>
                                                        <th class="col-md-2 text-center">FUENTE DEL CÁLCULO</th>
                                                        <th class="col-md-1 text-center">RESPONSABLE</th>
                                                        <th class="col-md-1 text-center">FRECUENCIA</th>
                                                        <th class="col-md-1 text-center">UNIDAD</th>
                                                        <th class="col-md-1 text-center">META</th>
                                                    </tr>
                                            
                                                    <tr>
                                                        <th><asp:label runat="server" text="Frecuencia de los accidentes laborales." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Número de veces que ocurre un accidente laboral, en un período de tiempo" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Número de accidentes de trabajo que se presentaron en el período “Z” / Total de horas hombre trabajadas en el período “Z”) * 240.000." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Registros de Accidentalidad, Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST, Jefe Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual " Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Numérico" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de accidentes de trabajo que se presentaron en el período "Z"
                                                                <asp:textbox  id="Textbox32" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox32_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Total de horas hombre trabajadas en el período "Z"<br />
                                                                <asp:textbox  id="Textbox33" runat="server" class="form-control" type="number" min="0" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox32_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado29" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Severidad de los accidentes laborales." Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Número de días perdidos y/o cargados por accidentes laborales en un período de tiempo." Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Número de días de trabajo perdidos por accidente de trabajo en el período “Z” + número de días cargados en el período “Z” / Horas hombre trabajadas en el período “Z”) * 240.000" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="días" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de días de trabajo perdidos por accidente de trabajo en el período “Z” + número de días cargados en el período “Z”
                                                                <asp:textbox  id="Textbox34" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox34_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Horas hombre trabajadas en el período “Z”)<br />
                                                                <asp:textbox  id="Textbox35" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox34_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado30" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                        <th><asp:label runat="server" text="Mortalidad de los accidentes laborales." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Número de accidentes laborales mortales en un período de tiempo." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Número de accidentes de trabajo mortales que se presentaron en el período “Z” / Total de accidentes de trabajo que se presentaron en el período “Z”) * 100." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Númerico" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de accidentes de trabajo mortales que se presentaron en el período “Z”  
                                                                <asp:textbox  id="Textbox36" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox36_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Total de accidentes de trabajo que se presentaron en el período “Z”<br />
                                                                <asp:textbox  id="Textbox37" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox36_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado31" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Tasa Accidentalidad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Relación del número de casos de accidentes de trabajo ocurridos durante el período respecto al  número de trabajadores en el mismo período " Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="TA = (N° de Accidente de Trabajo Ocurridos en el Período / N° De Trabajadores ) X 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Cálculos Índices de Accidentalidad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Mensual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                N° de Accidente de Trabajo Ocurridos en el Período  
                                                                <asp:textbox  id="Textbox38" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox38_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                ISAT<br />
                                                                <asp:label id="Label5" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado32" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Índice de Ausentismo Laboral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Incluye Falta al trabajo por Enfermedad Común, enfermedad profesional, accidente de trabajo y consultas de salud." Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="IAL= ( N° Total de Horas de Ausentismo Justificado Medicamente en el Período / Horas Hombre en el Período ) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Cálculos Índices de Accidentalidad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 N° Total de Horas de Ausentismo Justificado Medicamente en el Período
                                                                <asp:textbox  id="Textbox39" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox39_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Horas Hombre en el Período<br />
                                                                <asp:textbox  id="Textbox40" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox39_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado33" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Gestión de Riesgos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de Disminución de Riesgos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="GR= (Riesgos críticos gestionados / Riesgos críticos identificados) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Matriz de Riesgos" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de Riesgos críticos gestionados" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Riesgos críticos gestionados
                                                                <asp:textbox  id="Textbox41" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox41_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Riesgos críticos identificados<br />
                                                                <asp:textbox  id="Textbox42" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox41_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado34" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="% Cubrimiento EPP " Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Proporción de trabajadores que reciben los Equipos de Protección Personal" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="EPP= (Número de EPP entregados / Número de EPP requeridos) x  100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Registro de Control de entregas de EPP,Inspecciones de Seguridad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Trimestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de EPP entregados al personal" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Número de EPP entregados
                                                                <asp:textbox  id="Textbox43" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox43_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de EPP requeridos<br />
                                                                <asp:textbox  id="Textbox44" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox43_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado35" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="% uso EPP" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Muestra el % de personas que usan los EPP" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Nº de Trabajadores que usan EPP en el período Laboral / Número de EPP entregados)  x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Inspecciones de Seguridad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Mensual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de Trabajadores Cumpliendo con el uso de EPP" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Nº de Trabajadores que usan EPP en el período Laboral
                                                                <asp:textbox  id="Textbox45" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox45_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de EPP entregados<br />
                                                                <asp:textbox  id="Textbox46" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox45_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado36" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Eficiencia del SGSST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de eficiencia del SGSST respecto a los reportes de los Trabajadores" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Deficiencias del SG-SST identificadas efectivamente gestionadas/ Deficiencias del SG-SST identificadas por los trabajadores) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Reporte de los Trabajadores" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="COPASST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de Deficiencias Gestionadas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Deficiencias del SG-SST identificadas efectivamente gestionadas
                                                                <asp:textbox  id="Textbox47" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox47_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Deficiencias del SG-SST identificadas por los trabajadores<br />
                                                                <asp:textbox  id="Textbox48" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox47_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado37" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="Acciones correctivas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Indicador de las acciones correctivas realizadas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Nº de Acciones correctivas implementadas / Nº de inconformidades encontradas) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="SG-SST,Inspecciones,COPASST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de acciones correctivas implementadas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Nº de Acciones correctivas implementadas
                                                                <asp:textbox  id="Textbox49" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox49_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de inconformidades encontradas<br />
                                                                <asp:textbox  id="Textbox50" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox49_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado38" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="% Condiciones mejoradas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Muestra el porcentaje de condiciones mejoradas" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="CM = ( Nº de condiciones mejoradas/ Nº de no conformidades encontradas) x  100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="SG-SST,inspecciones de Seguridad" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Semestral" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de condiciones mejoradas" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Nº de condiciones mejoradas
                                                                <asp:textbox  id="Textbox51" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox51_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Nº de no conformidades encontradas<br />
                                                                <asp:textbox  id="Textbox52" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox51_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado39" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>

                                                    <tr>
                                                            <th><asp:label runat="server" text="% de Cumplimiento del Decreto 1072" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="% de Implementación del SGSST en cumplimiento de todos los requisitos del Decreto 1072" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="(Requisitos cumplidos del decreto 1072 / Totalidad de requisitos establecidos en el Decreto 1072) x 100" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Matriz Legal" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Coordinador de SST" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="%" Font-Size="Smaller"></asp:label></th>
                                                            <th><asp:label runat="server" text="100% de los lineamientos del Decreto 1072 cumplidos" Font-Size="Smaller"></asp:label></th>
                                                        </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Requisitos cumplidos del decreto 1072 
                                                                <asp:textbox  id="Textbox53" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox53_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Totalidad de requisitos establecidos en el Decreto 1072<br />
                                                                <asp:textbox  id="Textbox54" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox53_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado40" runat="server" text="---"></asp:label>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <th><asp:label runat="server" text="Ausentismo." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Ausentismo es la no asistencia al trabajo, con incapacidad médica." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="(Número de días de ausencia por incapacidad laboral y común / Número de días de trabajo programados) * 100." Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Registros de Accidentalidad,Registro de Asistencia Dpto Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Coordinador de SST,Jefe Recursos Humanos" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Anual" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Númerico" Font-Size="Smaller"></asp:label></th>
                                                        <th><asp:label runat="server" text="Valor Numérico menor en comparación al resultado del Período anterior" Font-Size="Smaller"></asp:label></th>
                                                    </tr>
                                                    <tr>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                 Número de días de ausencia por incapacidad laboral y común 
                                                                <asp:textbox  id="Textbox55" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox55_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Número de días de trabajo programados<br />
                                                                <asp:textbox  id="Textbox56" runat="server" class="form-control" type="number" min="0" max="100" 
                                                                  AutoPostBack="true" OnTextChanged="Textbox55_TextChanged"></asp:textbox>
                                                            </div>
                                                        </th>
                                                        <th>
                                                            <div class="external-event bg-green">
                                                                Resultado<br />
                                                                <asp:label id="resultado41" runat="server" text="---"></asp:label>
                                                            </div>
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
            
                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-2">
                        <asp:ImageButton AlternateText="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png" 
                            OnClick="GenerarDocumento" ValidationGroup="ValidationAdd"/>
                        <h4>Generar Documento</h4>
                    </div>
                    <div class="col-md-4">
                        <asp:PlaceHolder Visible="true" id="PlaceHolder1" runat="server">
                            <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\upload.png" 
                                data-toggle="modal" data-target="#addModal"/>
                            <h4>Subir Documento</h4>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger Controlid="btnPrint"/>
        </Triggers>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Documento</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate> 
                                            
                        <div class="modal-body form-group">
                            <div class="row">
                                <label class="col-md-4 control-label">Nombre: </label>
                                <div class="col-md-6"> 
                                        <asp:TextBox id="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombre" runat="server" 
                                            ValidationGroup="ValidationAdd1"/>
                                         </div>
                            </div><br />
                                                        
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Empresa: </label> 
                                    <div class="col-md-6">
                                            <asp:DropDownList id="ddlEmpresaAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"  runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                                ValidationGroup="ValidationAdd1"/>
                                        </div>
                                </div><br/>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" id="phSucursalAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Sucursal: </label> 
                                    <div class="col-md-6">
                                            <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
                                                ValidationGroup="ValidationAdd1"/>
                                        </div>
                                </div><br/>
                            </asp:PlaceHolder>

                            <div class="row">
                                <label class="col-md-4 control-label">Archivo: </label>
                                <div class="col-md-6">
                                        <asp:FileUpload id="flpArchivo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="flpArchivo" runat="server" 
                                            ValidationGroup="ValidationAdd1"/>
                                    </div>
                            </div><br/>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2"><asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd1"/></div>
                                <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                            </div>
                        </div>
                    
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnAdd"/>
                    </Triggers>
                </asp:updatepanel>

            </div>
        </div>
    </div>

</asp:Content>