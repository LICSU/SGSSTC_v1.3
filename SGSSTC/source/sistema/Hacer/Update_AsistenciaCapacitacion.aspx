<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" 
     CodeBehind="Update_AsistenciaCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_AsistenciaCapacitacion" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel id="MyUpdatePanel" runat="server" >
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="../Hacer/index_GestionLaboral.aspx">Gestión Laboral</a></li>
                    <li><a href="#">Editar Asistencia Capacitaciones</a></li>
                </ol>

                <div class="page-header">
                        <h1 class="text-center">Asistencia Capacitaciones</h1>
                    </div>
                
                <div class="row">
                        <div class="col-md-5">
                            <label>Trabajador:</label><br />
                            <asp:BulletedList id="chkAsistencia" runat="server"></asp:BulletedList>
                        </div>
                        <div class="col-md-7">
                            <label>Asistencia:</label><br />
                            <asp:Panel id="panelAsistencia" runat="server"></asp:Panel>
                        </div>
                    </div>
                
                <br />
                
                <hr />

                <!-- Boton-->
                <div class="row"> 
                        <div class="col-md-2 col-md-offset-4">
                            <asp:Button runat="server" id="btPrintSave" Text="Guardar" 
                                class="btn btn-block btn-info" OnClick="btPrintSave_Click"></asp:Button>
                        </div>
                    </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID = "btPrintSave"/>
        </Triggers>
    </asp:updatepanel>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
	
</asp:Content>