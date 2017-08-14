<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionPuestos.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionPuestos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="../EvaluacionInicial/index_Inspecciones.aspx">Inspecciones</a></li>
            <li><a href="#">Crear Inspección de Puesto de Trabajo</a></li>
        </ol>

        <div class="page-header">
             <h1 class="text-center">Inspección de Puesto de Trabajo</h1>
         </div>

        <asp:updatepanel runat="server">
                <ContentTemplate> 
                    <div class="row form-group">
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
                        <div class="col-md-3">
                            <h4 class="text-center">Area</h4>
                            <asp:DropDownList runat="server" id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <h4 class="text-center">Puesto de Trabajo</h4>
                            <asp:DropDownList runat="server" id="ddlPuesto"  data-toggle="tooltip" data-placement="bottom" title="Seleccione un Puesto de Trabajo" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlPuesto_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlPuesto" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    </div>
                    
                    <div class="row form-group">
                    <div class="col-md-1"></div>
                        <asp:PlaceHolder runat="server" id="phTrabajdor" Visible="False">
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
                         </asp:PlaceHolder>
                    </div>
                        
                     <asp:PlaceHolder runat="server" id="phInformacion" Visible="False">
                         <div class="row">
                             <div class="col-md-10 col-md-offset-1">
                                 <div class="panel-group" id="accordion">

                                     <!-- Primer Panel -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">ORGANIZACIÓN DE TRABAJO</a></h4>
                                        </div>
                                        <div id="collapse1" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>1</asp:TableCell>
                                                        <asp:TableCell>¿La jornada laboral semanal excede de 48 Horas? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi1" GroupName="chk1"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo1" GroupName="chk1"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt1" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>2</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan horas extras luego de la jornada de trabajo? y esto es un factor estresante para el trabajador (a)? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi2" GroupName="chk2"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo2" GroupName="chk2"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt2" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>3</asp:TableCell>
                                                        <asp:TableCell>¿Existe rotación en los turnos de trabajo (día – noche), y esto es un factor estresante para el trabajador (a)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi3" GroupName="chk3"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo3" GroupName="chk3"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt3" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>4</asp:TableCell>
                                                        <asp:TableCell>¿Durante la jornada laboral, los descansos ó pausas son escasos ó nulos?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi4" GroupName="chk4"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo4" GroupName="chk4"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt4" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>5</asp:TableCell>
                                                        <asp:TableCell>¿Se impone un ritmo de trabajo difícil de alcanzar para el trabajador ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi5" GroupName="chk5"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo5" GroupName="chk5"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt5" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Segundo Panel -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">ASPECTO A EVALUAR DEL AMBIENTE</a></h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>6</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador está expuesto a temperaturas extremas? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi6" GroupName="chk6"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo6" GroupName="chk6"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt6" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>7</asp:TableCell>
                                                        <asp:TableCell>¿Existen variaciones extremas de temperatura durante la jornada?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi7" GroupName="chk7"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo7" GroupName="chk7"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt7" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>8</asp:TableCell>
                                                        <asp:TableCell>¿Es bajo el nivel de iluminación en el área de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi8" GroupName="chk8"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo8" GroupName="chk8"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt8" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>9</asp:TableCell>
                                                        <asp:TableCell>¿Existen deslumbramientos en el área de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi9" GroupName="chk9"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo9" GroupName="chk9"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt9" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>10</asp:TableCell>
                                                        <asp:TableCell>¿Existen sombras por falta de iluminación en el área de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi10" GroupName="chk10"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo10" GroupName="chk10"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt10" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>11</asp:TableCell>
                                                        <asp:TableCell>¿Es baja la frecuencia de limpieza en la lámparas y ventanas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi11" GroupName="chk11"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo11" GroupName="chk11"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt11" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>12</asp:TableCell>
                                                        <asp:TableCell>¿Las lámparas fundidas son sustituidas con baja frecuencia? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi12" GroupName="chk12"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo12" GroupName="chk12"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt12" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>13</asp:TableCell>
                                                        <asp:TableCell>¿Hay ruido excesivo,constante y molesto?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi13" GroupName="chk13"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo13" GroupName="chk13"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt13" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>14</asp:TableCell>
                                                        <asp:TableCell>¿Hay vibración de cuerpo completo o de las extremidades superiores?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi14" GroupName="chk14"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo14" GroupName="chk14"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt14" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>15</asp:TableCell>
                                                        <asp:TableCell>¿Se emplean herramientas que produzcan vibraciones (martillo neumático, buril, pulidora, etc.), sin sistemas de amortiguación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi15" GroupName="chk15"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo15" GroupName="chk15"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt15" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>16</asp:TableCell>
                                                        <asp:TableCell>¿Existen máquinas que producen vibraciones?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi16" GroupName="chk16"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo16" GroupName="chk16"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt16" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>17</asp:TableCell>
                                                        <asp:TableCell>¿La circulación de aire en el área de trabajo es insuficiente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi17" GroupName="chk17"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo17" GroupName="chk17"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt17" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Tres -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ASPECTO A EVALUAR CARGA FISICA DEL TRABAJO </a></h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>18</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador mantiene una postura prolongada durante el 75% o más de la jornada laboral sin alternarla (de pie o sentado)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi18" GroupName="chk18"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo18" GroupName="chk18"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt18" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>19</asp:TableCell>
                                                        <asp:TableCell>¿Existen rotaciones e inclinaciones repetidas de cuello?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi19" GroupName="chk19"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo19" GroupName="chk19"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt19" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>20</asp:TableCell>
                                                        <asp:TableCell>¿Hay flexiones repetidas de la espalda o tronco mayores de 30°?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi20" GroupName="chk20"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo20" GroupName="chk20"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt20" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>21</asp:TableCell>
                                                        <asp:TableCell>¿Hay rotaciones de la espalda o tronco?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi21" GroupName="chk21"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo21" GroupName="chk21"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt21" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>22</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador realiza de manera prolongada actividades arrodillado y/o en cuclillas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi22" GroupName="chk22"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo22" GroupName="chk22"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt22" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>23</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas de los hombros en flexión mayor de 45°?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi23" GroupName="chk23"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo23" GroupName="chk23"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt23" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>24</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas donde el hombro se encuentra en abducción mayor de 45°? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi24" GroupName="chk24"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo24" GroupName="chk24"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt24" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>25</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas donde los codos se encuentren en flexión mayor de 90°?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi25" GroupName="chk25"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo25" GroupName="chk25"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt25" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>26</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas donde se exija levantar y sostener el codo por encima del nivel de la mitad del pecho?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi26" GroupName="chk26"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo26" GroupName="chk26"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt26" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>27</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas del tronco en contra de la gravedad?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi27" GroupName="chk27"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo27" GroupName="chk27"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt27" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>28</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas de los miembros superiores en contra de la gravedad?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi28" GroupName="chk28"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo28" GroupName="chk28"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt28" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>29</asp:TableCell>
                                                        <asp:TableCell>¿Hay desviaciones en manos con relación al eje neutro de la muñeca en la manipulación o agarre de herramientas u objetos?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi29" GroupName="chk29"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo29" GroupName="chk29"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt29" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>30</asp:TableCell>
                                                        <asp:TableCell>¿Hay repetitividad de movimientos idénticos o similares efectuados cada pocos segundos en los miembros superiores?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi30" GroupName="chk30"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo30" GroupName="chk30"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt30" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>31</asp:TableCell>
                                                        <asp:TableCell>¿Hay movimientos del tronco con combinación de fuerza?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi31" GroupName="chk31"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo31" GroupName="chk31"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt31" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>32</asp:TableCell>
                                                        <asp:TableCell>¿Existe movimientos repetidos para alcanzar algo que se encuentre detrás de la persona?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi32" GroupName="chk32"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo32" GroupName="chk32"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt32" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>33</asp:TableCell>
                                                        <asp:TableCell>¿Hay movimientos de los miembros superiores con combinación de fuerza?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi33" GroupName="chk33"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo33" GroupName="chk33"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt33" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>34</asp:TableCell>
                                                        <asp:TableCell>¿Existen posturas de elevación sostenida o repetida de los brazos?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi34" GroupName="chk34"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo34" GroupName="chk34"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt34" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>35</asp:TableCell>
                                                        <asp:TableCell>¿La tarea involucra posturas no-neutrales y repetidas de la mano ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi35" GroupName="chk35"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo35" GroupName="chk35"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt35" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>36</asp:TableCell>
                                                        <asp:TableCell>¿La tarea involucra movimientos rápidos, fuertes o repentinos de los miembros superiores en posiciones forzadas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi36" GroupName="chk36"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo36" GroupName="chk36"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt36" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>37</asp:TableCell>
                                                        <asp:TableCell>¿La tarea requiere esfuerzos enérgicos de la mano con el brazo extendido?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi37" GroupName="chk37"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo37" GroupName="chk37"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt37" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>38</asp:TableCell>
                                                        <asp:TableCell>¿La tarea exige mover la cabeza repetidamente de un lado a otro?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi38" GroupName="chk38"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo38" GroupName="chk38"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt38" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>39</asp:TableCell>
                                                        <asp:TableCell>¿La tarea exige flexión del tronco hacia adelante mas de 20º?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi39" GroupName="chk39"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo39" GroupName="chk39"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt39" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>40</asp:TableCell>
                                                        <asp:TableCell>¿La tarea implica Inclinación lateral del tronco, repetidas veces?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi40" GroupName="chk40"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo40" GroupName="chk40"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt40" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>41</asp:TableCell>
                                                        <asp:TableCell>¿Se debe  Rotar el tronco en más de 20º?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi41" GroupName="chk41"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo41" GroupName="chk41"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt41" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>42</asp:TableCell>
                                                        <asp:TableCell>¿La tarea involucra movimientos rápidos, fuertes o repentinos de la espalda en posiciones forzadas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi42" GroupName="chk42"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo42" GroupName="chk42"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt42" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Cuatro -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4">MANIPULACIÓN DE CARGA</a></h4>
                                        </div>
                                        <div id="collapse4" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>43</asp:TableCell>
                                                        <asp:TableCell>¿ El trabajo requiere levantar cargas compactas? (para hombres 25 kilos y mujeres 12.5 kilos)</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi43" GroupName="chk43"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo43" GroupName="chk43"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt43" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>44</asp:TableCell>
                                                        <asp:TableCell>¿ Para aquellos trabajadores dedicados constantemente al levantamiento y transporte de carga,  los intervalos de pausa, o períodos libres de esfuerzo físico extraordinario son escasos o núlos  y esto no les permite una recuperación de la fátiga?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi44" GroupName="chk44"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo44" GroupName="chk44"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt44" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>45</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador levanta peso por debajo de las rodillas ó arriba de los hombros repetidas veces al día?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi45" GroupName="chk45"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo45" GroupName="chk45"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt45" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>46</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador empuja o hala 10 o más kilos durante 2 o más horas consecutivas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi46" GroupName="chk46"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo46" GroupName="chk46"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt46" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>47</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador manipula objetos o herramientas de un peso igual o mayor a 2 kilogramos por mano?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi47" GroupName="chk47"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo47" GroupName="chk47"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt47" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>48</asp:TableCell>
                                                        <asp:TableCell>¿Hay manipulación de objetos o herramientas por encima de los hombros ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi48" GroupName="chk48"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo48" GroupName="chk48"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt48" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>49</asp:TableCell>
                                                        <asp:TableCell>¿Hay manipulación de objetos o herramientas por debajo de la cintura ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi49" GroupName="chk49"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo49" GroupName="chk49"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt49" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>50</asp:TableCell>
                                                        <asp:TableCell>¿Hay inclinación del tronco al manipular objetos o cargas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi50" GroupName="chk50"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo50" GroupName="chk50"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>51</asp:TableCell>
                                                        <asp:TableCell>¿Hay giros o torsiones de tronco al manipular objetos o cargas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi51" GroupName="chk51"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo51" GroupName="chk51"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt51" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>52</asp:TableCell>
                                                        <asp:TableCell>¿Hay desplazamientos del cuerpo mientras se manipulan los objetos o las cargas, y la manipulación se realiza de manera indecuada (la carga alejada del cuerpo y la misma no posee un agarre adecuado ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi52" GroupName="chk52"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo52" GroupName="chk52"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt52" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Cinco -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5">CARGA MENTAL</a></h4>
                                        </div>
                                        <div id="collapse5" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>53</asp:TableCell>
                                                        <asp:TableCell>¿El trabajo exige simultáneamente varias tareas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi53" GroupName="chk53"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo53" GroupName="chk53"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt53" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>54</asp:TableCell>
                                                        <asp:TableCell>¿La tarea tiene un grado alto de concentración requiere de una elevada concentración sostenida y contínua, lo cual no es posible debido a factores externos ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi54" GroupName="chk54"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo54" GroupName="chk54"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt54" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>55</asp:TableCell>
                                                        <asp:TableCell>¿Se requiere velocidad en el proceso para la realización de la tarea? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi55" GroupName="chk55"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo55" GroupName="chk55"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt55" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>56</asp:TableCell>
                                                        <asp:TableCell>¿El trabajo implica el control de varias señales ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi56" GroupName="chk56"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo56" GroupName="chk56"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt56" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>57</asp:TableCell>
                                                        <asp:TableCell>¿El trabajo es minucioso y requiere de precisión?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi57" GroupName="chk57"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo57" GroupName="chk57"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt57" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>58</asp:TableCell>
                                                        <asp:TableCell>¿Existe un alto riesgo de accidentalidad en la manipulación de herramientas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi58" GroupName="chk58"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo58" GroupName="chk58"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt58" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>59</asp:TableCell>
                                                        <asp:TableCell>¿La realización de la tarea prohíbe hablar con otros compañeros mientras se trabaja, y no se permiten pausas de descanso?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi59" GroupName="chk59"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo59" GroupName="chk59"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt59" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Seis -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse6">CONDICIONES DEL PUESTO DE TRABAJO</a></h4>
                                        </div>
                                        <div id="collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>60</asp:TableCell>
                                                        <asp:TableCell>¿La altura del plano de trabajo genera inclinaciones de tronco?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi60" GroupName="chk60"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo60" GroupName="chk60"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt60" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>61</asp:TableCell>
                                                        <asp:TableCell>¿Los elementos de trabajo se encuentran fuera del alcance del trabajador? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi61" GroupName="chk61"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo61" GroupName="chk61"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt61" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>62</asp:TableCell>
                                                        <asp:TableCell>¿La visibilidad de todos los elementos de trabajo implica adoptar posturas inadecuadas o no confortables para el trabajador? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi62" GroupName="chk62"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo62" GroupName="chk62"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt62" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>63</asp:TableCell>
                                                        <asp:TableCell>¿El espacio de trabajo limita el libre movimiento? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi63" GroupName="chk63"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo63" GroupName="chk63"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt63" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>64</asp:TableCell>
                                                        <asp:TableCell>¿La manipulación de cargas se realiza sin ayudas mecánicas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi64" GroupName="chk64"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo64" GroupName="chk64"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt64" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>65</asp:TableCell>
                                                        <asp:TableCell>¿Se carece de elementos que permitan alternar posturas y/o que brinden confort (silla, reposa pies o banca para alternar posturas)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi65" GroupName="chk65"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo65" GroupName="chk65"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt65" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>66</asp:TableCell>
                                                        <asp:TableCell>¿La superficie de trabajo exige posturas de los miembros superiores en contra de la gravedad?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi66" GroupName="chk66"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo66" GroupName="chk66"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt66" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>67</asp:TableCell>
                                                        <asp:TableCell>¿La silla utilizada es estática ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi67" GroupName="chk67"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo67" GroupName="chk67"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt67" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>68</asp:TableCell>
                                                        <asp:TableCell>¿El asiento es inadecuado a las dimensiones del usuario (profundidad y anchura)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi68" GroupName="chk68"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo68" GroupName="chk68"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt68" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>69</asp:TableCell>
                                                        <asp:TableCell>¿La silla es incómoda para el usuario?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi69" GroupName="chk69"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo69" GroupName="chk69"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt69" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>70</asp:TableCell>
                                                        <asp:TableCell>¿La herramienta de trabajo es inadecuada a las necesidades del trabajador en cuanto a la funcionalidad para ejecutar la tarea?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi70" GroupName="chk70"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo70" GroupName="chk70"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt70" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>71</asp:TableCell>
                                                        <asp:TableCell>¿Las dimensiones del mango y la naturaleza del agarre son inadecuados a las dimensiones de la mano del trabajador?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi71" GroupName="chk71"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo71" GroupName="chk71"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt71" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>72</asp:TableCell>
                                                        <asp:TableCell>¿Se usan herramientas o equipos que tengan altos niveles de vibración (sierras eléctricas, martillos neumáticos, herramientas de percusión, martillos de remachado)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi72" GroupName="chk72"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo72" GroupName="chk72"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt72" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>
                            
                                     <!-- Panel Siete -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse7">CONDICIONES TERMOHIGROMETRICAS</a></h4>
                                        </div>
                                        <div id="collapse7" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>73</asp:TableCell>
                                                        <asp:TableCell>¿Existen focos de calor (hornos, calderas, etc.) sin aislar convenientemente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi73" GroupName="chk73"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo73" GroupName="chk73"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt73" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>74</asp:TableCell>
                                                        <asp:TableCell>¿Existen condiciones inapropiadas de ventilación en el local?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi74" GroupName="chk74"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo74" GroupName="chk74"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt74" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>75</asp:TableCell>
                                                        <asp:TableCell>¿En la operación se generan vapores o humedad? </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi75" GroupName="chk75"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo75" GroupName="chk75"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt75" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>76</asp:TableCell>
                                                        <asp:TableCell>¿La temperatura del local de trabajo es inadecuada?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi76" GroupName="chk76"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo76" GroupName="chk76"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt76" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>77</asp:TableCell>
                                                        <asp:TableCell>¿La ropa de trabajo utilizada es inapropiada al tipo de trabajo y a la temperatura ambiental?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi77" GroupName="chk77"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo77" GroupName="chk77"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt77" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>78</asp:TableCell>
                                                        <asp:TableCell>¿El  mantenimiento que se realiza  a los sistemas de ventilación es ineficaz?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi78" GroupName="chk78"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo78" GroupName="chk78"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt78" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                      <!-- Panel Ocho -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse8">RADIACIONES</a></h4>
                                        </div>
                                        <div id="collapse8" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>79</asp:TableCell>
                                                        <asp:TableCell>¿El trabajadro(a) está expuesto a radiaciones ionizantes y se dota de Equipo de Protección adecuada?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi79" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo79" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt79" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>80</asp:TableCell>
                                                        <asp:TableCell>¿Existe señalización del riesgo a exposición de radiaciones ionizantes ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi80" GroupName="chk80"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo80" GroupName="chk80"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt80" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>81</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan evaluaciones médcias periódicas deacuerdo al riesgo al que está expuesto el trabajador?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi81" GroupName="chk81"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo81" GroupName="chk81"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt81" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                      <!-- Panel Nueve -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse9">CONTAMINANTES QUÍMICOS ( Si no se emplean productos químicos abstenerse de responder estas preguntas)</a></h4>
                                        </div>
                                        <div id="collapse9" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>82</asp:TableCell>
                                                        <asp:TableCell>¿Se utilizan productos químicos en su área de trabajo, y conoce que productos son los que emplea?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi82" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo82" GroupName="chk79"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt82" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>83</asp:TableCell>
                                                        <asp:TableCell>¿Los productos químicos están etiquetados adecuadamente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi83" GroupName="chk83"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo83" GroupName="chk83"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt83" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>84</asp:TableCell>
                                                        <asp:TableCell>¿Existen normas establecidas para la utilización de productos químicos peligrosos?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi84" GroupName="chk84"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo84" GroupName="chk84"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt84" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>85</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan mediciones periódicas de la concentración del contaminante?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi85" GroupName="chk85"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo85" GroupName="chk85"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt85" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>86</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan revisiones médicas periódicas a los trabajadores?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi86" GroupName="chk86"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo86" GroupName="chk86"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt86" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>87</asp:TableCell>
                                                        <asp:TableCell>¿ Si se emplean productos tóxicos, ¿ El personal Mantiene condiciones mínimas de higiene? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi87" GroupName="chk87"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo87" GroupName="chk87"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt87" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>88</asp:TableCell>
                                                        <asp:TableCell>¿ Antes de incorporar al proceso productivo una sustancia química, ¿Se informan a los trabajadores sobre la hoja de datos de seguridad del producto? ( donde el proveedor detalla los datos del producto, niveles de toxicidad y acciones a seguir en casos de emergencia)</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi88" GroupName="chk88"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo88" GroupName="chk88"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt88" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Diez -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse10">CONTAMINANTES BIOLÓGICOS</a></h4>
                                        </div>
                                        <div id="collapse10" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>89</asp:TableCell>
                                                        <asp:TableCell>Si se trabaja con manipulación de productos origen animal, laboratorios biológicos y clínicos, hospitales, sanitarios, etc.: ¿Están los aseos, los comedores etc., aislados de la zona de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi89" GroupName="chk89"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo89" GroupName="chk89"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt89" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>90</asp:TableCell>
                                                        <asp:TableCell>¿Se mantienen los lugares de trabajo, vestuarios, baños, comedores, etc., en perfectas condiciones de limpieza y desinfección?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi90" GroupName="chk90"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo90" GroupName="chk90"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt90" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>91</asp:TableCell>
                                                        <asp:TableCell>¿Se mantienen condiciones mínimas de higiene personal? (lavarse las manos antes de comer, no ingresar alimentos al área operativa, cambiarse de ropa al salir del trabajo, etc.)</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi91" GroupName="chk91"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo91" GroupName="chk91"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt91" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Panel Once -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse11">FATIGA FÍSICA</a></h4>
                                        </div>
                                        <div id="collapse11" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>92</asp:TableCell>
                                                        <asp:TableCell>Los esfuerzos realizados en el desarrollo de la labor están adecuados al trabajador (a) respecto a: </asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi92" GroupName="chk92"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo92" GroupName="chk92"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt92" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>93</asp:TableCell>
                                                        <asp:TableCell>¿Su capacidad física?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi93" GroupName="chk93"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo93" GroupName="chk93"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt93" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>94</asp:TableCell>
                                                        <asp:TableCell>¿A la temperatura ambiental?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi94" GroupName="chk94"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo94" GroupName="chk94"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt94" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>95</asp:TableCell>
                                                        <asp:TableCell>¿A su edad?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi95" GroupName="chk95"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo95" GroupName="chk95"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt95" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>96</asp:TableCell>
                                                        <asp:TableCell>¿A su entrenamiento?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi96" GroupName="chk96"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo96" GroupName="chk96"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt96" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>97</asp:TableCell>
                                                        <asp:TableCell>Si el trabajador realiza un trabajo muy pesado ¿ Se le hacen revisiones para controlar la frecuencia cardiaca?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi97" GroupName="chk97"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo97" GroupName="chk97"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt97" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>98</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan una evaluación de consumo metabólico con respecto a la actividad que realiza el trabajador(a)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi98" GroupName="chk98"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo98" GroupName="chk98"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt98" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Doce -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse12">DAÑOS A LA SALUD</a></h4>
                                        </div>
                                        <div id="collapse12" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>99</asp:TableCell>
                                                        <asp:TableCell>¿Se informa sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi99" GroupName="chk99"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo99" GroupName="chk99"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt99" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>100</asp:TableCell>
                                                        <asp:TableCell>¿Se informa de los accidentes de trabajo ocurridos en el último año?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi100" GroupName="chk100"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo100" GroupName="chk100"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt100" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>101</asp:TableCell>
                                                        <asp:TableCell>¿ Se informa  a los trabjadores sobre las causas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi101" GroupName="chk101"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo101" GroupName="chk101"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt101" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>102</asp:TableCell>
                                                        <asp:TableCell>¿La Empresa informa por escrito o por medio de charlas a los trabajadores de los riesgos presentes?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi102" GroupName="chk102"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo102" GroupName="chk102"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt102" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>103</asp:TableCell>
                                                        <asp:TableCell>¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi103" GroupName="chk103"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo103" GroupName="chk103"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt103" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>104</asp:TableCell>
                                                        <asp:TableCell>Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi104" GroupName="chk104"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo104" GroupName="chk104"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt104" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>105</asp:TableCell>
                                                        <asp:TableCell>Ante los Accidentes Laborales ¿Se realiza la investigación del evento?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi105" GroupName="chk105"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo105" GroupName="chk105"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt105" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>106</asp:TableCell>
                                                        <asp:TableCell>¿Se le informa al personal sobre las posibles Enfermedades Ocupacionales detectadas en la Empresa?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi106" GroupName="chk106"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo106" GroupName="chk106"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt106" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>107</asp:TableCell>
                                                        <asp:TableCell>¿Se informa de los accidentes de trabajo ocurridos en el último año?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi107" GroupName="chk107"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo107" GroupName="chk107"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt107" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>108</asp:TableCell>
                                                        <asp:TableCell>¿Se miden y controlan los niveles de contaminación existentes en los puestos de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi108" GroupName="chk108"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo108" GroupName="chk108"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt108" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>109</asp:TableCell>
                                                        <asp:TableCell>Ante las Enfermedades Ocupacionales ¿Se efectúa un estudio de las causas que las originan?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi109" GroupName="chk109"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo109" GroupName="chk109"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt109" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>110</asp:TableCell>
                                                        <asp:TableCell>Ante los Accidentes Laborales ¿Se realiza la investigación del evento?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi110" GroupName="chk110"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo110" GroupName="chk110"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt110" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Trece -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse13">EQUIPOS DE PROTECCIÓN PERSONAL</a></h4>
                                        </div>
                                        <div id="collapse13" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>111</asp:TableCell>
                                                        <asp:TableCell>¿Se dota al personal de Equipos de Protección Personal?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi111" GroupName="chk111"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo111" GroupName="chk111"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt111" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>112</asp:TableCell>
                                                        <asp:TableCell>¿Son adecuados al riesgo que deben proteger?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi112" GroupName="chk112"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo112" GroupName="chk112"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt112" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>113</asp:TableCell>
                                                        <asp:TableCell>¿Son de uso personal?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi113" GroupName="chk113"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo113" GroupName="chk113"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt113" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>114</asp:TableCell>
                                                        <asp:TableCell>¿Se revisan periódicamente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi114" GroupName="chk114"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo114" GroupName="chk114"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt114" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>115</asp:TableCell>
                                                        <asp:TableCell>¿Se exige su uso obligatorio?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi115" GroupName="chk115"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo115" GroupName="chk115"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt115" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>116</asp:TableCell>
                                                        <asp:TableCell>¿Se inspecciona el cumplimiento del uso del equipo de protección?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi116" GroupName="chk116"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo116" GroupName="chk116"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt116" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Catorce -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse14">CAPACITACIÓN O INFORMACIÓN</a></h4>
                                        </div>
                                        <div id="collapse14" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>117</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan capacitaciones respecto a temas de Seguridad y Salud en el Trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi117" GroupName="chk117"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo117" GroupName="chk117"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt117" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>118</asp:TableCell>
                                                        <asp:TableCell>¿Se realizan simulacros de evacuación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi118" GroupName="chk118"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo118" GroupName="chk118"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt118" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>119</asp:TableCell>
                                                        <asp:TableCell>¿La empresa cumple con las señalizaciones de rutas de evacuación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi119" GroupName="chk119"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo119" GroupName="chk119"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt119" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>120</asp:TableCell>
                                                        <asp:TableCell>¿Existe definido un plan de evacuación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi120" GroupName="chk120"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo120" GroupName="chk120"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt120" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>121</asp:TableCell>
                                                        <asp:TableCell>¿Se exige su uso obligatorio?¿Están definidos cuales son los puntos de reunión después de una evacuación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi121" GroupName="chk121"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo121" GroupName="chk121"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt121" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>122</asp:TableCell>
                                                        <asp:TableCell>¿Se capacita al personal sobre el uso correcto de los equipos de extinción?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi122" GroupName="chk122"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo122" GroupName="chk122"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt122" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>123</asp:TableCell>
                                                        <asp:TableCell>¿El personal conoce donde están ubicados los extintores?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi123" GroupName="chk123"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo123" GroupName="chk123"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt123" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>124</asp:TableCell>
                                                        <asp:TableCell>¿Es de conocimiento del personal donde están ubicadas las tomas de manguera para incendio?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi124" GroupName="chk124"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo124" GroupName="chk124"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt124" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>125</asp:TableCell>
                                                        <asp:TableCell>¿Se ha conformado la brigada de emergencia?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi125" GroupName="chk125"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo125" GroupName="chk125"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt125" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Quince -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse15">ASPECTOS PSICOSOCIALES</a></h4>
                                        </div>
                                        <div id="collapse15" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>126</asp:TableCell>
                                                        <asp:TableCell>¿El trabajador tiene algún tipo de control sobre el proceso de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi126" GroupName="chk126"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo126" GroupName="chk126"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt126" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>127</asp:TableCell>
                                                        <asp:TableCell>¿Los Programas a utilizar en sus tareas diarias son fáciles de utilizar?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi127" GroupName="chk127"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo127" GroupName="chk127"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt127" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>128</asp:TableCell>
                                                        <asp:TableCell>¿Se entrena al trabajador (a) para utilizar un nuevo software?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi128" GroupName="chk128"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo128" GroupName="chk128"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt128" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>129</asp:TableCell>
                                                        <asp:TableCell>¿Existe comunicación asertiva entre los trabajadores y el supervisor?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi129" GroupName="chk129"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo129" GroupName="chk129"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt129" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>130</asp:TableCell>
                                                        <asp:TableCell>¿El trabajo está organizado de manera que no se exija simultáneamente varias tareas ?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi130" GroupName="chk130"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo130" GroupName="chk130"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt130" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>131</asp:TableCell>
                                                        <asp:TableCell>¿ Si la tarea requiere de una elevada concentración, se evitan los agentes distractores en el lugar de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi131" GroupName="chk131"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo131" GroupName="chk131"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt131" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>132</asp:TableCell>
                                                        <asp:TableCell>¿ En la organización se evita laborar horas extras luego de la jornada de trabajo?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi132" GroupName="chk132"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo132" GroupName="chk132"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt132" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Dieciseis -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse16">EQUIPOS DE EMERGENCIA</a></h4>
                                        </div>
                                        <div id="collapse16" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>133</asp:TableCell>
                                                        <asp:TableCell>¿Existen equipos Extintores?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi133" GroupName="chk133"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo133" GroupName="chk133"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt133" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>134</asp:TableCell>
                                                        <asp:TableCell>¿Existe botiquín de Primeros Auxilios suficientemente dotado y revisado periódicamente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi134" GroupName="chk134"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo134" GroupName="chk134"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt134" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>135</asp:TableCell>
                                                        <asp:TableCell>¿ Está señalizada la vía de Evacuación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi135" GroupName="chk135"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo135" GroupName="chk135"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt135" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>136</asp:TableCell>
                                                        <asp:TableCell>¿ Existe alumbrado de Emergencia?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi136" GroupName="chk136"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo136" GroupName="chk136"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt136" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Diecisiete -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse17">ASPECTOS LOCATIVOS</a></h4>
                                        </div>
                                        <div id="collapse17" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>137</asp:TableCell>
                                                        <asp:TableCell>¿Son óptimas las condiciones del Techo de la oficina?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi137" GroupName="chk137"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo137" GroupName="chk137"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt137" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>138</asp:TableCell>
                                                        <asp:TableCell>¿ El piso de la instalación se en encuentra en buenas condiciones?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi138" GroupName="chk138"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo138" GroupName="chk138"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt138" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>139</asp:TableCell>
                                                        <asp:TableCell>¿ Las paredes del local  son óptimas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi139" GroupName="chk139"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo139" GroupName="chk139"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt139" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>140</asp:TableCell>
                                                        <asp:TableCell>¿ Las puertas se encuentran en buen estado?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi140" GroupName="chk140"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo140" GroupName="chk140"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt140" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>141</asp:TableCell>
                                                        <asp:TableCell>¿ Las escaleras tienen pasa manos?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi141" GroupName="chk141"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo141" GroupName="chk141"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt141" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>142</asp:TableCell>
                                                        <asp:TableCell>¿ las áreas están señalizadas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi142" GroupName="chk142"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo142" GroupName="chk142"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt142" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>143</asp:TableCell>
                                                        <asp:TableCell>¿ El sitio de trabajo tiene la ventilación adecuada?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi143" GroupName="chk143"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo143" GroupName="chk143"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt143" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                     <!-- Panel Dieciocho -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse18">INSTALACIONES ELÉCTRICAS</a></h4>
                                        </div>
                                        <div id="collapse18" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>144</asp:TableCell>
                                                        <asp:TableCell>¿Es óptimo el Estado de los Cables (Entubado)?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi144" GroupName="chk144"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo144" GroupName="chk144"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt144" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>145</asp:TableCell>
                                                        <asp:TableCell>¿Es óptimo el Estado del toma corriente?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi145" GroupName="chk145"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo145" GroupName="chk145"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt145" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>146</asp:TableCell>
                                                        <asp:TableCell>¿Es óptimo el Estado del Tablero eléctrico?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi146" GroupName="chk146"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo146" GroupName="chk146"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt146" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>147</asp:TableCell>
                                                        <asp:TableCell>¿Es óptimo el estado de los Bombillos/Tubos Fluorescentes?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi147" GroupName="chk147"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo147" GroupName="chk147"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt147" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                      <!-- Panel DieciNueve -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading bg-aqua color-palette">
                                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse19">OTRAS CONDICIONES</a></h4>
                                        </div>
                                        <div id="collapse19" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:Table CssClass="table" runat="server">
                                                    <asp:TableHeaderRow>
                                                        <asp:TableHeaderCell>N°</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Si</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>No</asp:TableHeaderCell>
                                                        <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                                    </asp:TableHeaderRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>148</asp:TableCell>
                                                        <asp:TableCell>¿Las instalaciones usadas para la alimentación son apropiadas?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi148" GroupName="chk148"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo148" GroupName="chk148"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt148" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>149</asp:TableCell>
                                                        <asp:TableCell>¿Se encuentran en estado óptimo de limpieza?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi149" GroupName="chk149"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo149" GroupName="chk149"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt149" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>150</asp:TableCell>
                                                        <asp:TableCell>¿Su ubicación es alejada de depósitos y de áreas que posean riesgo de contaminación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi150" GroupName="chk150"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo150" GroupName="chk150"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt150" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>151</asp:TableCell>
                                                        <asp:TableCell>¿Los espacios sanitarios son adecuados?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi151" GroupName="chk151"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo151" GroupName="chk151"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt151" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>152</asp:TableCell>
                                                        <asp:TableCell>¿Existe disponibilidad de Jabón en los espacios sanitarios?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi152" GroupName="chk152"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo152" GroupName="chk152"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt152" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>153</asp:TableCell>
                                                        <asp:TableCell>¿Existe disponibilidad de papel  higiénico en los espacios sanitarios?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi153" GroupName="chk153"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo153" GroupName="chk153"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt153" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>154</asp:TableCell>
                                                        <asp:TableCell>¿Existen filtros de agua potable en la empresa?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi154" GroupName="chk154"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo154" GroupName="chk154"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt154" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>155</asp:TableCell>
                                                        <asp:TableCell>¿Posee la empresa áreas para el descanso y la recreación?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi155" GroupName="chk155"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo155" GroupName="chk155"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt155" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>156</asp:TableCell>
                                                        <asp:TableCell>¿En las instalaciones sanitarias se mantiene el orden y limpieza?</asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkSi156" GroupName="chk156"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:RadioButton runat="server" id="chkNo156" GroupName="chk156"></asp:RadioButton></asp:TableCell>
                                                        <asp:TableCell><asp:TextBox runat="server" id="txt156" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </div>
                                        </div>
                                    </div>

                                 </div>
                                 <!-- TextAraea de Observaciones -->
                                <h4 class="text-left">Observaciones Generales: </label><br />
                                <asp:TextBox runat="server" id="txtObsGenerales" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox><br />

                             </div>
                             <div class="col-md-1"></div>
                        </div>
                        <asp:PlaceHolder runat="server" id="phGrafica" Visible="False">
                            <div class="row form-group">
                                <div class="col-md-10 col-md-offset-1">
                                    <asp:Table runat="server" CssClass="table">
                                        <asp:TableHeaderRow CssClass="bg-aqua color-palette">
                                            <asp:TableHeaderCell>Total de Condiciones</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Favorable </asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Desfavorable </asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Observaciones</asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell>Sumatoria del total de respuestas</asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server" id="lblSumaSi"></asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server" id="lblSumaNo"></asp:Label></asp:TableCell>
                                            <asp:TableCell><asp:Label runat="server" id="lblResultado"></asp:Label></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                            </div>
                            <!-- Grafica -->
                            <div class="text-center">
                                <asp:Chart id="graficaPie" runat="server" AntiAliasing="Graphics">
                                    <Series>
                                        <asp:Series Name="seriesPie" ChartType="Pie" Legend="Legend1" Label="#PERCENT{P}"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                                <Area3DStyle Enable3D="true" WallWidth="0"/>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                            
                        </asp:PlaceHolder>
                         <!--  Fin de Informacion -->
                    <div class="row" align="center">
                        
                        <div class="col-md-3 col-md-offset-1">
                            <asp:ImageButton id="btnGuardar" runat="server" ImageUrl="~\ico\calculator.png" 
                                OnClick="btnGenerarResultados_Click"/>
                            <h4>Generar Resultados</h4>
                        </div>
                        
                        <asp:PlaceHolder runat="server" id="phDocumento" Visible="false">
                            <div class="col-md-4">
                                <asp:ImageButton id="btnDocumento" runat="server" ImageUrl="~\ico\print.png" 
                                    OnClick="GenerarDocumento"/>
                                <h4>Generar Documento</h4>
                            </div>
                        </asp:PlaceHolder>
                        
                        <asp:PlaceHolder runat="server" id="phDocumento1" Visible="true">
                            <div class="col-md-4"></div>
                        </asp:PlaceHolder>
						
                    </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" id="phNoRegistros" Visible="false">
                        <div class="row form-group">
                            <div class="col-md-8 text-center col-md-offset-2">
                                <strong><h4 class="text-left">No existen trabajadores con reposos registrados.</h4></strong>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                  </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger Controlid="btnDocumento"/>
                </Triggers>
            </asp:updatepanel>

    </div>
</asp:Content>