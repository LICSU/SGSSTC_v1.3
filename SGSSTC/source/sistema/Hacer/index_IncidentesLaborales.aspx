<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_IncidentesLaborales.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_IncidentesLaborales" %>

<%@ Register Src="~/source/WebUserControl/ucHeader.ascx" TagPrefix="uch" TagName="ucHeader" %>
<%@ Register Src="~/source/WebUserControl/ucFooter.ascx" TagPrefix="ucf" TagName="ucFooter" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<uch:ucHeader runat="server" id="ucHeader"/>

<form id="form1" runat="server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>

            <div class="external-event bg-danger">Hacer</div>

            <div class="row">
                <h1 class="text-info text-center">Incidentes Laborales</h1>
            </div><br />
            
            <div class="row">
                <div class="col-md-2"></div>

                <div class="col-md-6">
                    <asp:TextBox id="txtSearch" runat="server" class="form-control" PlaceHolder="Ingrese nombre o apellido del afectado"></asp:TextBox>
                </div>
                  
                <div class="col-md-2">
                    <asp:Button id="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>

                <div class="col-md-2"></div>
            </div><br />
            <div class="row">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-3">
                        <label>Empresa</label>
                        <asp:DropDownList id="ddlEmpresa" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                    <div class="col-md-3">
                        <label>Sucursal</label>
                        <asp:DropDownList id="ddlSucursal" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <div class="col-md-3">
                        <label>Fecha Inicial</label>
                        <asp:TextBox id="txtFechaInicio" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                    </div>
                <div class="col-md-3">
                        <label>Fecha Final</label>
                        <asp:TextBox id="txtFechaFin" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                    </div>
            </div><br/>
            
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
                    <asp:TemplateField HeaderText="Id Incidente" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="id" runat="server" Text='<%# Eval("id_acc_lab") %>'/></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha del Incidente" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc") %>'/></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Afectado" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="afectado" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Empresa" visible="true" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:HiddenField runat="server" id="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>
                                <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                            </ItemTemplate>
                    </asp:TemplateField>
                                       
                    <asp:ButtonField  HeaderText="Subir Escaneado" CommandName="Subir" ButtonType="Image" ImageUrl="~\ico\upload.png" HeaderStyle-CssClass="text-center">
                        <ControlStyle></ControlStyle>
                    </asp:ButtonField>

                    <asp:TemplateField HeaderText="Ver" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:HyperLink id="hlEscaneado" runat="server" ImageUrl="~\ico\viewFile.png" Target = "_blank" NavigateUrl='<%# Eval("documento_escaneado") %>'>Ver Archivo </asp:HyperLink>
                            </ItemTemplate>
                    </asp:TemplateField>

                    <asp:ButtonField HeaderText="Acciones"  HeaderStyle-CssClass="text-center" CommandName="Ver" ButtonType="Image" ImageUrl="~\ico\view.png">
                        <ControlStyle></ControlStyle>
                    </asp:ButtonField>

                    <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                        <ControlStyle></ControlStyle>
                    </asp:ButtonField>
                    
                </Columns>
            </asp:GridView>
                    </div>
                </div>
            </div><br />
            
            <asp:PlaceHolder runat="server" id="phAgregar" Visible="false">
            <div class="row" align="center">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <a href="NuevoIncidente.aspx"><img src ='../../../ico/agregar.png'><h4 class="text-info">Nuevo Incidente</h4></a>
                &nbsp;&nbsp;&nbsp;</div>
                <div class="col-md-3">
                    <asp:ImageButton id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" OnClick="MostrarModalImprimir"/>
                    <h4 class="text-info">Descargar Lista</h4>
                </div>
                <div class="col-md-3"></div>
            </div>
            </asp:PlaceHolder> 
             
        </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:updatepanel>

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
                                <asp:HiddenField id="hdfIDDel" runat="server"/>
                                   
                                <div class="row">
                                    <h4 class="text-info text-center">¿Seguro desea eliminar este registro?</h4>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-4"><asp:Button id="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                    <div class="col-md-2"></div>
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
    <div id="EscaneadoModal" class="modal fade">
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
                                    <div>
                                        <label class="col-md-4 control-label">Archivo: </label>
                                        <div class="col-md-6">
 <asp:FileUpload id="flEscaneado" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>
                                        </div>
                                    </div>
                                </div>
                                <br/>
                            
                             </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-4"><asp:Button id="btnEscaneado" runat="server" Text="Subir Archivo" class="btn btn-block btn-info" OnClick="btnSubirArchivo"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                    <div class="col-md-2"></div>
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
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <asp:Button id="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
                                </div>
                                <div class="col-md-3"></div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <asp:Button id="btnPrintExcel" runat="server" Text="Imprimir en Excel" class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div>
                                <div class="col-md-3"></div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <asp:Button id="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
                                </div>
                                <div class="col-md-3"></div>
                            </div><br/>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                <div class="col-md-4"></div>
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

</form>

<ucf:ucFooter runat="server" id="ucFooter"/>

