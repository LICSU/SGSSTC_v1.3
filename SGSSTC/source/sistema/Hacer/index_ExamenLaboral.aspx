<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ExamenLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ExamenLaboral" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Examen Laboral</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Examenes Laborales</h1>
            </div>
            
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el examen a buscar"></asp:TextBox>
                </div>
                  
                <div class="col-md-2">
                    <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>
            </div>
			
			<br />
            
            <div class="row">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-left">Empresa</h4>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                
                <div class="col-md-3">
                    <h4 class="text-left">Tipo de Examen</h4>
                    <asp:DropDownList runat="server" id="ddlTipoExamen" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoExamen_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <h4 class="text-left">Fecha Inicio</h4>
                    <asp:TextBox runat="server" id="txtFechaInicio" TextMode="Date" AutoPostBack="true" 
                        class="form-control" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>
                
                <div class="col-md-3">
                    <h4 class="text-left">Fecha Fin</h4>
                    <asp:TextBox runat="server" id="txtFechaFin" TextMode="Date" AutoPostBack="true" 
                        class="form-control" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap"><ucpag:pagination runat="server" id="pagination"/>
                        
                        <asp:GridView id="GridView1" 
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false" 
                            AllowPaging="true"
                            PageSize="10" 
                            OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" 
                            EmptyDataText="No existen Registros">
                            <rowstyle  HorizontalAlign="Center"/>
                
                <Columns>
                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Label id="id" runat="server" Text='<%# Eval("Empresa") %>'/>
                            <asp:Label id="id_his_cli_ocu" Visible="false" runat="server" Text='<%# Eval("id_his_cli_ocu") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="trabajador" runat="server" Text='<%# Eval("trabajador") %>'/></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Tipo de Examen" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("tipo_exa") %>'/></ItemTemplate>
                    </asp:TemplateField> 
                    
                    <asp:TemplateField HeaderText="Fecha de Examen" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="Label1" runat="server" Text='<%# Eval("fecha_exa") %>'/></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                        <ControlStyle></ControlStyle>
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
                    </div>
                </div>
            </div><br />
            
            <div class="row" align="center">
                <div class="col-md-3 col-md-offset-3">
                    <asp:PlaceHolder runat="server" id="phAgregar">
                        <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar"/>
                        <h4>Agregar</h4>
                    </asp:PlaceHolder>
                </div>
                <div class="col-md-3">
                    <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" 
                                     data-toggle="modal" data-target="#printModal"/>
                    <h4>Descargar Lista</h4>
                </div>  
            </div>
        </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:updatepanel>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Registro</h3>
                </div>
                <asp:updatepanel id="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                
                                <div class="row">
                                    <div>
                                        <asp:HiddenField id="hdfEditID" runat="server"/>
                                        <label class="col-md-4 control-label">Nombre: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                         </div>
                                    </div>
                                </div>
                                <br/>
                                   
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Descripcion: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                         </div>
                                    </div>
                                </div>
                                      
                             </div>
                            <div class="modal-footer">
                                <asp:Label id="Label4" Visible="false" runat="server"></asp:Label>
                                <asp:Button id="btnEditar" runat="server" Text="Guardar" CssClass="btn-default"/>
                                <button class="btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger Controlid="btnEditar"/>
                        </Triggers>
                    </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Eliminar Registro</h3>
                </div>
                <asp:updatepanel id="upDel" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                ¿Seguro desea eliminar este registro?
                                <asp:HiddenField id="hdfIDDel" runat="server"/>
         
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2"><asp:Button id="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro"/></div>
                                    <div class="col-md-4"><button data-dismiss="modal" aria-hidden="true" class="btn btn-block btn-info">Cerrar</button></div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger Controlid="btnDelete" EventName="Click"/>
                        </Triggers>
                    </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Print Modal -->
    <div id="printModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Imprimir Lista</h3>
                </div>

                <asp:updatepanel id="UpdatePanel3" runat="server">
                        <ContentTemplate> 
                            <div class="modal-body form-group">

                                <div class="row"> 
                                    <div class="col-md-6 col-md-offset-3">
                                        <asp:Button id="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
                                    </div> 
                                </div><br/>

                                <div class="row"> 
                                    <div class="col-md-6 col-md-offset-3">
                                        <asp:Button id="btnPrintExcel" runat="server" Text="Imprimir en Excel" class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                    </div> 
                                </div><br/>
                            
                                <div class="row"> 
                                    <div class="col-md-6 col-md-offset-3">
                                        <asp:Button id="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
                                    </div> 
                                </div><br/>
                            </div>

                                <div class="modal-footer">
                                   <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
								    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>

								    </div>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger Controlid="btnPrintWord"/>
                                <asp:PostBackTrigger Controlid="btnPrintExcel"/>
                                <asp:PostBackTrigger Controlid="btnPrintPdf"/>
                            </Triggers>
                        </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
</asp:Content>