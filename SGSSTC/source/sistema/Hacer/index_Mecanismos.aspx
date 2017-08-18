<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Mecanismos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Mecanismos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Mecanismos</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Mecanismo para recibir, documentar y responder a las comunicaciones</h1>
            </div>


            <asp:PlaceHolder runat="server" id="phSucursal">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" 
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                     </div>
                </div><br />
            </asp:PlaceHolder>
            
            <div class="row" style="overflow:auto;">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination"/>
                        
                        <asp:GridView id="GridView1" 
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false" 
                            AllowPaging="true"
                            PageSize="5" 
                            OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging"
                            EmptyDataText="No existen Registros">
                            <rowstyle  HorizontalAlign="Center"/>

                            <Columns>
                                <asp:TemplateField HeaderText="Id Categoria" visible="false">
                                    <ItemTemplate><asp:Label id="Num" runat="server" Text='<%# Eval("id_tipo_documento") %>'/></ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="TIPO DE DOCUMENTACIÓN" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="COMUNICACIÓN DIRIGIDA A" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="dirigida" runat="server" Text='<%# Eval("dirigida") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="MODALIDAD DE COMUNICACIÓN" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="modalidad" runat="server" Text='<%# Eval("modalidad") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="FECHA" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="fecha" runat="server" Text='<%# Eval("fecha") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="RESPONSABLE" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="responsable" runat="server" Text='<%# Eval("responsable") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="APROBADO POR" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="Label2" runat="server" Text='<%# Eval("aprobado") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ARCHIVADO O ALMACENADO" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="Label1" runat="server" Text='<%# Eval("archivado") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ESTATUS" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="estatus" runat="server" Text='<%# Eval("estatus") %>'/></ItemTemplate>
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
            </div><br />
            
            <div class="row" align="center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar"/>
                    <h4>Nuevo Tipo de Documento</h4>
                </div>
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
                                
                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtNombreAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreAdd" runat="server"
                                        ValidationGroup="ValidationAdd"/>
                                </div>

                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Comunicación dirigida a</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtDirigidaAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDirigidaAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Modalidad de comunicación</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtModalidadAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtModalidadAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Fecha</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtFechaAdd" runat="server" type="date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Responsable</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtResponsableAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtResponsableAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Aprobado por</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtAprobadoAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtAprobadoAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Archivado o almacenado</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtArchivadoAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtArchivadoAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Estatus</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:DropDownList id="ddlEstatusAdd" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Cumplido" Value="Cumplido"></asp:ListItem>
                                        <asp:ListItem Text="No Cumplido" Value="No Cumplido"></asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlEstatusAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <asp:PlaceHolder runat="server" id="phSucursalAdd">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Sucursal</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                            Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div><br/>
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
                                
                                <div class="col-md-4">
                                    <h4 class="text-center">Nombre</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtNombreEdit" runat="server"
                                        ValidationGroup="ValidationAdd"/>
                                </div>

                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Comunicación dirigida a</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtDirigidaEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtDirigidaEdit" runat="server" ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Modalidad de comunicación</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtModalidadEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtModalidadEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Fecha</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtFechaEdit" runat="server" type="date" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>
                            
                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Responsable</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtResponsableEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtResponsableEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Aprobado por</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtAprobadoEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtAprobadoEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Archivado o almacenado</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:TextBox id="txtArchivadoEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtArchivadoEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <div class="col-md-4">
                                    <h4 class="text-center">Estatus</h4>
                                </div>
                                
                                <div class="col-md-8">
                                    <asp:DropDownList id="ddlEstatusEdit" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Cumplido" Value="Cumplido"></asp:ListItem>
                                        <asp:ListItem Text="No Cumplido" Value="No Cumplido"></asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="ddlEstatusEdit" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <asp:PlaceHolder runat="server" id="phSucursalEdit">
                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Sucursal</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList id="ddlSucursalEdit"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                            Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div><br/>
                            </asp:PlaceHolder>

                        </div>
                            
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2"><asp:Button id="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationEdit"/></div>
                                <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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