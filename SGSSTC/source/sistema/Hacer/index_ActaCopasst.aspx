<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_ActaCopasst.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_ActaCopasst" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">

        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Actas Copasst</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Actas Copasst</h1>
            </div>
            
            <div class="row">
                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

            </div>
                        
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
                                <asp:TemplateField visible="false">
                                    <ItemTemplate>
                                        <asp:Label id="id_reunion" runat="server" Text='<%# Eval("id_reunion") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Soporte" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="soporte" runat="server" Text='<%# Eval("archivo") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                
                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="sucursal" runat="server" Text='<%# Eval("sucursal") %>'/>
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
                    <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalCrear"/>
                    <h4>Crear Acta</h4>
                </div>

                <div class="col-md-4">
                    <asp:ImageButton id="btnSubir" runat="server" ImageUrl="~\ico\upload.png" OnClick="btnSubir_Click"/>
                    <h4>Subir Acta</h4>
                </div>
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>
    
    <!-- Create Modal -->
    <div id="createModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button id="Button1" type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Crear Formato</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate> 
                                            
                        <div class="modal-body form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="btnCrearInsExt" runat="server" Text="Acta de Reunión de Copasst" 
                                        class="btn btn-block btn-primary" CommandArgument='1'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button3" runat="server" Text="Acta de Designación del Vigía en SST" 
                                        class="btn btn-block btn-primary" CommandArgument='2'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button4" runat="server" Text="Comunicado de Elecciones" 
                                        class="btn btn-block btn-primary" CommandArgument='3'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button5" runat="server" Text="Formato de Inscripción de Candidatos" 
                                        class="btn btn-block btn-primary" CommandArgument='4'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button6" runat="server" Text="Formato para Votos" 
                                        class="btn btn-block btn-primary" CommandArgument='5'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button7" runat="server" Text="Acta de Apertura de Elecciones" 
                                        class="btn btn-block btn-primary" CommandArgument='6'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button8" runat="server" Text="Registro de Votantes" 
                                        class="btn btn-block btn-primary" CommandArgument='7'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button9" runat="server" Text="Acta de Cierre de las Votaciones" 
                                        class="btn btn-block btn-primary" CommandArgument='8'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button2" runat="server" Text="Resultado de las Votaciones" 
                                        class="btn btn-block btn-primary" CommandArgument='9'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button10" runat="server" Text="Acta de Conformacion del Copasst" 
                                        class="btn btn-block btn-primary" CommandArgument='10'
                                        OnClick="AgregarRegistro"></asp:Button>
                                </div>
                            </div><br/>
                        </div>
                        
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:updatepanel>

            </div>
        </div>
    </div>

    <!-- Escaneado Modal -->
    <div id="EscaneadoModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Archivo Escaneado</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            
                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Nombre: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox id="txtNombreSubir" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombreSubir" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                         </div>
                                </div>
                            </div><br />
                            

                            <asp:PlaceHolder runat="server" id="phSucursalSubir">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Sucursal: </label> 
                                        
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlSucursalSubir" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucursalSubir" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div>
                                </div>
                            </asp:PlaceHolder><br/>
                            
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
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnEscaneado" runat="server" Text="Subir Archivo" 
                                        class="btn btn-block btn-info" OnClick="btnSubirArchivo"/>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnEscaneado"/>
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

</asp:Content>