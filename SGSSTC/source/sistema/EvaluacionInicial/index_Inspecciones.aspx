<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Inspecciones.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_Inspecciones" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width:100%;">
            
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Evaluación Inicial</a></li>
                    <li><a href="#">Inspecciones de Seguridad</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Inspecciones de Seguridad</h1>
                </div>
            
                <div class="row">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-4">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-4">
                        <h4 class="text-center">Tipo de Inspección</h4>
                        <asp:DropDownList runat="server" id="ddlTipoInspeccion" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoInspeccion_SelectedIndexChanged">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Extintores" Value="Insp_Ext"></asp:ListItem>
                            <asp:ListItem Text="Areas" Value="Insp_Areas"></asp:ListItem>
                            <asp:ListItem Text="Medios de Escape" Value="Insp_MedEsc"></asp:ListItem>
                            <asp:ListItem Text="Puesto de Trabajo Operativo" Value="Insp_PuesOpe"></asp:ListItem>
                            <asp:ListItem Text="Puesto de Trabajo Administrativo" Value="Insp_PuesAdmin"></asp:ListItem>
                            <asp:ListItem Text="Inspección de Equipos de Protección" Value="Insp_Epp"></asp:ListItem>
                            <asp:ListItem Text="Inspección uso de EPP" Value="Insp_UsoEpp"></asp:ListItem>
                            <asp:ListItem Text="Inspección Botiquín de Primeros Auxilios" Value="Insp_PrimAux"></asp:ListItem>
                            <asp:ListItem Text="Cronograma de Inspecciones" Value="Insp_CronInsp"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />

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
                                            <asp:Label id="id_documento" runat="server" Text='<%# Eval("id_documento") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Fecha de Subida" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Label1" runat="server" Text='<%# Eval("fecha_subida") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                
                                    <asp:TemplateField HeaderText="Tipo de Inspeccion" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="tipo" runat="server" Text='<%# Eval("tipo") %>'/>
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
                                                    
                                    <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />

                <div class="row" align="center">
                    <div class="col-md-4 col-md-offset-2">
                        <asp:PlaceHolder Visible="true" id="phAgregar" runat="server">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" data-toggle="modal" data-target="#createModal"/>
                            <h4>Crear Documento</h4>
                        </asp:PlaceHolder>
                    </div>
                    <div class="col-md-4">
                        <asp:PlaceHolder Visible="true" id="PlaceHolder1" runat="server">
                            <asp:imagebutton runat="server" ImageUrl="~\ico\upload.png" data-toggle="modal" data-target="#addModal"/>
                            <h4>Subir Documento</h4>
                        </asp:PlaceHolder>
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Subir Documento</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate> 
                                            
                        <div class="modal-body form-group">
                            <div class="row">
                                <label class="col-md-4 control-label">Nombre: </label>
                                <div class="col-md-6"> 
                                        <asp:TextBox id="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombre" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                         </div>
                            </div><br />
                                                        
                            <asp:PlaceHolder runat="server" id="phEmpresaAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Empresa: </label> 
                                    <div class="col-md-6">
                                            <asp:DropDownList id="ddlEmpresaAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"  runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                        </div>
                                </div><br/>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" id="phSucursalAdd">
                                <div class="row">
                                    <label class="col-md-4 control-label">Sucursal: </label> 
                                    <div class="col-md-6">
                                            <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                        </div>
                                </div><br/>
                            </asp:PlaceHolder>
                            
                            <div class="row">
                                <label class="col-md-4 control-label">Tipo de Inspeccion: </label>
                                <div class="col-md-6">
                                    <asp:DropDownList id="ddlTipoInspeccionAdd" runat="server" ClientIDMode="Static" CssClass="form-control">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Extintores" Value="Insp_Ext"></asp:ListItem>
                                        <asp:ListItem Text="Areas" Value="Insp_Areas"></asp:ListItem>
                                        <asp:ListItem Text="Medios de Escape" Value="Insp_MedEsc"></asp:ListItem>
                                        <asp:ListItem Text="Puesto de Trabajo Operativo" Value="Insp_PuesOpe"></asp:ListItem>
                                        <asp:ListItem Text="Puesto de Trabajo Administrativo" Value="Insp_PuesAdmin"></asp:ListItem>
                                        <asp:ListItem Text="Inspección de Equipos de Protección" Value="Insp_Epp"></asp:ListItem>
                                        <asp:ListItem Text="Inspección uso de EPP" Value="Insp_UsoEpp"></asp:ListItem>
                                        <asp:ListItem Text="Inspección Botiquín de Primeros Auxilios" Value="Insp_PrimAux"></asp:ListItem>
                                        <asp:ListItem Text="Cronograma de Inspecciones" Value="Insp_CronInsp"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                        ControlToValidate="ddlSucursalAdd" runat="server" 
                                        ValidationGroup="ValidationAdd"/>
                                </div>
                            </div><br/>

                            <div class="row">
                                <label class="col-md-4 control-label">Archivo: </label>
                                <div class="col-md-6">
                                        <asp:FileUpload id="flpArchivo" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="flpArchivo" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
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

    <!-- Create Modal -->
    <div id="createModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button id="Button1" type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Crear Inspeccion</h3>
                </div>

                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate> 
                                            
                        <div class="modal-body form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="btnCrearInsExt" runat="server" Text="Inspeccion de Extintores" 
                                        class="btn btn-block btn-primary" OnClick="btnCrearInsExt_Click"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button3" runat="server" Text="Medios de Escape" 
                                        class="btn btn-block btn-primary" OnClick="btnCrearInsMedios_Click"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button4" runat="server" Text="Puestos de Trabajo Operativo" class="btn btn-block btn-primary" OnClick="btnCrearInsPuestos_Click"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button5" runat="server" Text="Puestos de Trabajo Administrativo" class="btn btn-block btn-primary" OnClick="btnCrearInsPuestosAdmin_Click"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button6" runat="server" Text="Inspección Equipos de Protección" class="btn btn-block btn-primary" OnClick="btnCrearInsEquipoProt_Click"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button9" runat="server" Text="Botiquin de Primeros Auxilios" class="btn btn-block btn-primary" OnClick="btnCrearInsPrimAux_Click"></asp:Button>
                                </div>
                            </div><br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button id="Button8" runat="server" Text="Uso de EPP" class="btn btn-block btn-primary" OnClick="btnCrearInsUsoEpp_Click"></asp:Button>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button id="Button7" runat="server" Text="Cronograma de Inspecciones" class="btn btn-block btn-primary" OnClick="btnCrearInsCrono_Click"></asp:Button>
                                </div>
                            </div><br/>
                        </div>
                        
                    </ContentTemplate>
                    <Triggers></Triggers>
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
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>