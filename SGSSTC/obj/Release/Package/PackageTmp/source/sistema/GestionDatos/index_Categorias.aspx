<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Categorias.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Categorias" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>

    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <div class ="container" style="width:100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="#">Categorías</a></li>
                </ol>
                
                <div class="page-header">
                    <h1 class="text-center">Categorías</h1>
                </div>
            
                <div class="row"> 

                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el Categoria a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div><br />

                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div><br />
                </asp:PlaceHolder>
            
                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" 
                                class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false" 
                                AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                                onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                                EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="Id Categoria" Visible="false" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="id" runat="server" Text='<%# Eval("id_categorias") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Descripción" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("descripcion") %>'/></ItemTemplate>
                                    </asp:TemplateField> 
                    
                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" id="HFid_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>
                                            <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 

                                    <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                    
                                    <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                </Columns>

                            </asp:GridView>

                        </div>
                    </div>
                </div><br />

                <asp:PlaceHolder runat="server" id="phAgregarCat">
                    <div class="row" align="center">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar"/>
                            <h4>Nueva Categoria</h4>
                        </div>
                    </div>
                </asp:PlaceHolder>

            </div>

            </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Registro</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Nombre</h4>

                                    <asp:TextBox id="txtNombre" MaxLength="100" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el nombre de la categoria"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombre" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Descripcion</h4>

                                    <asp:TextBox id="txtDescripcion" MaxLength="500" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la descripción de la categoria"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtDescripcion" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>
                            
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-center">Empresa</h4>

                                        <asp:DropDownList id="ddlEmpresaAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                        OnClick="Guardar" ValidationGroup="ValidationAdd"/>
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Registro</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfEditID" runat="server"/>
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Nombre</h4>

                                    <asp:TextBox id="txtNombreEdit" MaxLength="100" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el nombre de la categoria"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Descripción</h4>

                                    <asp:TextBox id="txtDescripcionEdit" MaxLength="500" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la descripción de la categoria"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtDescripcionEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                            
                            <asp:PlaceHolder runat="server" id="phEmpresaEdit" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-center">Empresa</h4>

                                        <asp:DropDownList id="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
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
                    <Triggers></Triggers>
                </asp:updatepanel>
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

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
</asp:Content>