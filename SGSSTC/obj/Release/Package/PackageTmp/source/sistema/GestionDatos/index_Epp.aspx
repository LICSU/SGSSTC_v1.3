<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Epp.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Epp" %>

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
                    <li><a href="#">Epp</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Equipo de Protección Personal</h1>
                </div>

                
                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el EPP a buscar"></asp:TextBox>
                    </div>
              
                    <div class="col-md-2">
                        <asp:Button id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>
                
                <br />

                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-4">
                        <h4 class="text-center">Tipo EPP</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" id="ddlTipoEpp" CssClass="form-control" 
                            OnSelectedIndexChanged="ddlTipoEpp_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
                
                <br />
            
                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                                onpageindexchanging="GridView1_PageIndexChanging" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                                <Columns>

                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id_epp" runat="server" Text='<%# Eval("id_epp") %>'/>
                                            <asp:Label id="id_tipo_epp" runat="server" Text='<%# Eval("id_tipo_epp") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                         
                                    <asp:TemplateField HeaderText="Tipo" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="tipo" runat="server" Text='<%# Eval("tipo") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 


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

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar EPP</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox id="txtNombreAdd" runat="server" ClientIDMode="Static" MaxLength="100"
                                        CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNombreAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd" Visible="False">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Empresa</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlEmpresaAdd" 
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                            runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div><br/>
                            </asp:PlaceHolder>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Tipo Epp</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:DropDownList id="ddlTipoEppAdd" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"></asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="ddlTipoEppAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnRegistrar" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                    OnClick="AgregarRegistro" ValidationGroup="ValidationAdd"/>
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnRegistrar"/>
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
                    <h3>Editar EPP</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">

                            <asp:HiddenField id="hdfIdEppEdit" runat="server"/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:TextBox id="txtNombreEdit" runat="server" ClientIDMode="Static" MaxLength="100"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br/>
                            
                            <asp:PlaceHolder runat="server" id="phEmpresaEdit" Visible="False">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Empresa</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control" ></asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div><br/>
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Tipo Epp</h4>
                                </div>

                                <div class="col-md-8">
                                    <asp:DropDownList id="ddlTipoEppEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="ddlTipoEppEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div><br/>
                            
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnActualizar" runat="server" Text="Guardar" class="btn btn-block btn-info" 
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
                            <asp:HiddenField id="hdfIDEppDel" runat="server"/>

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