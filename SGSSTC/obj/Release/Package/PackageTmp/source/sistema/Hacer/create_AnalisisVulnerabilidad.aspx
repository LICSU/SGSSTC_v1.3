<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_AnalisisVulnerabilidad.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.create_AnalisisVulnerabilidad" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../EvaluacionInicial/index_AnalisisVulnerabilidad.aspx">Análisis de Vulnerabilidad</a></li>
            <li><a href="#">Crear Análisis de Vulnerabilidad</a></li>
        </ol>

        <div class="page-header">
            <h1 class="text-center">Matriz de Evaluación del Grado de Vulnerabilidad</h1>
        </div>

        <div class="row form-group">
            
            <asp:PlaceHolder runat="server" id="phEmpresa">
                <div class="col-md-4 col-md-offset-4">
                    <h4 class="text-center">Empresa</h4>
                    <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    
                </div>
            </asp:PlaceHolder> 
        
            <asp:PlaceHolder runat="server" id="phSucursal">
                <div class="col-md-4">
                    <h4 class="text-center">Sucursal</h4>
                    <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" runat="server" 
                        ValidationGroup="ValidationAdd"/>
                </div>
            </asp:PlaceHolder>
        </div>

        <div class="row text-center">
            <div class="box">
                <div class="panel-group" id="accordion">

                    <!-- Primer Panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading bg-teal color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">AREA DE EVALUACION</a></h4>
                        </div>

                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtArea" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                    </div>

                    <!-- Segundo Panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading bg-teal color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">OBJETIVO DE LA EVALUACION</a></h4>
                        </div>

                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtObjetivo" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                    </div>

                    <!-- Tercer Panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading bg-teal color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ALCANCE DE LA EVALUACION</a></h4>
                        </div>

                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtAlcance" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                    </div>

                    <!-- Cuarto Panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading bg-teal color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">RESULTADOS DE LA EVALUACION INTERNA</a></h4>
                        </div>

                        <div id="collapse4" class="panel-collapse collapse">
                            <div class="panel-body">

                                <asp:scriptmanager id="ScriptManager1" runat="server"/>
                                <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
                                    <ContentTemplate>

                                        <div class="box-body no-padding">
                                            <table class="table table-condensed">
                                                <tbody> 
                                
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">Nº</td>
                                                        <td class="col-md-11 text-center">ASPECTO A EVALUAR</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                
                                                    <!-- 1 Ruta de evacuacion-->
                                                    <tr class="bg-aqua color-palette text-center">
                                                        <td class="col-md-1 text-center">1</td>
                                                        <td class="col-md-7 text-left" colspan="3">RUTA DE EVACUACIÒN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe una ruta exclusiva de evacuación, iluminada, señalizada con pasa manos</td>
                                                        <td class="col-md-3">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList1" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF1" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Presenta deficiencia en alguno de los aspectos anteriores.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList2" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF2" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No hay ruta exclusiva de evacuación</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList3" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF3" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 2 LOS VISITANTES DEL EDIFICIO CONOCEN LAS RUTAS DE EVACUACIÓN-->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">2</td>
                                                        <td class="col-md-7 text-left"colspan="3">LOS VISITANTES DEL EDIFICIO CONOCEN LAS RUTAS DE EVACUACIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Fácil y rápidamente gracias a la señalización visible desde todos los ángulos</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList4" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF4" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Difícilmente por la poca señalización u orientación al respecto.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList5" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF5" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No las reconocerían fácilmente.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList6" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF6" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 3 LOS PUNTOS DE REUNION EN UNA EVACUACIÓN -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">3</td>
                                                        <td class="col-md-7  text-left"colspan="3">LOS PUNTOS DE REUNION EN UNA EVACUACIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Se han establecido claramente y los conocen todos los ocupantes del edificio.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList7" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF7" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existen varios sitios posibles, pero ninguno se ha delimitado con claridad y nadie sabría hacia donde evacuar exactamente.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList8" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF8" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existen puntos óptimos donde evacuar.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList9" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF9" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 4 LOS PUNTOS DE REUNION EN UNA EVACUACIÓN -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">4</td>
                                                        <td class="col-md-7  text-left"colspan="3">LOS PUNTOS DE REUNION EN UNA EVACUACIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Son amplios y seguros</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList10" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF10" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Son amplios pero con algunos riesgos.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList11" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF11" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Son realmente pequeños para el número de personas a evacuar y realmente peligrosos.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList12" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF12" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 5 LA SEÑALIZACIÓN PARA EVACUACIÓN -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">5</td>
                                                        <td class="col-md-7  text-left"colspan="3">LA SEÑALIZACIÓN PARA EVACUACIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Se visualiza e identifica plenamente en todas las áreas del edificio</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList13" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF13" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Esta muy oculta y apenas se observa en algunos sitios. </td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList14" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF14" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existen flechas o croquis de evacuación en ninguna parte visible.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList15" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF15" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 6 LAS RUTAS DE EVACUACIÓN SON -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">6</td>
                                                        <td class="col-md-7  text-left"colspan="3">LAS RUTAS DE EVACUACIÓN SON</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Antideslizantes y seguras en todo recorrido</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList16" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF16" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Con obstáculos y tramos resbalosos.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList17" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF17" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Altamente resbalosos, utilizados como bodegas o intransitables en algunos tramos.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList18" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF18" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 7 LA RUTA PRINCIPAL DE EVACUACIÓN -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">7</td>
                                                        <td class="col-md-7  text-left"colspan="3">LA RUTA PRINCIPAL DE EVACUACIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Tiene ruta alterna optima y conocida</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList19" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF19" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Tiene una ruta alterna pero deficiente.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList20" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF20" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No posee ninguna ruta alterna o no se conoce </td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList21" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF21" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 8 LA SEÑAL DE ALARMA -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">8</td>
                                                        <td class="col-md-7  text-left"colspan="3">LA SEÑAL DE ALARMA</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Se encuentra o se ve claramente en todos los sitios</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList22" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF22" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Algunas veces no se escuchan ni se ven claramente. Los ocupante no la conocen</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList23" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF23" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Usualmente no se escucha ni se ve.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList24" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF24" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 9 SISTEMA DE DETECCIÓN -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">9</td>
                                                        <td class="col-md-7  text-left"colspan="3">SISTEMA DE DETECCIÓN</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">El edificio posee sistemas de detección de incendio, revisado el último trimestre en todas las áreas.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList25" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF25" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Solo existen algunos detectores sin revisión y no en todas las áreas.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList26" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF26" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe ningún tipo de detector.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList27" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF27" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 10 EL SISTEMA DE ILUMINACIÓN DE EMERGENCIA. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">10</td>
                                                        <td class="col-md-7  text-left"colspan="3">EL SISTEMA DE ILUMINACIÓN DE EMERGENCIA.</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Es óptimo de día y noche (siempre se ve claramente, aun de noche)</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList28" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF28" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Es optimo solo en el día (En la noche no se ve con claridad )</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList29" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF29" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Deficiente día y noche</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList30" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF30" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 11 EL SISTEMA DE ILUMINACION DE EMERGENCIA. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">11</td>
                                                        <td class="col-md-7  text-left"colspan="3">EL SISTEMA DE ILUMINACION DE EMERGENCIA.</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Es de encendido automático en caso de corte de energía.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList31" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF31" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Es de encendido manual en caso de corte de energía.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList32" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF32" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList33" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF33" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 12 EL SISTEMA CONTRA INCENDIO. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">12</td>
                                                        <td class="col-md-7  text-left"colspan="3">EL SISTEMA CONTRA INCENDIO.</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Es funcional.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList34" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF34" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Funciona parcialmente.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList35" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF35" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe o no funciona.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList36" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF36" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 13 LOS EXTINTORES PARA INCENDIO. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">13</td>
                                                        <td class="col-md-7  text-left"colspan="3">LOS EXTINTORES PARA INCENDIO</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Están ubicados en las áreas críticas y son funcionales</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList37" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF37" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existen pero no en número suficiente</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList38" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF38" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existen o no funcionan.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList39" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF39" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 14 DIVULGACIÓN DEL PLAN DE EMERGENCIA A LOS EMPLEADOS. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">14</td>
                                                        <td class="col-md-7  text-left"colspan="3">DIVULGACIÓN DEL PLAN DE EMERGENCIA A LOS EMPLEADOS</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Se ha desarrollado mínimo una por semestre</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList40" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF40" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Esporádicamente se ha divulgado para algunas áreas.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList41" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF41" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No se ha divulgado.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList42" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF42" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 15 COORDINADOR DEL PLAN DE EMERGENCIA. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">15</td>
                                                        <td class="col-md-7  text-left"colspan="3">COORDINADOR DEL PLAN DE EMERGENCIA</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe y está capacitado</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList43" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF43" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe pero no está capacitado.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList44" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF44" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList45" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF45" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 16 LA BRIGADA DE EMERGENCIA -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">16</td>
                                                        <td class="col-md-7  text-left"colspan="3">LA BRIGADA DE EMERGENCIA</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe y está capacitada.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList46" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label  id="PuntajeF46" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe pero no está capacitada.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList47" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF47" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList48" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF48" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 17 SE HAN REALIZADO SIMULACROS -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">17</td>
                                                        <td class="col-md-7  text-left"colspan="3">SE HAN REALIZADO SIMULACROS</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Un simulacro en el último año</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList49" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF49" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Un simulacro en los dos últimos años</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList50" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF50" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Ningún simulacro</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList51" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF51" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 18 ENTIDADES DE SOCORRO EXTERNAS -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">18</td>
                                                        <td class="col-md-7  text-left"colspan="3">ENTIDADES DE SOCORRO EXTERNAS</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Conocen y participan activamente en el plan de emergencia de la empresa.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList52" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF52" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Están identificadas las entidades de socorro pero no conocen el plan de emergencia de la empresa</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList53" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF53" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No se tienen en cuenta.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList54" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF54" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 19 LOS OCUPANTES DEL EDIFIO SON -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">19</td>
                                                        <td class="col-md-7  text-left"colspan="3">LOS OCUPANTES DEL EDIFIO SON</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Siempre los mismos con muy poco s visitantes</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList55" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF55" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Con un 10 a 20% de visitantes nuevos cada día</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList56" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF56" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">El 90% de los ocupantes son visitantes </td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList57" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF57" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 20 EN LA ENTRADA DEL EDIFICIO O EN CADA PISO -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">20</td>
                                                        <td class="col-md-7  text-left"colspan="3">EN LA ENTRADA DEL EDIFICIO O EN CADA PISO</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Existe y es visible un plano de evacuación en cada piso.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList58" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF58" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe un plano de evacuación en cada piso, pero alguien daría información.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList59" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF59" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">No existe un plano de evacuación y nadie esta responsabilizado de dar información al respecto.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList60" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF60" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 21 LAS RUTAS DE CIRCULACION. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">21</td>
                                                        <td class="col-md-7  text-left"colspan="3">LAS RUTAS DE CIRCULACIÓN.</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">En general las rutas de acceso y circulación de los trabajadores y visitantes son amplias y seguras</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList61" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF61" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">En algún punto de las rutas no se circula con facilidad por falta de espacio u obstáculos al paso.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList62" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF62" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">En general las rutas y áreas de circulación son congestionadas y de difícil uso.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList63" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF63" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 22 LAS PUERTAS DE SALIDA DEL EDIFICO. -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">22</td>
                                                        <td class="col-md-7  text-left"colspan="3">LAS PUERTAS DE SALIDA DEL EDIFICIO.</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">Las puertas cumplen con las medidas mínimas reglamentarias y de uso de cerraduras de seguridad</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList64" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF64" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Solo algunas puertas permiten una salida rápida y poseen cerraduras de seguridad</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList65" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF65" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">Ninguna puerta es lo suficientemente amplia o brinda garantías para salida segura</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList66" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF66" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                
                                                    <!-- 23 ESTRUCTURA Y TIPO DE CONSTRUCCION -->
                                                    <tr class="bg-aqua color-palette">
                                                        <td class="col-md-1 text-center">23</td>
                                                        <td class="col-md-7  text-left"colspan="3">ESTRUCTURA Y TIPO DE CONSTRUCCION</td>
                                                        <td class="col-md-3">OPCIONES</td>
                                                        <td class="col-md-1 text-center">PUNTAJE</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">A</td>
                                                        <td class="col-md-7  text-left" colspan="3">La estructura del edificio se soporta por estructuras de concreto y no presenta deterioro en paredes, columnas, techos o aditamentos internos.</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList67" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF67" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">B</td>
                                                        <td class="col-md-7  text-left" colspan="3">Presenta deterioro observables en paredes y techos que hagan pensar en daños estructurales</td>
                                                        <td class="col-md-3 text-center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList68" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="2"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF68" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-1 text-center">C</td>
                                                        <td class="col-md-7  text-left" colspan="3">La estructura no posee cimentación ni soportes de concreto y presenta deterioros estructurales observables en progreso durante los últimos seis meses.</td>
                                                        <td class="col-md-3" align="center">
                                                            <asp:RadioButtonList class="col-md-12" runat="server" id="RadioButtonList69" RepeatColumns="3" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="Riesgos_SelectedIndexChanged">
                                                                <asp:ListItem class="col-md-4" Text="" Value="0.4"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td class="col-md-1 text-center"><asp:Label id="PuntajeF69" runat="server" Text="---"></asp:Label></td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td class="bg-aqua color-palette col-md-12 text-center" colspan="6">PUNTAJE TOTAL</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12  text-left" colspan="6">
                                                            Total ítems con respuesta según la valoración A= 
                                                            <asp:Label id="puntajeA1" class="bg-red color-palette" runat="server" Text="___"></asp:Label>
                                                            x  4.0 =                                                  
                                                            <asp:Label id="puntajeA2" class="bg-red color-palette" runat="server" Text="___"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12  text-left" colspan="6">
                                                            Total ítems con respuesta según la valoración B= 
                                                            <asp:Label id="puntajeB1" class="bg-yellow color-palette" runat="server" Text="___"></asp:Label>
                                                            x  2.0 =                                                  
                                                            <asp:Label id="puntajeB2" class="bg-yellow color-palette" runat="server" Text="___"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12  text-left" colspan="6">
                                                            Total ítems con respuesta según la valoración C= 
                                                            <asp:Label id="puntajeC1" class="bg-green color-palette" runat="server" Text="___"></asp:Label>
                                                            x  0.4 =                                                  
                                                            <asp:Label id="puntajeC2" class="bg-green color-palette" runat="server" Text="___"></asp:Label></td>
                                                    </tr> 
                                                    <tr>
                                                        <td class="col-md-12  text-left" colspan="6"> 
                                                            PUNTAJE TOTAL =                                               
                                                            <asp:Label id="puntajeABC" runat="server" Text="___" class="bg-aqua color-palette"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="bg-aqua color-palette col-md-12 text-center" colspan="6">ACCIONES A SEGUIR</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12  text-left" colspan="6">
                                                            <asp:Label id="txtAcciones" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">CONCLUSIONES</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12" colspan="6">
                                                            <textarea rows="4" id="txtConclusiones" maxlength="1000" class="form-control" runat="server"></textarea>
                                                        </td>
                                                    </tr>

                                
                                                    <tr>
                                                        <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">FORTALEZAS</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12" colspan="6">
                                                            <textarea rows="4" id="txtFortalezas" maxlength="1000" class="form-control" runat="server"></textarea>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="bg-aqua color-palette col-md-12  text-left" colspan="6">DEBILIDADES</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col-md-12" colspan="6">
                                                            <textarea rows="4" id="txtDebilidades" maxlength="1000" class="form-control" runat="server"></textarea>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger Controlid="btnGuardar"/>
                                    </Triggers>
                                </asp:updatepanel>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="row" align="center">
            <div class="col-md-4 col-md-offset-4">
                <asp:imagebutton id="btnGuardar" runat="server" imageurl="~\ico\print.png" onclick="GenerarDocumento" ValidationGroup="ValidationAdd"/>
                <h4>Generar Documento</h4>
            </div>
        </div>

    </div>

</asp:Content>