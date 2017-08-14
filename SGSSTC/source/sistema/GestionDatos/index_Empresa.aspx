<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Empresa" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:placeholder id="phEmpresa1" runat="server">
        <asp:UpdatePanel id="updatePanelPrinicpal" runat="server">
            <ContentTemplate>
                
                
                    
                    <ol class="breadcrumb">
                        <li><a href="#">Gestión de Datos</a></li>
                        <li><a href="#">Empresas</a></li>
                    </ol>

                    <div class="page-header">
                        <h3 class="text-center">Empresa</h1>
                    </div>
                
                    <div class="row">
                        <div class="box-body">
                            <div class="dataTables_wrapper form-inline dt-bootstrap">
                                <ucpag:pagination runat="server" id="pagination"/>
                            
                                <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false" 
                                AllowPaging="true" PageSize="10" HorizontalAlign="Center" 
                                    OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                    OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                    <rowstyle  HorizontalAlign="Center"/>
                                
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="id_empresa" runat="server" Text='<%# Eval("id_empresa") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contacto" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="contacto" runat="server" Text='<%# Eval("representante") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField CommandName="Ver" HeaderText="Acciones" ButtonType="Image" ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
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
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="AgregarRegistro"/>
                            <h4>Nueva Empresa</h4>
                        </div>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:placeholder>

    <asp:placeholder runat="server" id="phEmpresa">
        <div class="container" style="width:100%;">
            
            <ol class="breadcrumb">
                <li><a href="../MenuPrincipal/index.aspx">Menu Principal</a></li>
                <li><a href="../GestionDatos/index_Empresa.aspx">Empresas</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Empresa</h1>
            </div>
                        
            <div class="row">
                <div class="col-md-4 col-md-offset-4" align="center">
                    <asp:Image runat="server" id="imgLogo" CssClass="thumbnail" ImageUrl="~/source/archivos/LogosEmpresas/LICSU.jpg"/>
                </div>
            </div>
            
            <br />
            
            <div class="row">
                <div class="col-md-6 col-md-offset-3">

                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">Nombre</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtNombreEmpresa" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />
                
                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">NIT</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtNit" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />
                
                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">Email</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtEmail" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />
                
                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">Representante</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtRepresentante" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />

                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">Teléfono Fijo</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtTelFijo" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />
                
                    <div class="row text-left">
                        <div class="col-md-3">
                            <label class="control-label">Teléfono Movil</label>
                        </div>
                        <div class="col-md-9">
                            <asp:Label runat="server" id="txtTelMovil" CssClass="control-label"></asp:Label>
                        </div>
                    </div><br />

                </div>
            </div> 
            
        </div>
    </asp:placeholder>

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
                                <asp:HiddenField id="hdfEmpresaIDDel" runat="server"/>

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

    <!-- View Modal -->
    <div id="viewModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Empresa</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:HiddenField id="hdfEmpresaID" runat="server"/>

                                <div class="row"> 
                                    
                                    <div class="col-md-10 col-md-offset-1">

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">Nombre</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblNombreEmpresa" CssClass="control-label"></asp:Label>
 </div>
                                        </div><br />

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">NIT</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblNIT" CssClass="control-label"></asp:Label>
 </div>
                                        </div><br />

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">Email</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblEmail" CssClass="control-label"></asp:Label>
 </div>
                    
                                        </div><br />

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">Representante</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblRepresentante" CssClass="control-label"></asp:Label>
 </div>
                                        </div><br />

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">Teléfono Fijo</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblFijo" CssClass="control-label"></asp:Label>
 </div>
                    
                                        </div><br />

                                        <div class="row text-left">
 <div class="col-md-4">
     <label class="control-label">Teléfono Movil</label>
 </div>
 <div class="col-md-8">
     <asp:Label runat="server" id="lblMovil" CssClass="control-label"></asp:Label>
 </div>
                                        </div><br />

                                   </div>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
									<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>