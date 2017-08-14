<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Obligaciones.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Obligaciones" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>

    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">
            
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="#">Obligaciones</a></li>
                </ol>
                
                
                <div class="page-header">
                    <h1 class="text-center">Obligaciones</h1>

                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" 
                            PlaceHolder="Ingrese la obligacion a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" 
                            OnClick="BuscarRegistro"/>
                    </div>
                </div>
                <br />

                <!-- Filtro 1 -->
                <div class="row">                
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3 col-md-offset-4">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                </div>
                <br />

                <div class="row">                
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Responsable</h4>
                        <asp:DropDownList runat="server" CssClass="form-control" id="ddlResponsable" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlResponsable_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                
                    <div class="col-md-3">
                        <h4 class="text-center">Categoria</h4>
                        <asp:DropDownList runat="server" CssClass="form-control" id="ddlCategoria" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                
                    <div class="col-md-3">
                        <h4 class="text-center">Prioridad</h4>
                        <asp:DropDownList runat="server" CssClass="form-control" id="ddlPrioridad" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlPrioridad_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                            <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                            <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
            
                <!-- Filtro  2-->
                <div class="row">
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-center">Estatus</h4>
                        <asp:DropDownList runat="server" CssClass="form-control" id="ddlEstatus" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlEstatus_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Iniciado" Value="Iniciado"></asp:ListItem>
                            <asp:ListItem Text="En Proceso" Value="En Proceso"></asp:ListItem>
                            <asp:ListItem Text="Terminado con Exito" Value="Terminado con Exito"></asp:ListItem>
                            <asp:ListItem Text="Terminado sin Exito" Value="Terminado sin Exito"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                
                    <div class="col-md-3">
                        <h4 class="text-center">Fecha inicio: </h4>
                        <asp:TextBox id="txtFechaInicio" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date" 
                          AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                    </div>

                    <div class="col-md-3">
                        <h4 class="text-center">Fecha fin: </h4>
                        <asp:TextBox id="txtFechaFin" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date" 
                          AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                    </div>

                </div>
                <br />

                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                                onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                                EmptyDataText="No existen Registros">
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:label id="id_responsable" runat="server" Text='<%# Eval("id_responsable") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Id Obligacion" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id_obligacion" runat="server" Text='<%# Eval("id_obligacion") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Empresa" Visible="false">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" id="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>
                                            <asp:Label id="lbempresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Descripción">
                                        <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("descripcion") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Fecha Entrega">
                                        <ItemTemplate><asp:Label id="FechaEntrega" runat="server" Text='<%# Eval("fecha_entrega","{0:dd/MM/yyyy}") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Responsable">
                                        <ItemTemplate><asp:Label id="Responsable" runat="server" Text='<%# Eval("responsable") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Estatus">
                                        <ItemTemplate><asp:Label id="Estatus" runat="server" Text='<%# Eval("estatus") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Categoria">
                                        <ItemTemplate><asp:Label id="Categoria" runat="server" Text='<%# Eval("categoria") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Prioridad">
                                        <ItemTemplate><asp:Label id="Prioridad" runat="server" Text='<%# Eval("prioridad") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:ButtonField HeaderText="Acciones" CommandName="Ver" ButtonType="Image" ImageUrl="~\ico\view.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                    
                                    <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                    
                                </Columns>
                        
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />

            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

    <!-- view Modal -->
    <div id="viewModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Obligacion</h3>
                </div>
                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        
                        <div class="container" style="width: 100%;">
                            <div class="modal-body form-group">
                                <asp:HiddenField id="HiddenField1" runat="server"/>
                            
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Fecha de Entrega:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewFecha" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Responsable:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewResp" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />
                            
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 id="lbMedida" class="control-label" runat="server"></h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewMedida" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Categoria:</h4>
                                    </div>
                                    <div class="col-md-8">                                    
                                        <asp:Label id="txtViewCategoria" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />
                            
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Prioridad:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewPrioridad" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Frecuencia de Control:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewFrecuencia" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />
 
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Estatus:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewEstatus" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />
                            
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Descripción:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewDesc" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Acciones:</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label id="txtViewAcciones" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>

                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Obligacion</h3>
                </div>
                
                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfObligacionID" runat="server"/>
                            
                            <div class="row">
                                <label class="col-md-4 control-label">Fecha de Entrega: </label>
                                <div class="col-md-6">
                                    <asp:TextBox id="txtFechaEdit" type="date" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />

                            <div class="row">
                                <label class="col-md-4 control-label">Responsable:</label>
                                
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlResponsableEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"></asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlResponsableEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />
                            
                            <div class="row">
                                <label class="col-md-4 control-label">Categoria:</label>
                                
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlCategoriaEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"></asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlCategoriaEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />
                            
                            <div class="row">
                                <label class="col-md-4 control-label">Prioridad:</label>
                                
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlPrioridadEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                                        <asp:ListItem Text="Media" Value="Media"></asp:ListItem>
                                        <asp:ListItem Text="Baja" Value="Baja"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlPrioridadEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />

                            <div class="row">
                                <label class="col-md-4 control-label">Frecuencia de Control:</label>
                                
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlFrecuenciaEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"></asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlFrecuenciaEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />
 
                            <div class="row">
                                <label class="col-md-4 control-label">Estatus:</label>
                                
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlEstatusEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Iniciado" Value="Iniciado"></asp:ListItem>
                                        <asp:ListItem Text="En Proceso" Value="En Proceso"></asp:ListItem>
                                        <asp:ListItem Text="Terminado con Exito" Value="Terminado con Exito"></asp:ListItem>
                                        <asp:ListItem Text="Terminado sin Exito" Value="Terminado sin Exito"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlEstatusEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />
                            
                            <div class="row">
                                <label class="col-md-4 control-label">Descripción</label>
                                
                                <div class="col-md-6">
                                    <asp:TextBox id="txtDescEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDescEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br />

                            <div class="row">
                                <label class="col-md-4 control-label">Acciones: </label>
                                <div class="col-md-6">
                                    <asp:TextBox id="txtAccionesEdit" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtAccionesEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">                                
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" 
                                        OnClick="EditarRegistro" ValidationGroup="ValidationEdit"/>
                                </div>
                                
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>
                <asp:updatepanel id="upDel" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                            <asp:HiddenField id="hdfObligacionIDDel" runat="server"/>
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
    <!--Delete Record Modal Ends here -->

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
</asp:Content>