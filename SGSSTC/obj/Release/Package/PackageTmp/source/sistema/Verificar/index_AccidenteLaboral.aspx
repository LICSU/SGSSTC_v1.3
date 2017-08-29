<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_AccidenteLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.index_AccidenteLaboral" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Verificar</a></li>
                    <li><a href="#">Accidentes Laborales</a></li>
                </ol>
            
                <div class="page-header">
                    <h1 class="text-center">Accidentes Laborales</h1>
                </div>

                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese nombre o apellido del afectado"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>

                <br />

                <div class="row text-center">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <label>Filtrar por Empresa</label>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                        <div class="col-md-3">
                            <label>Filtrar por Sucursal</label>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <div class="col-md-3">
                            <label>Filtrar por Area</label>
                            <asp:DropDownList runat="server" id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                
                    <div class="col-md-3">
                        <label>Fecha Inicio</label>
                        <asp:TextBox runat="server" id="txtFechaInicio" CssClass="form-control" TextMode="Date" 
                            placeholder="yyyy-MM-dd" AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                    </div>

                    <div class="col-md-3">
                        <label>Fecha Fin</label>
                        <asp:TextBox runat="server" id="txtFechaFin" CssClass="form-control" TextMode="Date" 
                            placeholder="yyyy-MM-dd" AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                    </div>
                </div>

                <br />
            
                <div class="row" style="overflow:auto;">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                                OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                
                            <Columns>
                                <asp:TemplateField HeaderText="Id Accidente" visible ="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="id" runat="server" Text='<%# Eval("id_at_it_el_pa") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField HeaderText="Fecha del Accidente" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc", "{0:dd/MM/yyyy}") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField HeaderText="Afectado" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="afectado" runat="server" Text='<%# Eval("Afectado") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="lbArea" runat="server" Text='<%# Eval("area") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="N° Consultas" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="consulta" runat="server" Text='<%# Eval("consulta") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Empresa" visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="lbreporte_accidente" runat="server" Text='<%# Eval("reporte_accidente") %>' visible="false"/>
                                        <asp:Label id="lbComunicado" runat="server" Text='<%# Eval("documento_comunicado") %>' visible="false"/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField  HeaderText="Subir Soportes" CommandName="Subir" ButtonType="Image" HeaderStyle-CssClass="text-center" 
                                    ImageUrl="~\ico\upload.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField  HeaderText="Ver Soportes" CommandName="scan" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\viewFile.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                    
                                <asp:ButtonField  HeaderText="Descargar Comunicado" CommandName="Comunicado" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\comunicado.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Ver" CommandName="Ver" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField> 

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\delete.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField> 

                                 <asp:ButtonField HeaderText="Asignar Consultas" CommandName="consulta" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                     ImageUrl="~\ico\addConsulta.png">
                                    <ControlStyle></ControlStyle>
                                 </asp:ButtonField>
                            </Columns>
                        </asp:GridView> 
                    </div>
                </div>
            </div>
            <br />

                <div class="row" align="center">
                    <asp:PlaceHolder runat="server" id="phAgregar">
                        <div class="col-md-3 col-md-offset-3">
                            <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="btn_Agregar"/>
                            <h4>Nuevo Accidente Laboral</h4>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-3">
                        <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" OnClick="MostrarModalImprimir"/>
                        <h4>Descargar Lista</h4>
                    </div>
                </div>

            </div>
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

    <!-- Print Modal -->
    <div id="printModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Descargar Lista</h3>
                </div>

                <asp:updatepanel id="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintWord" runat="server" Text="Imprimir en Word" 
                                        class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintExcel" runat="server" Text="Imprimir en Excel" 
                                        class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintPdf" runat="server" Text="Imprimir en PDF" 
                                        class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
                                </div>
                            </div><br/>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
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
    
    <!-- print lista Modal-->
    <div id="PrintListaModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Imprimir Registro</h3>
                    </div>
                    
                    <div class="modal-body form-group">
                        <asp:HiddenField id="hImprimir" runat="server"/>
                        
                        <div class="row">
                            <h4 class="text-center">¿Seguro desea imprimir este registro?</h4>
                        </div>
                    </div>
                    
                    <div class="modal-footer">
                                <div class="row">

                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btPrint" runat="server" Text="Imprimir" AutoPostBack="true"
                                            class="btn btn-block btn-info" OnClick="btPrint_Click"/>
                                    </div>

                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" 
                                        aria-hidden="true">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Eliminar Registro</h3>
                </div>
                
                <asp:updatepanel id="upDel" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfIDDel" runat="server"/>
                            
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" 
                                        OnClick="EliminarRegistro"/>
                                </div>
                                
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
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

    <!-- Escaneado Modal -->
    <div id="EscaneadoModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Archivo Escaneado</h3>
                </div>
                <asp:updatepanel id="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:HiddenField id="hdfIDEsc" runat="server"/>

                                <div class="row">
                                    <label class="col-md-4 control-label">Soporte Comunicado: </label>
                                    <div class="col-md-6">
                                        <asp:FileUpload id="fuComunicado" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"></asp:FileUpload>
                                    </div>
                                </div><br/>

                                <div class="row">
                                    <label class="col-md-4 control-label">Soporte Reporte de Accidente: </label>
                                    <div class="col-md-6">
                                        <asp:FileUpload id="fuReporte" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"></asp:FileUpload>
                                    </div>
                                </div><br/>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btnEscaneado" runat="server" Text="Subir Archivo" 
                                            class="btn btn-block btn-info" OnClick="btnSubirArchivo"/>
                                    </div>

                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        
                        </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnEscaneado"/>
                    </Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- VerDoc Modal -->
    <div id="VerDocModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Ver Documentos Escaneados</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfVerDoc" runat="server"/>
                                                        
                            <div class="row">
                                <label class="col-md-6 control-label">Ver Soporte Comunicado: </label>
                                <div class="col-md-6">
                                    <asp:HyperLink id="hplComunicado" runat="server" Target = "_blank" ImageUrl="~\ico\viewFile.png"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <label class="col-md-6 control-label">Ver Soporte Reporte de Accidente: </label>
                                <div class="col-md-6">
                                    <asp:HyperLink id="hplReporte" runat="server" Target = "_blank" ImageUrl="~\ico\viewFile.png"/>
                                </div>
                            </div><br/>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="col-md-4 col-md-offset-4">
                                <button class="btn btn-block btn-info" data-dismiss="modal" aria-hidden="true">Cerrar</button>

                            </div>
                        </div>
                    
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- AsginarConsultas Modal -->
    <div id="AsigConModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Asignar Consultas</h3>
                </div>

                <asp:updatepanel id="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfAsigCon" runat="server"/>
                            
                            <div class="row">
                                <label class="col-md-6 control-label">Trabajador: </label>
                                <div class="col-md-6">
                                    <asp:label id="lbTrabajadorEdit" runat="server"></asp:label>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <label class="col-md-6 control-label">Fecha del Accidente: </label>
                                
                                <div class="col-md-6">
                                    <asp:label id="lbFechaAccEdit" runat="server"></asp:label>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <label class="col-md-6 control-label">Nùmero de Consultas: </label>
                                
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" TextMode="Number" id="txtNumConsultas" CssClass="form-control" 
                                        PlaceHolder="# de Consultas"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNumConsultas" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />
                            
                            <div class="row">
                                <label class="col-md-6 control-label">Frecuencia de Consultas: </label>
                                
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" TextMode="Number" id="txtFeConsultas" CssClass="form-control" 
                                        PlaceHolder="Frecuencia"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtFeConsultas" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">                                
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnAsigcon" runat="server" Text="Asignar" class="btn btn-block btn-info" 
                                        OnClick="btnAsigcon_Click" ValidationGroup="ValidationEdit"/>
                                </div>
                                
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger Controlid="btnAsigcon" EventName="Click"/>
                    </Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" ID="ucMsjModal"/>
</asp:Content>