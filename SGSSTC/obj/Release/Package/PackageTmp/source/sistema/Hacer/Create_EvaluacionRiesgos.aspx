﻿<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_EvaluacionRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_EvaluacionRiesgos" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="../Hacer/index_EvaluacionRiesgo.aspx">Evaluación de Riesgos</a></li>
                    <li><a href="#">Crear Evaluación de Riesgos</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Nueva Evaluación de Riesgo Laboral</h1>
                </div>
                
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Sucursal</h4>
                        <asp:Label runat="server" id="txtSucursal"></asp:Label>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Área</h4>
                        <asp:Label runat="server" id="txtArea"></asp:Label>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Puesto de Trabajo</h4>
                        <asp:Label runat="server" id="txtPuestos"></asp:Label>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Descripción Puesto de Trabajo</h4>
                        <asp:Label runat="server" id="txtDescripcionPuesto"></asp:Label>
                    </div>
                </div>
                
                <hr />

                <div class="row">
                    <div class="col-md-12">
                        <h3 class="text-center">Identificación del Peligro</h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Tipo de Riesgo</h4>
                        <asp:Label id="txtTipoRiesgo" runat="server"></asp:Label>

                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Factor de Riesgo</h4>
                        <asp:Label id="txtFactorRiesgo" type="date" runat="server"></asp:Label>
                    </div>
                </div>  
                
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Posibles Consecuencias</h4>
                        <asp:Label id="txtConsecuencias" runat="server"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las posibles consecuencias que tiene este Riesgo"></asp:Label>
                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Tiempo de Exposición</h4>
                        <asp:Label id="txtTiempoExposicion" runat="server"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese el tiempo de exposición que tiene este Riesgo"></asp:Label>

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
                        <h4 class="text-left">Medidas en la Fuente</h4>
                        <asp:textbox id="txtControlFuente" MaxLength="5000" runat="server" TextMode="multiline" class="form-control" 
                            Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las medidas en la fuente para este Riesgo"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <h4 class="text-left">Medidas en el Medio</h4>
                        <asp:textbox id="txtControlMedio" MaxLength="5000" runat="server" TextMode="multiline" class="form-control" 
                            Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las medidas en el medio para este Riesgo"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <h4 class="text-left">Medidas en el Individuo</h4>
                        <asp:textbox id="txtControlIndividuo" MaxLength="5000" runat="server" TextMode="multiline" class="form-control" 
                            Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las medidas en el individuo para este Riesgo"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Responsable del SGSST</h4>
                        <asp:TextBox id="txtResponsableSGSST" CssClass="form-control" runat="server"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese el responsable de la evaluacion de este Riesgo"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtResponsableSGSST" runat="server" ValidationGroup="ValidationAdd"/>

                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Fecha de Evaluación</h4>
                        <asp:TextBox id="txtFechaEvaluacion" type="date" CssClass="form-control" runat="server"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese la fecha de la evaluacion de este Riesgo"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtFechaEvaluacion" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-left">Nivel de Deficiencia</h4>
                        
                        <asp:dropdownlist   runat="server" id="ddlNivelDeficiencia" CssClass="form-control"
                            AutoPostBack="true" OnSelectedIndexChanged="CalculoProbabilidad_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione el nivel de deficiencia de este Riesgo">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Muy alto" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Alto" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Medio" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Bajo" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlNivelDeficiencia" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-6">
                        <h4 class="text-center">Interpretación del Nivel de Deficiencia</h4>
                        <asp:Label id="txtInterpretacionNivelDeficiencia" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                </div>

                <br />
                
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-left">Nivel de Exposición</h4>
                        
                        <asp:dropdownlist   runat="server" id="ddlNivelExposicion" CssClass="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="CalculoProbabilidad_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione el nivel de exposición para este Riesgo">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Continua" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Frecuente" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Ocasional" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Esporádica" Value="1"></asp:ListItem>
                         </asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlNivelExposicion" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-6">
                        <h4 class="text-center">Interpretación del Nivel de Exposición</h4>
                        <asp:Label id="txtInterpretacionNivelExposicion" runat="server" Text="Sin Calcular"></asp:Label>

                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-left">Nivel de Probabilidad</h4>
                        <asp:Label id="txtNivelProbabilidad" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>

                    <div class="col-md-6">
                        <h4 class="text-center">Interpretación del Nivel de Probabilidad</h4>
                        <asp:Label id="txtInterpretacionNivelProbabilidad" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <h4 class="text-left">Nivel de Consecuencia</h4>
                        
                        <asp:dropdownlist   runat="server" id="ddlNivelConsecuencia" CssClass="form-control"
                            AutoPostBack="true" OnSelectedIndexChanged="CalculoNivelRiesgo_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione el nivel de consecuencia para este Riesgo">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Mortal o catastrófico(M)" Value="100"></asp:ListItem>
                            <asp:ListItem Text="Muy grave (MG)" Value="60"></asp:ListItem>
                            <asp:ListItem Text="Grave (G)" Value="25"></asp:ListItem>
                            <asp:ListItem Text="Leve (L)" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlNivelConsecuencia" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-6">
                        <h4 class="text-center">Interpretación del Nivel de Consecuencia</h4>
                        <asp:Label id="txtInterpretacionNivelConsecuencia" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-1 col-md-offset-2">
                        <h4 class="text-left">Nivel de Riesgo</h4>
                        
                        <asp:Label id="txtNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <h4 class="text-left">Valor del Nivel de Riesgo</h4>
                        
                        <asp:Label id="txtValorNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h4 class="text-center">Interpretación del Nivel de Riesgo</h4>
                        <asp:Label id="txtInterpretacionNivelRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4 class="text-left">Aceptabilidad de Riesgo</h4>
                        
                        <asp:Label id="txtAceptabilidadRiesgo" runat="server" Text="Sin Calcular"></asp:Label>
                    </div>
                </div>
                
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
                        <h4 class="text-left">Trabajadores</h4>
                        <asp:TextBox id="txtPlanta" type="number" CssClass="form-control" runat="server" AutoPostBack="true" 
                            OnTextChanged="txtPersonalExpuesto_TextChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese el N° de trabajdores expuestos para este Riesgo"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtPlanta" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                    <div class="col-md-4">
                        <h4 class="text-left">Contratistas</h4>
                        <asp:TextBox id="txtContratistas" type="number" CssClass="form-control" runat="server" AutoPostBack="true" 
                            OnTextChanged="txtPersonalExpuesto_TextChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese el N° de contratistas expuestos para este Riesgo"></asp:TextBox>

                    </div>
                </div>

                <div class ="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Visitantes</h4>
                        <asp:TextBox id="txtVisitantes" type="number" CssClass="form-control" runat="server" AutoPostBack="true" 
                            OnTextChanged="txtPersonalExpuesto_TextChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese el N° de visitantes expuestos para este Riesgo"></asp:TextBox>

                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Total</h4>
                        <asp:Label id="txtTotalPersonalExpuesto" runat="server" Text="Sin Calcular"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Este es el totoal de personas expuestas de este Riesgo"></asp:Label>
                    </div>
                </div>
                <br />
                
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4 class="text-left">Peor Consecuencia</h4>
                        <asp:TextBox id="txtPeorConsecuencia" CssClass="form-control" runat="server"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese la peor consecuencia que podría tener este Riesgo"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtPeorConsecuencia" runat="server" ValidationGroup="ValidationAdd"/>
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
                        <h4 class="text-left">Eliminación</h4>

                        <asp:TextBox id="txtEliminación" CssClass="form-control" runat="server" MaxLength="5000"  
                            TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las medidas de elminicación de este Riesgo"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Sustitución</h4>
                        <asp:TextBox id="txtSustitución" CssClass="form-control" runat="server" MaxLength="5000"  
                            TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese las medidas de sustitución de este Riesgo"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Controles de Ingeniería</h4>
                        <asp:TextBox id="txtIngenieria" CssClass="form-control" runat="server" MaxLength="5000"  
                            TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese los controles de ingeniería de este Riesgo"></asp:TextBox>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Controles Administrativos</h4>
                        <asp:TextBox id="txtAdministrativos" CssClass="form-control" runat="server" MaxLength="5000"  
                            TextMode="multiline" Rows="8" data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese los controles administrativos de este Riesgo"></asp:TextBox>
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Fecha de Ejecución</h4>
                        <asp:TextBox id="txtFechaEjecucion" type="date" CssClass="form-control" runat="server" 
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese la fecha de ejecución de las medidas para este Riesgo"></asp:TextBox>
                    </div>
                </div>
                <br />

                <hr />
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="text-center">Equipos de Proteccion Personal del Puesto de Trabajo</h3>
                    </div>
                    
                    <asp:Label id="txtEpp" runat="server" data-toggle="tooltip" data-placement="bottom" 
                        title="Equipos de proteccion personal asociados al puesto de trabajo que está asociado riesgo"></asp:Label>
                </div>
                <br />
                <hr />
                
                <!-- Boton-->
                <div class="row">
                    
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button id="btPrintSave" runat="server" Text="Guardar" class="btn btn-block btn-info" 
                            OnClick="btPrintSave_Click" ValidationGroup="ValidationAdd" data-toggle="tooltip" data-placement="bottom" 
                            title="Presione para registrar esta evaluación de Riesgo"/>
                    </div>
                </div>
                <br />

            </div>

        </ContentTemplate>
    </asp:updatepanel>
</asp:Content>