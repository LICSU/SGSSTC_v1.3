<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Trabajador.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Trabajador" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" 
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:updatepanel id="upTrabajador1" runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Trabajador</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Trabajador</h1>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox id="txtBuscar" runat="server" class="form-control" PlaceHolder="Ingrese el trabajador a buscar"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el texto a buscar"></asp:TextBox>
                </div>
              
                <div class="col-md-2">
                    <asp:Button id="btnBuscar" data-toggle="tooltip" data-placement="bottom" title="Presione para buscar" 
                        runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>
            </div>
            
            <br />
            
            <div class="row">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                    <div class="col-md-3 text-center">
                        <label>Filtrar por empresa</label>
                        <asp:DropDownList runat="server" id="ddlEmpresasFiltro" CssClass="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlEmpresasFiltro_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                    <div class="col-md-3 text-center">
                        <label>Filtrar por sucursal</label>
                        <asp:DropDownList runat="server" id="ddlSucursalFiltro" CssClass="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlSucursalFiltro_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
            
                <div class="col-md-3 text-center">
                    <label>Filtrar por area</label>
                    <asp:DropDownList runat="server" id="ddlAreaFiltro" CssClass="form-control" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlAreaFiltro_SelectedIndexChanged"></asp:DropDownList>
                </div>
            
                <div class="col-md-3 text-center">
                    <label>Filtrar por Estatus</label>
                    <asp:DropDownList runat="server" id="ddlEstatusFiltro" CssClass="form-control" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlEstatusFiltro_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
            
            <br />
            
            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination"/>
                    
                        <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server" 
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                            EmptyDataText="No existen Registros">
                            <rowstyle  HorizontalAlign="Center"/>
                            
                            <Columns>
                                <asp:TemplateField HeaderText="Cédula" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField id="id_empresa" runat="server" Visible="false" Value='<%# Eval("empresa") %>'/>
                                        <asp:Label id="id_trabajador" runat="server" Visible="false" Text='<%# Eval("id_trabajador") %>'/>
                                        <asp:Label id="cedula" runat="server" Text='<%# Eval("cedula") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nombre(s)" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="nombres" runat="server" Text='<%# Eval("nombres") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Apellido(s)" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="apellidos" runat="server" Text='<%# Eval("apellidos") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="sucursal" runat="server" Text='<%# Eval("sucursal") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Area" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField id="id_area" runat="server" Visible="false" Value='<%# Eval("id_area") %>' ></asp:HiddenField>
                                        <asp:Label id="area" runat="server" Text='<%# Eval("area") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Estatus" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="estatus" runat="server" Text='<%# Eval("Nomestatus") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField CommandName="agregarReposo" HeaderText="Agregar Reposo" ButtonType="Image" 
                                    ImageUrl="~\ico\checklist.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Consultar" CommandName="Ver" ButtonType="Image" 
                                    ImageUrl="~\ico\view.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField> 
                    
                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" 
                                    ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
            
            <asp:PlaceHolder runat="server" id="phAgregar">
                <div class="row" align="center">
                    <div class="col-md-4 col-md-offset-2">
                        <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" 
                            OnClick="AgregarRegistro"/>
                        <h4>Nuevo Trabajador</h4>
                    </div>

                    <div class="col-md-4 ">
                        <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" 
                            OnClick="btDescargar_Click"/>
                        <h4>Descargar Lista</h4>
                    </div>
                </div>
            </asp:PlaceHolder>
        
        </ContentTemplate>
    </asp:updatepanel>

    <!-- Agregar Reposo Modal -->
    <div id="agregarReposo" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button id="Button1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Carga de Constancias</h3>
                </div>

                <asp:updatepanel id="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body  form-group">
                            <asp:HiddenField id="hdfTrabajadorEstID" runat="server"/>
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-left">¿Tuvo reposo?</h4>
                                    <asp:RadioButtonList id="rblReposo" RepeatColumns="2" AutoPostBack="true" runat="server"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione si hubo reposo"
                                        OnSelectedIndexChanged="rblReposo_SelectedIndexChanged" >
                                        <asp:ListItem Text="Si" Value="Si" style="margin-right:10px;"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                                
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:PlaceHolder runat="server" id="phDiasReposo" Visible="false">
                                        <h4 class="text-left">Días de Reposo</h4>
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" min="1" Text="1" 
                                            id="txtDiasReposo"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese los numeros de dias de reposo"></asp:TextBox>
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-left">Motivo</h4>
                                    <asp:DropDownList id="rblDiagnostico" CssClass="form-control" 
                                        OnSelectedIndexChanged="rblDiagnostico_SelectedIndexChanged" AutoPostBack="true" runat="server"
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione el motivo del reposo">
                                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Accidente Comun" Value="AC"></asp:ListItem>
                                        <asp:ListItem Text="Accidente Laboral" Value="AL"></asp:ListItem>
                                        <asp:ListItem Text="Enfermedad Laboral" Value="EL"></asp:ListItem>
                                        <asp:ListItem Text="Enfermedad Comun" Value="EC"></asp:ListItem>
                                        <asp:ListItem Text="Posible Enfermedad Laboral" Value="PEL"></asp:ListItem>
                                        <asp:ListItem Text="Otro" Value="O"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <asp:PlaceHolder runat="server" id="phOtroDiagnostico" Visible="false">
                                        <h4 class="text-left">Causa</h4>
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtOtroDiagnostico" MaxLength="300"
                                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la causa del reposo"></asp:TextBox>
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            
                            <br />
                            
                            <asp:PlaceHolder runat="server" id="phAccidenteComun" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-left"><asp:Label runat="server" id="lbAcc" Text=""></asp:Label></h4>
                                        <asp:TextBox TextMode="Multiline" Rows="2" runat="server" CssClass="form-control" 
                                            id="txtAccidenteComun"></asp:TextBox>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" id="phEnfermedadLaboral" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-left">
                                            <asp:Label runat="server" id="lblEnfermedad" Text=""></asp:Label></h4>
                                        <asp:DropDownList id="ddlEnfermedadReposo" CssClass="form-control" runat="server" 
                                            ClientIDMode="Static" AutoPostBack="true"></asp:DropDownList><br />
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-left">Seleccione el Sistema Afectado</h4>
                                        <asp:DropDownList id="ddlSistemaReposo" CssClass="form-control" runat="server" AutoPostBack="true" ClientIDMode="Static" 
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el Sistema Afectado"></asp:DropDownList>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <asp:PlaceHolder runat="server" id="phPEE" Visible="false">
                                <div class="row">
                                   <div class="col-md-8 col-md-offset-2">
                                        <h4 class="text-left"><asp:Label runat="server" id="lbll" 
                                            Text="Posible Enfermedad Laboral"></asp:Label></h4>
                                        <asp:DropDownList id="ddlEnfermedadLaboral" CssClass="form-control" runat="server" 
                                            ClientIDMode="Static"
                                            data-toggle="tooltip" data-placement="bottom" title="Seleccione la posible enfermedad laboral"></asp:DropDownList>
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-left">Fecha de la Constancia</h4>

                                    <asp:TextBox id="txtFechaConstancia" CssClass="form-control" TextMode="Date" runat="server" 
                                        ClientIDMode="Static"
                                        data-toggle="tooltip" data-placement="bottom" title="Ingrese la Fecha de la Constancia"></asp:TextBox>
                                </div>

                            </div>
                            
                            <br />
                            
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-left">Motivo</h4>

                                    <asp:TextBox id="txtMotivoRep" CssClass="form-control" MaxLength="300" TextMode="Multiline" Rows="2" 
                                        runat="server" ClientIDMode="Static"
                                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el motivo del reposo"></asp:TextBox>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4 class="text-left">Agregar Constancia</h4>
                                    <asp:FileUpload id="fuConstancia" runat="server" 
                                        data-toggle="tooltip" data-placement="bottom" title="Seleccione el soporte fotográfico de la constancia"/>
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2 text-center">
                                    <asp:Button id="btnGuardarReposo" Text="Guardar" runat="server" OnClick="btnGuardarReposo_Click" 
                                        class="btn btn-block btn-info"
                                        data-toggle="tooltip" data-placement="bottom" title="Presione para guardar el reposo"/>
                                </div>

                                <div class="col-md-4 text-center">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btnGuardarReposo"/>
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
                    <h3>Ver Trabajador</h3>
                </div>
                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-body text-left">
                            <asp:HiddenField id="hdfIdTrabajadorView" runat="server"/>
                            
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <asp:Image alt="-" runat="server" id="imgLogo" CssClass="thumbnail" 
                                        ImageUrl="~/source/archivos/LogosEmpresas/LICSU.jpg"/>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Nombre y Apellido</h4>
                                    <asp:Label id="txtNombres" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Cédula</h4>
                                    <asp:Label id="txtCedula" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Email</h4>

                                    <asp:Label id="txtEmail" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Fecha de Nacimiento</h4>

                                    <asp:Label id="txtFechaN" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Estado Civil</h4>
                                    <asp:Label id="txtEdoCivil" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Sexo</h4>

                                    <asp:Label id="txtSexo" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Teléfono</h4>

                                    <asp:Label id="txtTelefono" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Celular</h4>

                                    <asp:Label id="txtCelular" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>CCF</h4>
                                    <asp:Label id="txtCcf" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Dirección</h4>
                                    <asp:Label id="txtDireccion" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Región</h4>

                                    <asp:Label id="txtRegion" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    <h4>Departamento</h4>

                                    <asp:Label id="txtDepartamento" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Municipio</h4>

                                    <asp:Label id="txtMunicipio" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Empresa</h4>

                                    <asp:Label id="txtEmpresa" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                            
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Sucursal</h4>

                                    <asp:Label id="txtSucursal" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                
                                <div class="col-md-6">
                                    <h4>Puesto de Trabajo</h4>

                                    <asp:Label id="txtPuesto" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-primary" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>

                <asp:updatepanel id="upDel" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfTrabajadorIDDel" runat="server"/>
                            
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

    <!-- Descargar -->
    <div id="modalDescargar" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Descargar Trabajador</h3>
                </div>

                <asp:updatepanel id="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            <asp:HiddenField id="hdfTrabajadorIDDesc" runat="server"/>
                            
                            <div class="row">
                                <h4 class="text-center">¿Desea Descargar este registro?</h4>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button id="btDescargar" runat="server" Text="Descargar" class="btn btn-block btn-info" 
                                        OnClick="btDescargar_Click"/>
                                </div>
                                
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger Controlid="btDescargar"/>
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

                <asp:updatepanel id="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        
                        <div class="modal-body form-group">
                            
                            <div class="row"> 
                                
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintWord" runat="server" Text="Imprimir en Word" class="btn btn-block btn-primary" 
                                        OnClick="btnExportWord_Click"></asp:Button>
                                </div>
                            </div><br/>

                            <div class="row"> 

                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintExcel" runat="server" Text="Imprimir en Excel" 
                                        class="btn btn-block btn-success" OnClick="btnExportExcel_Click"></asp:Button>
                                </div>
                            </div><br/>
                            
                            <div class="row"> 

                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button id="btnPrintPdf" runat="server" Text="Imprimir en PDF" class="btn btn-block btn-danger" 
                                        OnClick="btnExportPDF_Click"></asp:Button>
                                </div>
                            </div><br/>

                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
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