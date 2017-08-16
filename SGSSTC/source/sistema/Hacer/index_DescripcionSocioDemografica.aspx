<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_DescripcionSocioDemografica" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="#">Descripción SocioDemográfica</a></li>
        </ol>
    
    
    <div class="page-header">
        <h1 class="text-center">Descripción SocioDemográfica</h1>
    </div> 

    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <asp:textbox id="txtBuscar" data-toggle="tooltip" data-placement="bottom" title="Ingrese el texto a buscar"  runat="server" class="form-control" placeholder="Ingrese el trabajador a buscar"></asp:textbox>
        </div>

        <div class="col-md-2">
            <asp:button id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" runat="server" text="Buscar" cssclass="btn btn-info" onclick="BuscarRegistro"/>
        </div>

    </div>
    <br />

    <div class="row">
        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                <ucpag:pagination runat="server" id="pagination"/>

                <asp:gridview id="GridView1"
                    class="table table-bordered table-hover dataTable"
                    runat="server"
                    autogeneratecolumns="false"
                    allowpaging="true"
                    pagesize="10"
                    onrowcommand="GridView1_RowCommand"
                    onpageindexchanging="GridView1_PageIndexChanging"
                    onrowcreated="GridView1_RowCreated"
                    emptydatatext="No existen Registros">

                            <rowstyle  HorizontalAlign="Center"/>

                            <Columns>
                                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="id_desc_socio" runat="server" Text='<%# Eval("id_desc_socio") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="Label1" runat="server" Text='<%# Eval("empresa") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Cédula" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="cedula" runat="server" Text='<%# Eval("cedula") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Trabajador" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="nombres" runat="server" Text='<%# Eval("nombres") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                         
                                <asp:ButtonField HeaderText="Acciones" CommandName="Ver" ButtonType="Image" ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField> 
                                           
                                <asp:ButtonField HeaderText="Editar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        
                        </asp:gridview>
            </div>
        </div>
    </div>
    <br />

    <div class="row" align="center">
        <asp:placeholder runat="server" id="phAgregar">
            <div class="col-md-4 col-md-offset-4">
                <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="AgregarRegistro"/>
                <h4>Nueva Descripcion SocioDemografica</h4>
            </div>
        </asp:placeholder>

    </div>
    <br />


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
                            ¿Seguro desea eliminar este registro?
                            <asp:HiddenField id="hdfPerfilIDDel" runat="server"/>
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