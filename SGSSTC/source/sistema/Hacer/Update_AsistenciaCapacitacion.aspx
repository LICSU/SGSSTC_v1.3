<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_AsistenciaCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_AsistenciaCapacitacion" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
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


    <div class="modal fade" id="Msjmodal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h4 class="modal-title">
                        <label id="lblMsjTitle1"></label>
                    </h4>
                </div>
                <div class="modal-body form-group">
                    <div class="row">
                        <div class="col-md-1">
                            <span id="icoModal1" class="fa fa-times fa-2x text-danger"></span>
                        </div>
                        <div class="col-md-11">
                            <label id="lblMsjModal1"></label>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- /modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
	
</asp:Content>