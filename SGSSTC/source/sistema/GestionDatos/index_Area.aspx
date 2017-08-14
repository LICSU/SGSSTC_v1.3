<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Area.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Area" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            
                
                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="#">Área</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Área</h1>
                </div>
            
                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" 
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" 
                            runat="server" class="form-control" PlaceHolder="Ingrese el Area a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar"                             />
                    </div>
                </div>
                
                <br />
            
                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <div class="col-md-3">
                        <h4 class="text-center">Nivel del Area</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" id="ddlNivelArea" class="form-control" 
                            OnSelectedIndexChanged="ddlNivelArea_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Nivel de Área">
                            <asp:ListItem Text="Todos los Niveles" Value=""></asp:ListItem>
                            <asp:ListItem Text="Nivel 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Nivel 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Nivel 3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Nivel 4" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                
                    <div class="col-md-3">
                        <h4 class="text-center">N° Trabajadores</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" id="ddlTrabajadores" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Trabajador" CssClass="form-control" OnSelectedIndexChanged="ddlTrabajadores_SelectedIndexChanged">
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
                            <asp:GridView 
                                id="GridView1" 
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
                                    <asp:TemplateField HeaderText="Id" visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id_area" runat="server" Text='<%# Eval("id_area") %>'/>
                                            <asp:Label id="id_area_padre" runat="server" Text='<%# Eval("id_area_padre") %>'/>
                                            <asp:HiddenField id="hdfAreaPadre" runat="server" Value='<%# Eval("id_area_padre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombre" runat="server" Text='<%# Eval("Nombre_Area") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area Superior" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="nombreSup" runat="server" Text='<%# Eval("Area_Padre") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area Nivel 1" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="lbArea1" runat="server" Text='<%# Eval("nivel1") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Area Nivel 2" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Label4" runat="server" Text='<%# Eval("nivel2") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Area Nivel 3" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Label5" runat="server" Text='<%# Eval("nivel3") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Area Nivel 4" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Label6" runat="server" Text='<%# Eval("nivel4") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
              
                                    <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="empresa_id" Visible="false" runat="server" Text='<%# Eval("empresa_id") %>'/>
                                            <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nro Trab" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="ntrabajadores" runat="server" Text='<%# Eval("NumTrab") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" id="id_sucursal" Visible="false" Value='<%# Eval("id_sucursal") %>'/>
                                            <asp:Label id="sucursal" runat="server" Text='<%# Eval("sucursal") %>'/>
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
                </div>
                
                <br />

                <div class="row" align="center"> 

                    <div class="col-md-3 col-md-offset-3">
                        <asp:PlaceHolder Visible="true" id="phAgregar" runat="server">
                            <asp:ImageButton id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                                OnClick="AgregarRegistroModal"
                                data-toggle="tooltip" data-placement="bottom" title="Presione para Registrar un Área"/>
                            <h4>Nueva Área</h4>
                        </asp:PlaceHolder>
                    </div>

                    <div class="col-md-3">
                        <asp:ImageButton id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" 
                            OnClick="MostrarModalImprimir" 
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Imprimir la lista de Áreas"/>
                        <h4>Descargar Lista</h4>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Agregar Área</h3>
                </div>

                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        
                        
                            <div class="modal-body form-group text-left">
                            
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Área</h4>

                                        <asp:TextBox id="txtNombre" runat="server" MaxLength="50" ClientIDMode="Static" 
                                            CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del Área"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombre" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>
                                </div>

                                <div class="row">
                                        <asp:PlaceHolder runat="server" Visible="false" id="phEmpresaAdd">
                                                <div class="col-md-6">
                                                    <h4>Empresa</h4>

                                                    <asp:DropDownList id="ddlEmpresaAdd"  
                                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" runat="server" ClientIDMode="Static" 
                                                        CssClass="form-control" AutoPostBack="true" 
                                                        OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged"></asp:DropDownList>

                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlEmpresaAdd" runat="server" 
                                                        ValidationGroup="ValidationAdd"/>
                                                </div>
                                        </asp:PlaceHolder>

                                        <asp:PlaceHolder runat="server" Visible="false" id="phSucursalAdd">
                                        <div class="col-md-6">
                                            <h4>Sucursal</h4>

                                            <asp:DropDownList id="ddlSucursalAdd"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" AutoPostBack="true" 
                                                OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged"></asp:DropDownList>
                                        
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucursalAdd" runat="server" ValidationGroup="ValidationAdd"/>
                                        </div>
                                        </asp:PlaceHolder>
                                    </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>Tipo de Área</h4>

                                        <asp:DropDownList runat="server" id="ddlTipoAreaAdd" class="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Tipo de Área">
                                            <asp:ListItem Text="Seleccione el Tipo de Área" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Administrativa" Value="Administrativa"></asp:ListItem>
                                            <asp:ListItem Text="Operativa" Value="Operativa"></asp:ListItem>
                                        </asp:DropDownList>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlTipoAreaAdd" runat="server" 
                                            ValidationGroup="ValidationAdd"/>
                                    </div>

                                    <div class="col-md-6">
                                        <h4>Marque si pertenece a otra Área</h4> 

                                        <asp:CheckBox id="chkAreaPadre" runat="server" ClientIDMode="Static" CssClass="checkbox text-center" 
                                          AutoPostBack="true" OnCheckedChanged="chkAreaPadre_CheckedChanged"></asp:CheckBox>
                                    </div>
                                </div>
                            
                                <asp:PlaceHolder id="phAreaPadre" runat="server" Visible="false">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Seleccione el Área Superior</h4>

                                            <asp:DropDownList id="ddlAreasAdd" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control"
                                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el Área al cual pertenece"></asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlAreasAdd" runat="server" 
                                                ValidationGroup="ValidationAdd"/>
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="AgregarRegistro" ValidationGroup="ValidationAdd"/>
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                            <asp:AsyncPostBackTrigger Controlid="btnAdd" EventName="Click"/>
                    </Triggers>
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
                    <h3>Editar Área</h3>
                </div>
                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        
                        
                            <div class="modal-body form-group text-left">
                                <asp:HiddenField id="hdfAreaID" runat="server"/>
                            
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>Área</h4>

                                        <asp:TextBox id="txtNombreEdit" MaxLength="50" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del Área"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtNombreEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>
                                </div>
                                <br />
                                
                                <div class="row">
                                    <asp:PlaceHolder runat="server" Visible="false" id="phEmpresaEdit">
                                        <div class="col-md-6">
                                            <h4>Empresa</h4> 

                                            <asp:DropDownList id="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpresaEdit" runat="server" 
                                                ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </asp:PlaceHolder>
                                    
                                    <asp:PlaceHolder runat="server" Visible="false" id="phSucursalEdit">
                                        <div class="col-md-6">
                                            <h4>Sucursal</h4>

                                            <asp:DropDownList id="ddlSucursalEdit"  data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" AutoPostBack="true" 
                                                OnSelectedIndexChanged="ddlSucursalEdit_SelectedIndexChanged"></asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                                Font-Bold="true" ControlToValidate="ddlSucursalEdit" runat="server" 
                                                ValidationGroup="ValidationEdit"/>
                                        </div>
                                    </asp:PlaceHolder>
                                </div>
                                <br />

                                <asp:PlaceHolder id="phAreasEditChk" runat="server">
                                    <div class="row">
                                        <div class="col-md-6">
                                        <h4>Tipo de Área</h4>
                                    
                                        <asp:DropDownList runat="server" id="ddlTipoAreaEdit" class="form-control"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione un Tipo de Área">
                                            <asp:ListItem Text="Seleccione el Tipo de Área" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Administrativa" Value="Administrativa"></asp:ListItem>
                                            <asp:ListItem Text="Operativa" Value="Operativa"></asp:ListItem>
                                        </asp:DropDownList>
                                    
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="ddlTipoAreaEdit" runat="server" 
                                            ValidationGroup="ValidationEdit"/>
                                    </div>

                                        <div class="col-md-6">
                                            <h4>Marque si pertenece a otra Área</h4>

                                            <asp:CheckBox id="chkAreaEdit" runat="server" ClientIDMode="Static" 
                                                CssClass="checkbox text-center" 
                                              AutoPostBack="true" OnCheckedChanged="chkAreaEdit_CheckedChanged"></asp:CheckBox>
                                        </div>
                                    </div>
                                
                                    <asp:PlaceHolder runat="server" id="phSeleccion">
                                        <div class="row">                                        
                                            <div class="col-md-12">
                                                <h4>Seleccione el Área Superior</h4>
    
                                                <asp:DropDownList id="ddlAreasEdit" runat="server" ClientIDMode="Static" 
                                                    CssClass="form-control"
                                                    data-toggle="tooltip" data-placement="bottom" title="Seleccione el Área al cual pertenece"></asp:DropDownList>

                                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                    setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                                    Font-Bold="true" ControlToValidate="ddlAreasEdit" runat="server" 
                                                    ValidationGroup="ValidationEdit"/>
                                            </div>
                                        </div>
                                    </asp:PlaceHolder>
                                </asp:PlaceHolder>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" 
                                        OnClick="EditarRegistro" ValidationGroup="ValidationEdit"/>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>

                <asp:updatepanel id="upDel" runat="server">
                        <ContentTemplate>

                            <div class="modal-body form-group">
                                <asp:HiddenField id="hdfAreaIDDel" runat="server"/>
                                
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro? Esto eliminara los registros asociados
                                    al área (Puestos de trabajo, Trabajadores, y Accidentes Laborales)
                                </h4>
                            </div>
         
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btnDelete" runat="server" Text="Eliminar" 
                                            class="btn btn-block btn-info" OnClick="EliminarRegistro"/>
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

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>