<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PlanillaEntregaEpp.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PlanillaEntregaEpp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    

    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Planilla de Entrega de EPP</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Planilla de Entrega de EPP</h1>
            </div>
            
            <div class="row">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-3">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                <div class="col-md-3">
                    <h4 class="text-center">Trabajador</h4>
                    <asp:TextBox id="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1" 
                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                        TargetControlid="txtTrabajador" id="AutoCompleteExtender1" runat="server" 
                        FirstRowSelected = "false" 
                        CompletionListCssClass="completionList"
                        CompletionListItemCssClass="listItem"
                        CompletionListHighlightedItemCssClass="itemHighlighted">
                        </cc1:AutoCompleteExtender>
                </div>
                 <div class="col-md-3">
                    <h4 class="text-center">&nbsp;</h4>
                    <asp:Button runat="server" id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" Text="Buscar" CssClass="btn btn-default" OnClick="btnGenerar_OnClick" />
                </div>
            </div><br />

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination"/>
                        <asp:GridView 
                            id="GridView1" 
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false" 
                            AllowPaging="true"
                            PageSize="10" 
                            OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <rowstyle  HorizontalAlign="Center"/>
                            
                            <Columns>
                                <asp:TemplateField visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="id_entrega_epp" runat="server" Text='<%# Eval("id_entrega_epp") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Fecha de Subida" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="Label1" runat="server" Text='<%# Eval("fecha_subida") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                
                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                
                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="sucursal" runat="server" Text='<%# Eval("sucursal") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="trabajador" runat="server" Text='<%# Eval("trabajador") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Consultar" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ImageUrl="~\ico\view.png" NavigateUrl='<%# Eval("ruta") %>' Target="_blank">Descargar</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                    
                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div><br />

            <div class="row" align="center">
                <div class="col-md-4 col-md-offset-2">
                    <asp:PlaceHolder Visible="true" id="phAgregar" runat="server">
                        <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalCrear"/>
                        <h4>Crear Documento</h4>
                    </asp:PlaceHolder>
                </div>
                <div class="col-md-4">
                    <asp:PlaceHolder Visible="true" id="PlaceHolder1" runat="server">
                        <asp:ImageButton alt="-" runat="server" ImageUrl="~\ico\upload.png" OnClick="MostrarModalAgregar"/>
                        <h4>Subir Documento</h4>
                    </asp:PlaceHolder>
                </div>
            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Documento</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate> 
                                            
                        <div class="modal-body form-group">
                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Nombre: </label>
                                    <div class="col-md-6"> 
                                        <asp:TextBox id="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombre" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                         </div>
                                </div>
                                </div><br />
                                                        
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Empresa: </label> 
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlEmpresaAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"  runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" id="phSucursalAdd">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Sucursal: </label> 
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" AutoPostBack="true" 
                                                OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged"></asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/></div>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Trabajador: </label>
                                    <div class="col-md-6">
                                        <asp:DropDownList id="ddlTrabajadorAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlTrabajadorAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Archivo: </label>
                                    <div class="col-md-6">
                                        <asp:FileUpload id="flpArchivo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="flpArchivo" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            </div><br/>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2"><asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd"/></div>
                                <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                            </div>
                        </div>
                    
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnAdd"/>
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
                            <asp:HiddenField id="hdfIDDel" runat="server"/>
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2"><asp:Button id="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro"/></div>
                                <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>