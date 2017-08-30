<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="SGSSTC.source.sistema.Consulta.create" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    
    
    <div class="col-md-8 col-md-offset-2" id="zonaPrint">

        <script>
            function imprimir() {
                    w = window.open();
                    w.document.write($('#zonaPrint').html());
                    w.print();
                    w.close();
            }

        </script>
        
        <div class="row col-md-12 text-center">
            <h3>Registro de Historia Médica</h3>
        </div><br />
        
        
        <div class="page-header">
            <h1 class="text-center">Tipo de Consulta</h1>
        </div>

        <div class="row text-right col-md-12">
            <asp:Button runat="server" id="btnImprimir" Text="Imprimir" CssClass="btn btn-default" OnClick="GenerarDocumento"></asp:Button>

        </div><br />
        
        <asp:PlaceHolder runat="server" id="phEmpresa">
            <div class="row">
                <div class="col-md-5">
                    <label>Empresa: </label>
                    <asp:DropDownList runat="server" id="ddlEmpresas" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa"></asp:DropDownList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlEmpresas" runat="server" 
                        ValidationGroup="ValidationAdd"/>
                </div>
            </div><br />
        </asp:PlaceHolder>
        
        <div class="row col-md-12 text-left">
                <asp:CheckBoxList runat="server" RepeatColumns="2" id="chkTipoConsulta">
                    <asp:ListItem Text="Consulta Breve" Value="Consulta Breve"></asp:ListItem>
                    <asp:ListItem Text="Reingreso" Value="Reingreso"></asp:ListItem>
                    <asp:ListItem Text="Consulta por Reubicación" Value="Consulta por Reubicación"></asp:ListItem>
                    <asp:ListItem Text="Adaptación de Puesto de Trabajo" Value="Adaptación de Puesto de Trabajo"></asp:ListItem>
                </asp:CheckBoxList>
            </div><br />
        
        <div class="row">
            <div class="col-md-6">
                <label class="text-left col-md-4 ">Servicio Médico</label>
                <asp:TextBox  runat="server" id="txtServicioMedico" CssClass="col-md-8" PlaceHolder="Servicio Medico"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtServicioMedico" runat="server" 
                        ValidationGroup="ValidationAdd"/>
            </div>
            <div class="col-md-6">
                <label class="text-left col-md-4 ">Fecha</label>
                <asp:TextBox runat="server" id="txtFecha" CssClass="col-md-8" PlaceHolder="yyyy-MM-dd"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtFecha" runat="server" 
                        ValidationGroup="ValidationAdd"/>
            </div>
        </div><br />
        
        <div class="row">
            <div class="col-md-6">
                <label class="col-md-4 text-left">Médico</label>
                <asp:TextBox runat="server" id="txtMedico" CssClass="col-md-8" PlaceHolder="Médico"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtMedico" runat="server" 
                        ValidationGroup="ValidationAdd"/>
            </div><br />
        </div><br />
        
        <div class="row col-md-12">
            <div class="text-left"><strong>Datos Personales</strong></div>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                <div class="col-md-4">Nombre</div>
                <div class="col-md-8"><asp:Label runat="server" id="lblNombre"></asp:Label></div>

            </div>
            <div class="col-md-4">
                <div class="col-md-4">Edad</div>
                <div class="col-md-8"><asp:Label runat="server" id="lblEdad"></asp:Label></div>

            </div>
            <div class="col-md-4">
                <div class="col-md-4">Cédula</div>
                <div class="col-md-8"><asp:Label runat="server" id="lblCedula"></asp:Label></div>

            </div>
        </div><br />
        
        <div class="row col-md-12" style="height:200px; border-bottom:solid 1px #000; border-top:solid 1px #000;">
                <div class="col-md-6" style="border-right:solid 1px #000;">
                    <div class="text-center">Fecha de inicio de enfermedad que refiere</div>
                </div>
                <div class="col-md-6">
                    <div class="text-center">Carga Actual/ Resumen de actividades</div>
                </div>
            </div>
        
        <div class="row col-md-12 text-left" style="height:150px;">
                <label class="text-left">Enfermedad Actual</label>
            </div>
        
        <div class="row col-md-12 text-left" style="height:150px;">
            <label class="text-left">Indique si tiene algún tratamiento médico</label>

        </div>
        
        <div class="row text-left" style="height:150px;">
            <div class="col-md-12">
                <label class="text-left">Examen Físico General</label>
            </div>
            <div class="col-md-12">
                <label class="text-left">Estado General</label>

            </div>
            <div class="col-md-12" style="border-bottom:solid 1px #000;">
                <div class="col-md-6">
                    <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Temperatura</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>°C</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Tensión Arterial</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>mmHg</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Peso</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>kg</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" style="border-left:solid 1px #000;">
                        <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Pulso</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>Lat/min</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Respiración</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>Resp/min</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 text-left">
                                <label>Talla</label>
                            </div>
                            <div class="col-md-2 text-right">
                                <label>cm</label>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="row col-md-12 text-left" style="height:150px;">
                    <label class="text-left">Impresión Diagnóstica</label>
                    <asp:TextBox runat="server" id="txtDiagnostico" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtDiagnostico" runat="server" 
                        ValidationGroup="ValidationAdd"/>
                </div>
            <div class="row col-md-12 text-left" style="height:150px;">
                    <label class="text-left">Sugerencias/ Recomendaciones/ Tratamiento</label>
                    <asp:TextBox runat="server" id="txtSugerencias" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtSugerencias" runat="server" 
                        ValidationGroup="ValidationAdd"/>
                </div>
            <div class="row col-md-12 text-left">
                    <label class="text-left"><strong>Consentimiento informado</strong></label><br />
                    <p class="text-justify">Declaro que de acuerdo a mis conocimientos he respondido completa y correctamente a todas las preguntas y acato las recomendaciones, sugerencias y tratamiento emitido por el equipo médico. Solicito al servicio de salud y seguridad en el trabajo de la empresa a que se realice una evaluación médica ocupacional de carácter preventivo y los examenes de laboratorio e imágenes para diagnostico de eventuales afecciones físicas y mentales. De igual forma autorizo al departamento de riesgo y continuidad operativa a preservar y resguardar los resultados de los examenes que se han practicado con el fin de crear mi historia medica en el archivo llevado por el servicio de medicina ocupacional de la empresa, solicitud que hago en conformidad con el preceptuado en el numeral del articulo 53 de la ley organica de prevención, condiciones y medio ambiente de trabajo.</p>
                </div>
            <div class="row col-md-12">
                    <asp:Label runat="server" id="lblCedulaFirma" Text="Cédula de Identidad:" CssClass="text-left"></asp:Label>
                </div><br />
            <div class="row col-md-12">
                    <asp:Label runat="server" id="Label1" Text="Firma del Paciente: _____________________________________" CssClass="text-left"></asp:Label>
                </div><br />
            <div class="row text-center col-md-12">
                    <asp:Button runat="server" id="btnGuardar" Text="Guardar:" CssClass="btn btn-default" OnClick="GuardarRegistro" ValidationGroup="ValidationAdd"></asp:Button>
                </div>
        </div>
    </div>
    
    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
</asp:Content>