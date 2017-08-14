<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Usuario.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Usuario" %>
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
                    <li><a href="#">Usuario</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Usuario</h1>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el Usuario a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>
                <br />

                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                CssClass="form-control" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                         </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control"></asp:DropDownList>
                         </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phRol" Visible="false">
                        <div class="col-md-3">
                            <h4 class="text-center">Rol</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlRol1" CssClass="form-control" OnSelectedIndexChanged="ddlRol_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
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
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>

                                <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="id_usuario" runat="server" Text='<%# Eval("id_usuario") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Usuario" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="login" runat="server" Text='<%# Eval("login") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Rol" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="rol" runat="server" Text='<%# Eval("rol") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    
                                 <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="sucursal" runat="server" Text='<%# Eval("Sucursal") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="empresa" runat="server" Text='<%# Eval("Empresa") %>'/>
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
                </div>
                <br />
                
                <asp:PlaceHolder runat="server" id="phAgregar">
                    <div class="row" align="center">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                                OnClick="AgregarRegistroModal"/>
                            <h4>Nuevo Usuario</h4>
                        </div>
                    </div>
                </asp:PlaceHolder>

            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Usuario</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        
                        <div class ="container" style="width:100%;">
                            
                            <div class="modal-body form-group text-left">

                                <asp:PlaceHolder runat="server" Visible="true" id="phEmpresaAdd">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h4>Empresa</h4>

                                            <asp:DropDownList id="ddlEmpresaAdd" runat="server" ClientIDMode="Static" CssClass="form-control" 
                                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
                                        
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                                ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" Visible="true" id="phSucursalAdd">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h4>Sucursal</h4>

                                            <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" 
                                              AutoPostBack="true" OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged"></asp:DropDownList>
                                        
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                                ControlToValidate="ddlSucursalAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Trabajador</h4>

                                        <asp:DropDownList id="ddlTrabajadorAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el trabajador asociado al usuario"></asp:DropDownList>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlTrabajadorAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Rol</h4>

                                        <asp:DropDownList id="ddlRolAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el rol que tendrá el usuario"></asp:DropDownList>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlRolAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Login</h4>

                                        <asp:TextBox id="txtLogin" runat="server" ClientIDMode="Static" CssClass="form-control" 
                                            MaxLength="500"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre de usuario"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtLogin" 
                                            runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                             
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Clave</h4>

                                        <asp:TextBox id="txtClave" TextMode="Password" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control" MaxLength="500"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la contraseña del usuario, 
                                            La Contraseña solo debe contener Letras Minúsculas, Mayúsculas y Números, debe contener de 4 a 16 
                                            caracteres"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtClave" 
                                            runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Confirmar Clave</h4>

                                        <asp:TextBox id="txtClaveConf" TextMode="Password" runat="server" ClientIDMode="Static" 
                                            MaxLength="500" CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese de nuevo la contraseña"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="txtClaveConf" runat="server" ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                            
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                        OnClick="AgregarRegistro" ValidationGroup="ValidationAdd"/>
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
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
                    <h3>Editar Usuario</h3>
                </div>
                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        
                        <div class ="container" style="width:100%;">
                            <div class="modal-body form-group text-left">
                                <asp:HiddenField id="hdfUsuarioID" runat="server"/>
                            
                                <asp:PlaceHolder runat="server" Visible="true" id="phEmpresaEdit">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h4>Empresa</h4>

                                            <asp:DropDownList id="ddlEmpresaEdit" runat="server" ClientIDMode="Static" CssClass="form-control" 
                                                AutoPostBack="true"
                                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa"  
                                                OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged"></asp:DropDownList>
                                        
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                                ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            
                                <asp:PlaceHolder runat="server" Visible="true" id="phSucursalEdit">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h4>Sucursal</h4>

                                            <asp:DropDownList id="ddlSucursalEdit" runat="server" ClientIDMode="Static" 
                                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                                CssClass="form-control" AutoPostBack="true" 
                                                OnSelectedIndexChanged="ddlSucursalEdit_SelectedIndexChanged"></asp:DropDownList>
                                        
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                                ControlToValidate="ddlSucursalEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Trabajador</h4>

                                        <asp:DropDownList id="ddlTrabajadorEdit" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el trabajador asociado al usuario"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlTrabajadorEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Rol</h4>

                                        <asp:DropDownList id="ddlRolEdit" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el rol que tendrá el usuario"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlRolEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>
                            
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Login</h4>

                                        <asp:TextBox id="txtLoginEdit" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control" MaxLength="500"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre de usuario"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="txtLoginEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Clave Actual</h4>
                                    
                                        <asp:TextBox id="txtClaveActual" style="width: 100%;" TextMode="Password" runat="server"
                                            ClientIDMode="Static" MaxLength="500" CssClass="form-control" autocomplete="off" 
                                            autocorrect="off" autocapitalize="off" spellcheck="false" 
                                            class="login-field login-field-password"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la contraseña actual del usuario"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="txtClaveActual" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Clave</h4>

                                        <asp:TextBox id="txtClaveEdit" TextMode="Password" runat="server" ClientIDMode="Static" 
                                            MaxLength="500" CssClass="form-control" autocomplete="off" autocorrect="off" 
                                            autocapitalize="off" spellcheck="false"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la contraseña del usuario, 
                                            La Contraseña solo debe contener Letras Minúsculas, Mayúsculas y Números, debe contener de 4 a 16 
                                            caracteres"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="txtClaveEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>
                            
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Confirmar Clave</h4>

                                        <asp:TextBox id="txtClaveEditConf" TextMode="Password" runat="server" ClientIDMode="Static" MaxLength="500"
                                            CssClass="form-control" autocomplete="off" autocorrect="off" autocapitalize="off" 
                                            spellcheck="false"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese de nuevo la contraseña"></asp:TextBox>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="txtClaveEditConf" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>

                <asp:updatepanel id="upDel" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfUsuarioIDDel" runat="server"/>
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