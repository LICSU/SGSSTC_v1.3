<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Index_Extintor.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Index_Extintor" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            

                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="#">Extintor</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Extintores</h1>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" 
                            runat="server" class="form-control" PlaceHolder="Ingrese el Extintor a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" 
                            runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>
                
                <br />

                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" class="form-control" AutoPostBack="true"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"                                  
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" class="form-control" AutoPostBack="true"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"                                  
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-3">
                        <h4 class="text-center">Área</h4>
                        <asp:DropDownList runat="server" id="ddlArea" class="form-control" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" 
                            OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
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
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="extintor_id" runat="server" Text='<%# Eval("id_extintor") %>'/> 
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Serial" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="serial_extintor" runat="server" Text='<%# Eval("serial_extintor") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Ultima Recarga" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="fecha_ultima_recarga" runat="server" Text='<%# Eval("fecha_ultima_recarga", "{0:dd/MM/yyyy}") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Proxima Recarga" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="fecha_proxima_recarga" runat="server" Text='<%# Eval("fecha_proxima_recarga", "{0:dd/MM/yyyy}") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="area_id" runat="server" Text='<%# Eval("id_area") %>' Visible="false"/>
                                            <asp:Label id="area" runat="server" Text='<%# Eval("area") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                    
                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                    
                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                </div>
                <br />

                <div class="row" align="center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:PlaceHolder Visible="true" id="phAgregar" runat="server">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                                OnClick="AgregarRegistroModal"/>
                            <h4>Nuevo Extintor</h4>
                        </asp:PlaceHolder>
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Extintor</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Serial de Extintor</h4>

                                    <asp:TextBox id="txtSerial" MaxLength="100" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el serial del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtSerial" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>

                                <div class="col-md-6">
                                    <h4>Tipo de Extintor</h4> 

                                    <asp:DropDownList id="ddlTipoExt" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Seleccione el tipo de extintor">
                                        <asp:ListItem Text="Tipo A" Value="A"></asp:ListItem>
                                        <asp:ListItem Text="Tipo B" Value="B"></asp:ListItem>
                                        <asp:ListItem Text="Tipo C" Value="C"></asp:ListItem>
                                        <asp:ListItem Text="Tipo D" Value="D"></asp:ListItem>
                                        <asp:ListItem Text="Tipo ABC" Value="ABC"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlTipoExt" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>

                            <asp:PlaceHolder runat="server" Visible="false" id="phEmpresaAdd">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Empresa</h4> 

                                        <asp:DropDownList id="ddlEmpresaAdd" runat="server" ClientIDMode="Static" 
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                            CssClass="form-control" AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" Visible="false" id="phSucursalAdd">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>Sucursal</h4>

                                        <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control" AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>

                                </div>
                            </asp:PlaceHolder>
                            
                            <div class="row">
                                <div class="col-md-6">
                                <h4>Seleccione el Área</h4>

                                <asp:DropDownList id="ddlAreaAdd" runat="server" ClientIDMode="Static" 
                                    CssClass="form-control"
                                    data-toggle="tooltip" data-placement="bottom" 
                                    title="Seleccione el área a la cual pertenece el extintor"></asp:DropDownList>

                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                    setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                    Font-Bold="true" ControlToValidate="ddlAreaAdd" runat="server" 
                                    ValidationGroup="ValidationAdd"/>
                            </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Última Recarga</h4>

                                    <asp:TextBox id="txtFechaUltRec" runat="server" ClientIDMode="Static" TextMode="Date" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la fecha en que se realizó la ultima recarga del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaUltRec" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Próxima Recarga</h4>

                                    <asp:TextBox id="txtFechaProxRec" runat="server" ClientIDMode="Static" TextMode="Date" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la fecha en que se realizará la proxima recarga del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaProxRec" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Peso</h4> 

                                    <asp:TextBox id="txtPeso" MaxLength="10" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el peso del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtPeso" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
 
                                <div class="col-md-6">
                                    <h4>Presion</h4> 

                                    <asp:TextBox id="txtPresion" MaxLength="10" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la presión del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtPresion" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Empresa que recargo</h4> 

                                    <asp:TextBox id="txtNombreEmpresa" MaxLength="50" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la empresa que reccargó el extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreEmpresa" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
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
                    <h3>Editar Extintor</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            
                            <asp:HiddenField id="hdfExtintorIDEdit" runat="server"/>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="text-center">Serial de Extintor</h4>

                                    <asp:TextBox id="txtSerialEdit" MaxLength="100" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el serial del extintor"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtSerialEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>

                                <div class="col-md-6">
                                    <h4 class="text-center">Tipo de Extintor</h4>

                                    <asp:DropDownList id="ddlTipoExtEdit" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Seleccione el tipo de extintor">
                                        <asp:ListItem Text="Tipo A" Value="A"></asp:ListItem>
                                        <asp:ListItem Text="Tipo B" Value="B"></asp:ListItem>
                                        <asp:ListItem Text="Tipo C" Value="C"></asp:ListItem>
                                        <asp:ListItem Text="Tipo D" Value="D"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlTipoExtEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                            
                            <asp:PlaceHolder runat="server" Visible="false" id="phEmpresaEdit">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Empresa</h4> 
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlEmpresaEdit" 
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" 
                                            runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" Visible="false" id="phSucursalEdit">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="text-center">Sucursal</h4>
                                        
                                        <asp:DropDownList id="ddlSucursalEdit" 
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                            runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlSucursalEdit_SelectedIndexChanged"></asp:DropDownList>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>
                                    
                                </div>
                            </asp:PlaceHolder>

                            
                            <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="text-center">Seleccione el Área</h4>

                                        <asp:DropDownList id="ddlAreasEdit" runat="server" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Seleccione el área a la cual pertenece el extintor"></asp:DropDownList>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                            ControlToValidate="ddlAreasEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                    </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="text-center">Fecha de Ultima Recarga</h4>

                                    <asp:TextBox id="txtFechaUltRecEdit" TextMode="Date" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la fecha en que se realizó la ultima recarga del extintor"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaUltRecEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>

                                <div class="col-md-6">
                                    <h4 class="text-center">Fecha de Proxima Recarga</h4>

                                    <asp:TextBox id="txtFechaProxRecEdit" TextMode="Date" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la fecha en que se realizará la proxima recarga del extintor"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaProxRecEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="text-center">Peso</h4>

                                    <asp:TextBox id="txtPesoEdit" runat="server" MaxLength="10" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el peso del extintor"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtPesoEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>

                                <div class="col-md-6">
                                    <h4 class="text-center">Presion</h4>

                                    <asp:TextBox id="txtPresionEdit" runat="server" MaxLength="10" ClientIDMode="Static" CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la presión del extintor"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtPresionEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-12">
                                    <h4 class="text-center">Nombre de la Empresa que recargo</h4>

                                    <asp:TextBox id="txtNombreEmpresaEdit" MaxLength="50" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la empresa que recargó el extintor"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreEmpresaEdit" runat="server" 
                                        ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnEditar" runat="server" Text="Editar" class="btn btn-block btn-info" 
                                        OnClick="EditarRegistro" ValidationGroup="ValidationEdit"/>
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
                                <asp:HiddenField id="hdfExtintorIDDel" runat="server"/>
                                
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?
                                </h4>
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