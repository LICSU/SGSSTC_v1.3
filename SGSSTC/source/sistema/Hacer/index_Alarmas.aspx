<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Alarmas.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Alarmas" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Alarmas</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Alarmas</h1>
            </div>
            
            <div class="row">
                <div class="col-md-6 col-md-offset-2">
                    <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese la alarma a buscar"></asp:TextBox>
                </div>
                  
                <div class="col-md-2">
                    <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>

            </div><br />
            
            <div class="row">
                
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                    </div>

                    </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                
                <div class="col-md-2"></div>
            </div><br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4 class="text-left">Prioridad</h4>
                    <asp:DropDownList id="ddlPrioridadIndex" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlPrioridadIndex_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <h4 class="text-left">Categoria</h4>
                    <asp:DropDownList id="ddlCategoriaIndex" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlCategoriaIndex_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div><br />

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4 class="text-left">Fecha inicio</h4>
                    <asp:TextBox id="txtFechaInicio" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <h4 class="text-left">Fecha fin</h4>
                    <asp:TextBox id="txtFechaFin" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>
            </div><br/>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination"/> 

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
                                <asp:TemplateField HeaderText="Id Alarma" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="id" runat="server" Text='<%# Eval("id_alarmas") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("descripcion") %>'/></ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField HeaderText="Fecha" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>'/></ItemTemplate>
                                </asp:TemplateField> 

                                <asp:TemplateField HeaderText="Prioridad" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="prioridad" runat="server" Text='<%# Eval("prioridad") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Categoria" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="categoria" runat="server" Text='<%# Eval("categoria") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Empresa" visible="false" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" id="id_usuario" Visible="false" Value='<%# Eval("id_usuario") %>'/>
                                            <asp:Label id="usuario" runat="server" Text='<%# Eval("id_usuario") %>'/>
                                        </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField  HeaderText="Acciones" HeaderStyle-CssClass="text-center" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                    
                            </Columns>
                        </asp:GridView> 
                    </div>
                </div>
            </div><br />

            <div class="row" align="center"> 
                <div class="col-md-3 col-md-offset-3">
                    <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                                     OnClick="MostrarModalAgregar" data-toggle="modal" data-target="#addModal"/>
                    <h4>Nueva Alarma</h4>
                </div>
                <div class="col-md-3">
                    <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" 
                                     data-toggle="modal" data-target="#printModal"/>
                    <h4>Descargar Lista</h4>
                </div> 
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Registro</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                        <ContentTemplate> 
                            <div class="modal-body form-group"><br/>

                                <asp:PlaceHolder runat="server" id="phEmpAdd">
                                    <div class="row form-group">
                                        <div class="col-md-4 control-label">
 <label>Empresa: </label>
                                        </div>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlEmpAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpAdd_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlEmpAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phSucAdd">
                                    <div class="row form-group">
                                        <div class="col-md-4 control-label">
 <label>Sucursal: </label>
                                        </div>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlSucAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucAdd_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlSucAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                        </div>
                                </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phUsuAdd">
                                    <div class="row form-group">
 <div class="col-md-4 control-label">
     <label>Responsable: </label>
 </div>
 <div class="col-md-6">
     <asp:DropDownList id="ddlUsuAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
     <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlUsuAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
 </div>
                                    </div><br />
                                </asp:PlaceHolder>

                                <div class="row form-group">
                                    <label class="col-md-4 control-label">Descripcion: </label>
                                    <div class="col-md-6">
 <asp:TextBox id="txtDescripcion" runat="server" ClientIDMode="Static" MaxLength="100" CssClass="form-control"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtDescripcion" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                         </div>
                                </div><br/>

                                <div class="row form-group">
                                    <label class="col-md-4 control-label">Fecha: </label>
                                    <div class="col-md-6">
 <asp:TextBox id="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
  <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtFecha" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                         </div>
                                </div><br />

                                <div class="row form-group">
                                        <label class="col-md-4 control-label">Prioridad: </label>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlPrioridadAdd" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlPrioridadAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
                                        </div>
                                </div><br />

                                <div class="row form-group">
                                        <label class="col-md-4 control-label">Categoria: </label>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlCategoriaAdd" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlCategoriaAdd_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlCategoriaAdd" runat="server" 
 ValidationGroup="ValidationAdd"/>
 
 <asp:PlaceHolder runat="server" id="phCatAddOtro" Visible="false">
     <asp:TextBox id="txtCatAddOtro" runat="server" placeholder="Ingrese categoria..." MaxLength="100" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
     <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="txtCatAddOtro" runat="server" 
 ValidationGroup="ValidationAdd"/>
 </asp:PlaceHolder>
                                        </div>
                                </div><br />

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
                    <h3>Editar Registro</h3>
                </div>
                <asp:updatepanel id="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <asp:HiddenField id="hdfEditID" runat="server"/><br/>
                                
                                <asp:PlaceHolder runat="server" id="phEmpEdit">
                                    <div class="row">
                                        <div>
                                        <div class="col-md-4 control-label">
 <label>Empresa: </label>
                                        </div>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlEmpEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEdit_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlEmpEdit" runat="server" 
 ValidationGroup="ValidationAEdit"/>
                                        </div>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phSucEdit">
                                    <div class="row">
                                    <div>
                                        <div class="col-md-4 control-label">
 <label>Sucursal: </label>
                                        </div>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlSucEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEdit_SelectedIndexChanged"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
 Font-Bold="true" ControlToValidate="ddlSucEdit" runat="server" 
 ValidationGroup="ValidationAEdit"/>
                                        </div>
                                    </div>
                                </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phUsuEdit">
                                    <div class="row">
                                        <div>
 <div class="col-md-4 control-label">
     <label>Responsable: </label>
 </div>
 <div class="col-md-6">
     <asp:DropDownList id="ddlUsuEdit" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
     <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="ddlUsuEdit" runat="server" 
         ValidationGroup="ValidationAEdit"/>
 </div>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Descripcion: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtDescripcionEdit" runat="server" ClientIDMode="Static" CssClass="form-control" MaxLength="100"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="txtDescripcionEdit" runat="server" 
         ValidationGroup="ValidationAEdit"/>
                                         </div>
                                    </div>
                                </div><br/>

                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Fecha: </label>
                                        <div class="col-md-6">
 <asp:TextBox id="txtFechaEdit" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server" 
         ValidationGroup="ValidationAEdit"/>
                                         </div>
                                    </div>
                                </div><br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Prioridad: </label>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlPrioridadEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="ddlPrioridadEdit" runat="server" 
         ValidationGroup="ValidationAEdit"/>
                                        </div>
                                    </div>
                                </div><br />

                                <div class="row">
                                    <div>
                                        <label class="col-md-4 control-label">Categoria: </label>
                                        <div class="col-md-6">
 <asp:DropDownList id="ddlCategoriaEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
 <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="ddlCategoriaEdit" runat="server" 
         ValidationGroup="ValidationAEdit"/>
                                        </div>
                                    </div>
                                </div><br />
                             </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2"><asp:Button id="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationAEdit"/></div>
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
                                    <div class="col-md-2"></div>
                                    <div class="col-md-4"><asp:Button id="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                    <div class="col-md-2"></div>
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
                                <div class="col-md-4 col-md-offset-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
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

</asp:Content>