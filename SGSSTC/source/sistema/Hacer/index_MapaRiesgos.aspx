<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MapaRiesgos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MapaRiesgos" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    

    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Mapas de Riesgo</a></li>
            </ol>
            
            <div class="page-header">
                <h1 class="text-center">Mapas de Riesgo</h1>
            </div>
            
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese el Mapa a buscar"></asp:TextBox>
                </div>
                  
                <div class="col-md-2">
                    <asp:Button id="btnSearchPlan" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>
            </div><br />
            
            <div class="row">                
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-3 col-md-offset-3">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder> 
            </div><br />
            
            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap"><ucpag:pagination runat="server" id="pagination"/>
                        
                        <asp:GridView id="GridView1" 
                            class="table table-bordered table-hover dataTable"
                            runat="server"
                            AutoGenerateColumns="false" 
                            AllowPaging="true"
                            PageSize="10" 
                            OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging"
                            OnRowCreated="GridView1_RowCreated" 
                            EmptyDataText="No existen Registros">
                            <rowstyle  HorizontalAlign="Center"/>
                
                <Columns>
                    <asp:TemplateField HeaderText="Id Plan" visible="false" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="id_plan_mapa" runat="server" Text='<%# Eval("id_plan_mapa") %>'/></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre del Plan" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                        <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("descripcion") %>'/></ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Label id="Label1" runat="server" Text='<%# Eval("Sucursal") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Label id="empresa" runat="server" Text='<%# Eval("Empresa") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Acciones" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ImageUrl="~\ico\descargar.png" NavigateUrl='<%# Eval("ruta") %>' Target="_blank">Descargar</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
            
            <asp:PlaceHolder runat="server" id="phAgregar">
            <div class="row" align="center"> 
                <div class="col-md-3 col-md-offset-3">
                    <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar"/>
                    <h4>Nuevo Mapa</h4>
                </div>
                <div class="col-md-3">
                    <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" OnClick="MostrarModalImprimir"/>
                    <h4>Descargar Lista</h4>
                </div> 
            </div>
            </asp:PlaceHolder>

        </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Mapa</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Nombre: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtNombre" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                         </div>
                                    </div>
                                </div><br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Descripcion: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtDesripcionAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtDesripcionAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                         </div>
                                    </div>
                                </div><br />
                                
                                <asp:PlaceHolder runat="server" id="phEmpresaAdd">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Empresa: </label> 
                                           <div class="col-md-6">
     <asp:DropDownList id="ddlEmpresaAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"  runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
 </div>
                                        </div>
                                </div>
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phSucursalAdd">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Sucursal: </label> 
                                           <div class="col-md-6">
     <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
 </div>
                                        </div>
                                </div>
                                </asp:PlaceHolder>

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
                                    <div class="col-md-4 col-md-offset-2"><asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="Guardar" ValidationGroup="ValidationAdd"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>

                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger Controlid="btnAdd"/>
                        </Triggers>
                    </asp:updatepanel>

            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Mapa</h3>
                </div>
                <asp:updatepanel id="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                
                                <div class="row">
                                    <div>
                                        <asp:HiddenField id="hdfPlanID" runat="server"/>
                                        <label class="col-md-4 control-label">Nombre: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtNombreEdit" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtNombreEdit" runat="server" 
 ValidationGroup="ValidationEdit"/>
                                         </div>
                                    </div>
                                </div><br/>
                                
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Descripcion: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtDescripcionEdit" runat="server" 
 ValidationGroup="ValidationEdit"/>
                                         </div>
                                    </div>
                                </div><br />

                                <asp:PlaceHolder runat="server" id="phEmpresaEdit">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Empresa: </label>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server" 
 ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </div>
                                </div>
                                </asp:PlaceHolder>
                                    
                                <asp:PlaceHolder runat="server" id="phSucursalEdit">
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Sucursal: </label> 
                                           <div class="col-md-6">
     <asp:DropDownList id="ddlSucursalEdit"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server" 
 ValidationGroup="ValidationEdit"/>
 </div>
                                        </div>
                                </div>
                                </asp:PlaceHolder>
                                
                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Archivo: </label>
                                        <div class="col-md-6">
 <asp:FileUpload id="flpArchivoEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="flpArchivoEdit" runat="server" 
 ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </div>
                                </div><br/>
                            
                             </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2"><asp:Button id="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationEdit"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger Controlid="btnEditar"/>
                        </Triggers>
                    </asp:updatepanel>
            </div>
        </div>
    </div>

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
                                <asp:HiddenField id="hdfPlanIDDel" runat="server"/>
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

    <!-- Print Modal -->
    <div id="printModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Descargar Lista</h3>
                </div>

                <asp:updatepanel id="UpdatePanel3" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">

                            <div class="row"> 
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" OnClick="btnExportWord_Click"></asp:Button>
                                </div> 
                            </div><br/>

                            <div class="row"> 
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintExcel" runat="server" Text="Imprimir en Excel" class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div> 
                            </div><br/>
                            
                            <div class="row"> 
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" OnClick="btnExportPDF_Click"></asp:Button>
                                </div> 
                            </div><br/>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
								<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>

								</div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnPrintWord"/>
                        <asp:PostBackTrigger Controlid="btnPrintExcel"/>
                        <asp:PostBackTrigger Controlid="btnPrintPdf"/>
                    </Triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>