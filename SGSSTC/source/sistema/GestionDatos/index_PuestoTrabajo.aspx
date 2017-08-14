<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PuestoTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_PuestoTrabajo" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            
                
                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="#">Puesto Trabajo</a></li>
                </ol>

                
                <div class="page-header">
                    <h1 class="text-center">Puesto de trabajo</h1>
                </div>
            
                <div class="row">  
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" 
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" 
                            runat="server" class="form-control" PlaceHolder="Ingrese el Puesto de Trabajo a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" 
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" 
                            runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
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
                
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlSucursal" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                CssClass="form-control" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                         </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phArea">
                        <div class="col-md-3">
                            <h4 class="text-center">Area</h4>
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlArea"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" 
                                CssClass="form-control" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <div class="col-md-3">
                        <h4 class="text-center">N° Trabajadores</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" id="ddlTrabajadores" 
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Trabajador" 
                            CssClass="form-control" OnSelectedIndexChanged="ddlTrabajadores_SelectedIndexChanged">
                            <asp:ListItem Text="Todos los Trabajadores" Value=""></asp:ListItem>
                            <asp:ListItem Text="0 - 10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="10-50" Value="50"></asp:ListItem>
                            <asp:ListItem Text="50-100" Value="100"></asp:ListItem>
                            <asp:ListItem Text="+100" Value="101"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                <br />
            
                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                            <asp:GridView id="GridView1" 
                                class="table table-bordered table-hover dataTable"
                                runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                                OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                
                                <Columns>
                                
                                    <asp:TemplateField HeaderText="id" visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id" runat="server" Text='<%# Eval("id_puesto_trabajo") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="area" runat="server" Text='<%# Eval("Area") %>'/></ItemTemplate>
                                    </asp:TemplateField> 

                                    <asp:TemplateField HeaderText="N° Trabajadores" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="numTrab" runat="server" Text='<%# Eval("Num") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="sucursal" runat="server" Text='<%# Eval("Sucursal") %>'/></ItemTemplate>
                                    </asp:TemplateField> 
                                
                                    <asp:ButtonField HeaderText="Editar" HeaderStyle-CssClass="text-center" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                                
                                    <asp:ButtonField HeaderText="Consultar" HeaderStyle-CssClass="text-center" CommandName="Ver" ButtonType="Image" ImageUrl="~\ico\view.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField  HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
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
                                OnClick="AgregarRegistro"/>
                            <h4>Nuevo Puesto de Trabajo</h4>
                        </div>
                    </div>
                    
                    <br />
                </asp:PlaceHolder>
            </div>

        </ContentTemplate>
           <Triggers></Triggers>
       </asp:updatepanel>

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