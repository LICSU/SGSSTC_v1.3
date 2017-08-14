<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_IdentificacionPeligros.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_IdentificacionPeligros" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <div class="container" style ="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="#">Identificación de Peligros</a></li>
                </ol>
                
                <div class="page-header">
                    <h1 class="text-center">Identificación de Peligros</h1>
                </div>

                <div class="row" align="center">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-left">Seleccione una Empresa</h4> 
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-left">Seleccione una Sucursal</h4>
                            <asp:DropDownList runat="server" CssClass="form-control" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                </div>
                <br />

                <div class="row" style="overflow:auto;">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                                onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                                EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id_identificacion_peligro" runat="server" Text='<%# Eval("id_identificacion_peligro") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Fecha de la Identificacion" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="fecha_identificacion" runat="server" Text='<%# Eval("fecha_identificacion", "{0:d}") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="N° de Puestos de Trabajo" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="NumPuestos" runat="server" Text='<%# Eval("NumPuestos") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField HeaderText="Imprimir" CommandName="print" ButtonType="Image"  HeaderStyle-CssClass="text-center"
                                        ImageUrl="~\ico\print.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField HeaderText="Consultar" CommandName="Ver" ButtonType="Image"  HeaderStyle-CssClass="text-center"
                                        ImageUrl="~\ico\view.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField HeaderText="Eiminar" CommandName="Eliminar" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                        ImageUrl="~\ico\delete.png">
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
                        <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                            OnClick="AgregarRegistro"/>
                        <h4>Nueva Identificacion de Peligro</h4>
                    </div>

                </div>

            </div>
        
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>
    
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
    
    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" ID="ucMsjModal"/>
</asp:Content>