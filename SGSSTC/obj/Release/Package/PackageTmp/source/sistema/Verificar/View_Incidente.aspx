<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="View_Incidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.View_Incidente" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>

    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <div class="container" style="width: 100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Verificar</a></li>
                    <li><a href="../Verificar/index_IncidenteLaboral.aspx">Incidentes Laborales</a></li>
                    <li><a href="#">consultar Incidente Laboral</a></li>
                </ol>
            
                <div class="page-header">
                        <h1 class="text-center">Consultar Incidente Laboral</h1>
                    </div>
                        
                <div class="row">
                
                    <div class="col-md-10 col-md-offset-1">
                        <div class="row">
                            <asp:PlaceHolder runat="server" id="phEmpresa">
                                <div class="col-md-4">
                                    <h4 class="text-left">Empresa</h4>
                                    <asp:Label id="lbEmpresa" runat="server" Text="Label"></asp:Label>
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                                <h3>Sucursal</h3> 
                                <div class="col-md-4">
                                    <asp:Label id="lbSucursal" runat="server" Text="Label"></asp:Label>
                                </div>
                            </asp:PlaceHolder>
                        </div>
                    
                        <br />
            
                        <!-- Información del Incidente -->
                        <div class="row">
                            <h3>Información del Incidente</h3>

                            <div class="col-md-4">
                                <h4 class="text-left">Fecha del Incidente</h4>
                                <asp:Label id="txtFechaAcc" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <h4 class="text-left">Hora del Incidente</h4>
                                <asp:Label id="txtHoraAcc" runat="server" Text="Label"></asp:Label>
                            </div>

                        </div>
                        <br />
                    
                        <!-- Información de la Persona Afectada-->
                        <div class="row">
                            <h3>Información de la Persona Afectada</h3>

                            <div class="col-md-4">
                                <h4 class="text-left">Trabajador</h4>
                                <asp:Label id="lbTrabajador" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <h4 class="text-left">Area</h4>
                                <asp:Label id="lbArea" runat="server" Text="Label"></asp:Label>

                            </div>

                            <div class="col-md-4">
                                <h4 class="text-left">Puesto de Trabajo</h4>
                                <asp:Label id="lbPuestoTrabajo" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="text-left">Sitio donde se presentó el caso.</h4>
                                <asp:Label id="txtSitioIncidente" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <h4 class="text-left">Breve descripción de los hechos</h4>
                                <asp:Label id="txtDescTarea" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <br />
                    
                        <!-- CondicionesInseguras-->
                        <div class="row">
                            <h3>CAUSAS INMEDIATAS - Condiciones Inseguras</h3>
                            <div class="col-md-12">
                                <asp:Label id="txtCondIns" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                                        
                        <!-- Actos Inseguros-->
                        <div class="row">
                            <h3>CAUSAS INMEDIATAS - Actos Inseguros</h3>
                            <div class="col-md-12">
                                <asp:Label id="txtActos" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>

                        <!-- Factores del Trabajo -->
                        <div class="row">
                            <h3>CAUSAS BÁSICAS - Factores del Trabajo</h3>
                            <div class="col-md-12">
                                <asp:Label id="txtFacTrab" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>

                        <!-- Factores Personales -->
                        <div class="row">
                           <h3>CAUSAS BÁSICAS - Factores Personales</h3>
                            <div class="col-md-12">
                                <asp:Label id="txtFactPersonales" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <br />


                        <!-- Magnitud del evento -->
                        <div class="row">
                            <h3>Magnitud del Evento</h3>

                            <div class="col-md-3">
                                <h5>Días de incapacidad.</h5>
                                <asp:Label id="txtDiasIncapacidad" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="col-md-3">
                                <h5>Días cargados.</h5>
                                <asp:Label id="txtDiasCargados" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="col-md-3">
                                <h5>Días perdidos por ausencia del trabajo.</h5>
                                <asp:Label id="txtDiasPerdidosAusTrab" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <br />

                        <div class="row">

                            <div class="col-md-3">
                                <h5>Días perdidos por actividad restringida.</h5>
                                <asp:Label id="txtDiasPerdidosctRest" runat="server" Text="Label"></asp:Label>
                            </div>

                            <div class="col-md-3" align="center">
                                <h5>Sin Tiempo Perdido.</h5>
                                <asp:Label id="chkSinDias" runat="server" Text="Label"></asp:Label>
                            </div>
                        
                            <div class="col-md-3">
                                <h5>Tipo de enfermedad </h5>
                                <asp:Label id="lbTipoEnfermedad" runat="server" Text="Label"></asp:Label>
                            </div>

                        </div>
                        <br />

                        <!-- Anexos-->
                        <div class="row">
                            <h3>Soportes fotográficos</h3>
                            <div class="col-md-6">
                                <asp:Panel id="pSoportes" runat="server"></asp:Panel>
                            </div>
                        </div>

                    </div>
                </div>
            
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

</asp:Content>