<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ObligacionNorma.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ObligacionNorma" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:scriptmanager id="ScriptManager1" runat="server" />
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="../Hacer/index_Obligaciones.aspx">Obligaciones</a></li>
                    <li><a href="#">Crear Obligacion Norma</a></li>
                </ol>
                
                <div class="page-header">
                    <h1 class="text-center">Registro de Obligaciones</h1>
                </div>

                <!-- Norma -->
                <div class="row">
                    <h3 class="text-left">Norma:</h3>
                    <br />
                    <asp:label runat="server" text="estatus" id="lbNorma"/>
                </div>
                <br />

                <!-- Medida -->
                <div class="row">
                    <h3 class="text-left">Medida:</h3>
                    <br />
                    <asp:label runat="server" text="estatus" id="lbMedida"></asp:label>
                </div>
                <br />
                <hr />

                <!-- controles-->
                <div class="row text-center">

                    <div class="col-md-3">
                        <h4>Responsable</h4>

                        <asp:dropdownlist id="ddlResponsable" runat="server" cssclass="form-control"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione un responsable para que haga seguimiento de la obligación"></asp:dropdownlist>
                        
                        <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                            setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                            font-bold="true" controltovalidate="ddlResponsable" runat="server"
                            validationgroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-3">
                        <h4>Prioridad</h4>
                
                        <asp:DropDownList runat="server" id="ddlPrioridad" CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione la prioridad que tendrá la obligación">
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
                            title="Seleccione la fecha de entrega que tendrá la obligación"></asp:textbox>
                        
                        <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                            setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                            font-bold="true" controltovalidate="txtFechaFin" runat="server"
                            validationgroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-3">
                        <h4>Estatus</h4>
                
                        <asp:DropDownList runat="server" id="ddlEstatus" CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione el estatus que tendrá la obligación">
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
                            title="Seleccione la actividad del plan de trabajo relacionada con esta obligación"></asp:dropdownlist>

                        <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                            setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                            font-bold="true" controltovalidate="ddlActividad" runat="server"
                            validationgroup="ValidationAdd"/>
                    </div>
                </div>
                <br />

                <!-- descripcion Acciones-->
                <div class="row">
                    <div class="col-md-6">
                        <h4>Descripcion</h4>
                        <asp:textbox id="txtDesc" runat="server" textmode="multiline" rows="5" class="form-control"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Ingrese la descripción de la obligación"></asp:textbox>

                        <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                            setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                            font-bold="true" controltovalidate="txtDesc" runat="server"
                            validationgroup="ValidationAdd"/>
                    </div>
                    <div class="col-md-6">
                        <h4>Acciones</h4>

                        <asp:textbox id="txtAcciones" runat="server" textmode="multiline" rows="5" class="form-control"
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
                            onclick="Volver"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Presione para volver a las medidas"/>
                    </div>
                </div>
    
            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>