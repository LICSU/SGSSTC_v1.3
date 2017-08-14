<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Horarios.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Horarios" %>

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
                    <li><a href="#">Horario</a></li>
                </ol>
                                
                <div class="page-header">
                    <h1 class="text-center">Horario</h1>
                </div>
            
                <div class="row"> 
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el Horario a buscar"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>

                    </div>
                </div><br />
            
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </asp:PlaceHolder><br />
            
                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                            <asp:GridView id="GridView1" 
                                class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false" 
                                AllowPaging="true" PageSize="10" 
                                OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>

                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="fecha_inicio" runat="server" Text='<%# Eval("fecha_inicio") %>'/>
                                            <asp:Label id="fecha_fin" runat="server" Text='<%# Eval("fecha_fin") %>'/>
                                            <asp:Label id="id_empresa" runat="server" Text='<%# Eval("id_empresa") %>'/>
                                            <asp:Label id="id_horario" runat="server" Text='<%# Eval("id_horario") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="Horario" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="horario" runat="server" Text='<%# Eval("horario")%>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                
                                    <asp:TemplateField HeaderText="N° Trabajadores" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Label3" runat="server" Text='<%# Eval("num_trab") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                                  
                                    <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                                
                                    <asp:ButtonField  HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                            
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div><br />
            
                <asp:PlaceHolder runat="server" id="phAgregar" Visible="false">
                    <div class="row" align="center">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                                OnClick="AgregarRegistroModal"/>
                            <h4>Nuevo Horario</h4>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Horario</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Nombre</h4>

                                    <asp:TextBox id="txtNombreAdd" runat="server" ClientIDMode="Static" MaxLength="50"
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el nombre del horario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNombreAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h4 class="text-center">Hora Inicio</h4>

                                    <asp:TextBox id="txtFechaIni" TextMode="Time" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la hora en que comineza el horario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtFechaIni" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h4 class="text-center">Hora Fin</h4>

                                    <asp:TextBox id="txtFechaFin" TextMode="Time" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la hora en que termina el horario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtFechaFin" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div>
                            
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd" Visible="false">
                                <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-center">Empresa</h4>

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
                    <h3>Editar Horario</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfHorarioID" runat="server"/>
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-center">Nombre</h4>

                                    <asp:TextBox id="txtNombreEdit" runat="server" ClientIDMode="Static" MaxLength="50"
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese el nombre el horario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtNombreEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h4 class="text-center">Hora Inicio</h4>

                                    <asp:TextBox id="txtFechaIniEdit" TextMode="Time" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la hora en que comineza el horario"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtFechaIniEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                                
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3">
                                    <h4 class="text-center">Hora Fin</h4>

                                    <asp:TextBox id="txtFechaFinEdit" TextMode="Time" runat="server" ClientIDMode="Static" 
                                        CssClass="form-control"
                                        data-toggle="tooltip" data-placement="bottom" 
                                        title="Ingrese la hora en que termina el horario"></asp:TextBox>
                                     
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="txtFechaFinEdit" runat="server" ValidationGroup="ValidationEdit"/>
                                </div>
                            </div>
                                
                            <asp:PlaceHolder runat="server" id="phempresaEdit" Visible="false">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Empresa</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" Visible="false" 
                                            ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div><br/>
                            </asp:PlaceHolder>
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
                            <asp:HiddenField id="hdfHorarioIDDel" runat="server"/>
                            
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