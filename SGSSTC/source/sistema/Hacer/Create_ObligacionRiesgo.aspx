<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ObligacionRiesgo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ObligacionRiesgo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_Obligaciones.aspx">Obligaciones</a></li>
            <li><a href="#">Crear Obligacion Riesgo</a></li>
        </ol>
        
        <div class="page-header">
            <h1 class="text-center">Registro de Obligaciones</h1>
        </div>

        <!-- Tipo de Riesgo -->
        <div class="row">
            <h3 class="text-left">Tipo de Riesgo:</h3>
            <h4 class="text-left">
                <asp:label runat="server" text="estatus" id="lbTipoRiesgo"></asp:label>
            </h4>
        </div>
        <br />

        <!-- Factor de Riesgo -->
        <div class="row">
            <h3 class="text-left">Factor de Riesgo:</h3>
            <h4 class="text-left">
                <asp:label runat="server" text="estatus" id="lbFactorRiesgo"></asp:label>
            </h4>
        </div>
        <br />

        <!-- Medida -->
        <div class="row">
            <h3 class="text-left">Medida:</h3>
            <h4 class="text-left">
                <asp:label runat="server" text="estatus" id="lbMedida"></asp:label>
            </h4>
        </div>
        <br />
        <hr />

        <!-- controles-->
        <div class="row text-center">
            <div class="col-md-3">
                <h4>Responsable</h4>
                <asp:dropdownlist runat="server" cssclass="form-control" id="ddlResponsable"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione un responsable para la obligación"></asp:dropdownlist>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlResponsable" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>

            <div class="col-md-3">
                <h4>Prioridad</h4>
                
                <asp:DropDownList runat="server" id="ddlPrioridad" CssClass="form-control"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione una prioridad para la obligación">
                    <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                    <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                    <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                    <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                </asp:DropDownList>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlPrioridad" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>

            <div class="col-md-3">
                <h4>Fecha Entrega: </h4>
                <asp:textbox id="txtFechaFin" runat="server" class="col-md-10" cssclass="form-control" textmode="Date"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Ingrese uan fecha de entrega para la obligación"></asp:textbox>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="txtFechaFin" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>

            <div class="col-md-3">
                <h4>Estatus</h4>
                
                <asp:DropDownList runat="server" id="ddlEstatus" CssClass="form-control"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione un estatus para la obligación">
                    <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                    <asp:ListItem Text="Iniciado" Value="Iniciado"></asp:ListItem>
                    <asp:ListItem Text="No Iniciado" Value="No Iniciado"></asp:ListItem>
                    <asp:ListItem Text="En Ejecución" Value="En Ejecución"></asp:ListItem>
                    <asp:ListItem Text="Terminado con Éxito" Value="Terminado con Éxito"></asp:ListItem>
                    <asp:ListItem Text="Terminado con Falla" Value="Terminado con Falla"></asp:ListItem>
                </asp:DropDownList>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlEstatus" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>
        </div>
        <br />

        <!-- controles-->
        <div class="row text-center">
            <div class="col-md-3">
                <h4>Categoria</h4>
                <asp:dropdownlist runat="server" cssclass="form-control" id="ddlCategoria"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione una categoría para la obligación"></asp:dropdownlist>
                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlCategoria" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>

            <div class="col-md-3">
                <h4>Frecuencia control</h4>
                <asp:dropdownlist runat="server" cssclass="form-control" id="ddlFrecuencia"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione una frecuencia para la obligación"></asp:dropdownlist>
                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlFrecuencia" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>

            <div class="col-md-6">
                <h4>
                    Actividad del Plan de Trabajo del Año 
                    <asp:label runat="server" id="lbAnho"></asp:label>
                </h4>

                <asp:dropdownlist runat="server" cssclass="form-control" id="ddlActividad"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Seleccione una actividad del plan de trabajo relacionada con la obligación"></asp:dropdownlist>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlActividad" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>
        </div>
        <br />

        <!-- descripcion   Acciones-->
        <div class="row">
            <div class="col-md-6">
                <h4>Descripcion</h4>
                <asp:textbox id="txtDesc" runat="server" textmode="multiline" rows="4" class="form-control"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Ingrese la descripción de la obligación"></asp:textbox>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="txtDesc" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>
            <div class="col-md-6">
                <h4>Acciones</h4>
                <asp:textbox id="txtAcciones" runat="server" textmode="multiline" rows="4" class="form-control"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Ingrese las acciones a realizar de la obligación"></asp:textbox>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="txtAcciones" runat="server"
                    validationgroup="ValidationAdd"/>
            </div>
        </div>
        <br />

        <!-- guardar-->
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <asp:button text="Registrar" id="btnAgregar" runat="server" class="btn btn-block btn-info" 
                    onclick="AgregarRegistro" validationgroup="ValidationAdd"
                    data-toggle="tooltip" data-placement="bottom" 
                    title="Presione para registrar la obligación"/>
            </div>
            <div class="col-md-3">
                <asp:button text="Cancelar" id="btnVolver" runat="server" class="btn btn-block btn-default" 
                    onclick="Volver" data-toggle="tooltip" data-placement="bottom" 
                    title="Presione para volver a las medidas"/>
            </div>
        </div>

        <!-- Msj Modal -->
        <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

    </div>
</asp:Content>