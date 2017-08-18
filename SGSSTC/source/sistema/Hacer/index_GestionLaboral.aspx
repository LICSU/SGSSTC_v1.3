<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_GestionLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_GestionLaboral" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="#">Gestión Laboral</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Gestión Laboral</h1>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-3">
                    <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese la Gestión Laboral a buscar"></asp:TextBox>
                </div>
                  
                <div class="col-md-2">
                    <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                </div>
            </div><br />

            <div class="row">
                <asp:PlaceHolder runat="server" id="phEmpresa">
                <div class="col-md-4">
                     <label>Empresa: </label>
                    <asp:DropDownList id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                </div>
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phSucursal">
                    <div class="col-md-3">
                     <label>Sucursal: </label>
                    <asp:DropDownList id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                </div>
                </asp:PlaceHolder>

                <div class="col-md-3">
                    <label>Tipo de gestión: </label>
                    <asp:DropDownList id="ddlTipoGestion" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlTipoGestion_SelectedIndexChanged"></asp:DropDownList>
                </div>
                
                <div class="col-md-3">
                    <label>Fecha inicio: </label>
                    <asp:TextBox id="txtFechaInicio" AutoPostBack="true" runat="server" class="col-md-10" 
                        CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-3">
                    <label>Fecha fin: </label>
                    <asp:TextBox id="txtFechaFin" AutoPostBack="true" runat="server" class="col-md-10" 
                        CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>

            </div><br />


            <div class="row" style="overflow:auto;">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination"/>
                        
                        <asp:GridView id="GridView1" 
                            class="table table-bordered table-hover dataTable" runat="server" AutoGenerateColumns="false" 
                            AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                            onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                            EmptyDataText="No existen Registros">
                            <rowstyle HorizontalAlign="Center"/>
                            
                            <Columns>
                                <asp:TemplateField HeaderText="Empresa" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" id="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>
                                        <asp:Label id="empresa" runat="server" Text='<%# Eval("empresa") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="id" runat="server" Text='<%# Eval("id_ges_lab") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha de la Actividad" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Descripcion" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("descripcion") %>'/></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Tipo de Gestión" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="tipo" runat="server" Text='<%# Eval("tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Responsable" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="Responsable" runat="server" Text='<%# Eval("Responsable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                    
                                <asp:ButtonField  HeaderText="Subir<br />Escaneado" CommandName="Subir" ButtonType="Image" ImageUrl="~\ico\upload.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:TemplateField HeaderText="Ver Escaneado" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:HyperLink id="hlEscaneado" runat="server" ImageUrl="~\ico\viewFile.png" Target = "_blank" 
                                            NavigateUrl='<%# Eval("soporte") %>'>Ver Archivo </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Acciones" HeaderStyle-CssClass="text-center" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField CommandName="Ver" HeaderStyle-CssClass="text-center" ButtonType="Image" ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>
                    
                                <asp:ButtonField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField  CommandName="Imprimir" HeaderStyle-CssClass="text-center" ButtonType="Image" ImageUrl="~\ico\print.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Asistencia" HeaderStyle-CssClass="text-center" CommandName="asistencia" ButtonType="Image" ImageUrl="~\ico\checklist.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div><br />

            <div class="row" align="center">
                <div class="col-md-3 col-md-offset-3">
                    <asp:ImageButton alt="-" id="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" OnClick="MostrarModalAgregar"/>
                    <h4>Nueva Gestión Laboral</h4>
                </div>

                <div class="col-md-3">
                    <asp:ImageButton alt="-" id="btnDesLista" runat="server" ImageUrl="~\ico\descargar.png" OnClick="MostrarModalImprimir"/>
                    <h4>Descargar Lista</h4>
                </div>
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

    <!-- IndexAddModal -->
    <div id="IndexAddModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Gestion Laboral</h3>
                </div>
                <asp:updatepanel runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="text-center">Tipo de Gestion Laboral</h3>
                                    </div>
                                </div><br />
                                
                                <div class="row"> 
                                    <div class="col-md-6 col-md-offset-3">
                                        <asp:Button id="btnEntrega" runat="server" Text="Entrega de Equipos" 
                                            class="btn btn-block btn-success" OnClick="MostrarNuevoEntrega"></asp:Button></div>
                                </div><br />
                                
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3"><asp:Button id="Button2" runat="server" Text="Capacitación" class="btn btn-block btn-warning" OnClick="MostrarNuevoCapacitacion"></asp:Button></div>
                                </div><br />
                                
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3"><asp:Button id="btnJornada" runat="server" Text="Jornada de Examenes" class="btn btn-block btn-primary" OnClick="MostrarNuevoJornada"></asp:Button></div>
                                </div><br />
                                
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3"><asp:Button id="btnActividad" runat="server" Text="Actividad Recreativa" class="btn btn-block btn-danger" OnClick="MostrarNuevoActividad"></asp:Button></div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <div class="row">
                                <div class="col-md-4 col-md-offset-4">
								<button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>

                            </div>
                            </div>
                        </ContentTemplate>
                        <Triggers></Triggers>
                    </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Entrega de equipos y materiales -->
    <div>
        <!-- AddEntrega -->
        <div id="AddEntrega" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Entrega de Equipos y Materiales</h3>
                    </div>
                    <asp:updatepanel id="UpdatePanel1" runat="server">
                           <ContentTemplate>
                               <div class="modal-body form-group">
                                   <br />

                                   <asp:PlaceHolder runat="server" id="phEmpAddEnt">
                                       <div class="row">
                                           <div>
                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlEmpAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpAddEnt_SelectedIndexChanged"></asp:DropDownList>
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlEmpAddEnt" runat="server" 
                                                        ValidationGroup="ValidationAddEnt"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucAddEnt">
                                       <div class="row">
                                           <div>
                                               <div class="col-md-6 control-label">
                                                   <label>Sucursal: </label>
                                               </div>
    
                                                <div class="col-md-6">
                                                    <asp:DropDownList id="ddlSucAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucAddEnt_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlSucAddEnt" runat="server" 
                                                        ValidationGroup="ValidationAddEnt"/>

                                                </div>

                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuAddEnt">
                                       <div class="row">
                                           <div>
                                                <div class="col-md-6 control-label">
                                                    <label>Responsable: </label>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:DropDownList id="ddlUsuAddEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                        Font-Bold="true" ControlToValidate="ddlUsuAddEnt" runat="server" 
                                                        ValidationGroup="ValidationAddEnt"/>
                                                </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">
                                               Fecha de la Actividad: 

                                           </label>
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtFechaEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                                   Font-Bold="true" ControlToValidate="txtFechaEntrega" runat="server" 
                                                   ValidationGroup="ValidationAddEnt"/>
                                           </div>
                                       </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Descripción: </label>
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtDescEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                                   Font-Bold="true" ControlToValidate="txtDescEntrega" runat="server" 
                                                   ValidationGroup="ValidationAddEnt"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisAddEnt">
                                       <div class="row">
                                           <div>
                                               <label class="col-md-6 control-label">Seleccione los trabajadores que asistiran a la Actividad: </label>
                                               <div class="col-md-6">
                                                   <asp:Button id="Button1" runat="server" Text="Lista de Trabajadores" 
                                                       class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                               </div>

                                           </div>
                                       </div>
                                   </asp:PlaceHolder>
                               </div>
                               
                               <div class="modal-footer">
                                   <div class="row">
                                       <div class="col-md-4 col-md-offset-2"><asp:Button id="btnAddEntrega" runat="server" Text="Agregar" class="btn btn-block btn-info" OnClick="InsertarEntrega" ValidationGroup="ValidationAddEnt"/></div>
                                       <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                   </div>
                               </div>
                           </ContentTemplate>
                           <Triggers></Triggers>
                       </asp:updatepanel>
                </div>
            </div>
        </div>

        <!-- Edit Entrega Modal -->
        <div id="EditEntrega" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Entrega de Equipos y Materiales</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel2" runat="server">
                           <ContentTemplate>
                               <div class="modal-body form-group">
                                   <asp:HiddenField id="hdfEditEntregaID" runat="server"/><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpEditEnt">
                                       <div class="row">
                                           <div>
    <div class="col-md-6 control-label">
        <label>Empresa: </label>
    </div>
    
    <div class="col-md-6">
        <asp:DropDownList id="ddlEmpEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEditEnt_SelectedIndexChanged"></asp:DropDownList>
        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
            Font-Bold="true" ControlToValidate="ddlEmpEditEnt" runat="server" 
            ValidationGroup="ValidationEditEnt"/>
    </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucEditEnt">
                                       <div class="row">
                                           <div>
    <div class="col-md-6 control-label">
        <label>Sucursal: </label>
    </div>
    <div class="col-md-6">
        <asp:DropDownList id="ddlSucEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEditEnt_SelectedIndexChanged"></asp:DropDownList>
        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
            Font-Bold="true" ControlToValidate="ddlSucEditEnt" runat="server" 
            ValidationGroup="ValidationEditEnt"/>
    </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuEditEnt">
                                       <div class="row">
                                           <div>
    <div class="col-md-6 control-label">
        <label>Responsable: </label>
    </div>
    <div class="col-md-6">
        <asp:DropDownList id="ddlUsuEditEnt" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="ddlUsuEditEnt" runat="server" 
         ValidationGroup="ValidationEditEnt"/>
    </div>

                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Fecha de la Actividad: </label>
                                           <div class="col-md-6">
    <asp:TextBox id="txtFechaEditEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="txtFechaEditEntrega" runat="server" 
         ValidationGroup="ValidationEditEnt"/>
                                           </div>
                                       </div>
                                   </div><br/>
                                    
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Descripción: </label>
                                           <div class="col-md-6">
    <asp:TextBox id="txtDescEditEntrega" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
         setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
         Font-Bold="true" ControlToValidate="txtDescEditEntrega" runat="server" 
         ValidationGroup="ValidationEditEnt"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisEditEnt">
                                       <div class="row">
                                           <div>
    <label class="col-md-6 control-label">Seleccione los trabajadores que asistiran a la Actividad: </label>
    <div class="col-md-6">
        <asp:Button id="Button8" runat="server" Text="Lista de Trabajadores" class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
     </div>
                                           </div>
                                       </div>
                                   </asp:PlaceHolder>

                               </div>
                               <div class="modal-footer">
                                   <div class="row">
                                    <div class="col-md-4 col-md-offset-2"><asp:Button id="btnEditar" runat="server" Text="Editar" class="btn btn-block btn-info" OnClick="btnEditarEntrega_Click" ValidationGroup="ValidationEditEnt"/></div>
                                    <div class="col-md-4"><button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button></div>
                                </div>
                               </div>
                           </ContentTemplate>
                           <Triggers></Triggers>
                       </asp:updatepanel>
                </div>
            </div>
        </div>
    </div>

    <!-- Capacitacion -->
    <div>
        <!-- AddCapacitacion -->
        <div id="AddCapacitacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Capacitación</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div class="modal-body form-group">
                                <br />
                                
                                <asp:PlaceHolder runat="server" id="phEmpAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Empresa: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlEmpAddCap" AutoPostBack="true" runat="server" 
                                                ClientIDMode="Static" CssClass="form-control" 
                                                OnSelectedIndexChanged="ddlEmpAddCap_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlEmpAddCap" runat="server" 
                                                ValidationGroup="ValidationAddCap"/>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phSucAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Sucursal: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlSucAddCap" AutoPostBack="true" runat="server" 
                                                ClientIDMode="Static" CssClass="form-control" 
                                                OnSelectedIndexChanged="ddlSucAddCap_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="ddlSucAddCap" runat="server" 
                                                ValidationGroup="ValidationAddCap"/>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>
                                
                                <asp:PlaceHolder runat="server" id="phUsuAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Responsable: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:DropDownList id="ddlUsuAddCap" AutoPostBack="true" runat="server" 
                                                ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" 
                                                Font-Size="10" Font-Bold="true" ControlToValidate="ddlUsuAddCap" 
                                                runat="server" ValidationGroup="ValidationAddCap"/>
                                        </div>
                                    </div><br />
                                </asp:PlaceHolder>
                                
                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Fecha de la Capacitación: </label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox id="txtFechaCapacitacion" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtFechaCapacitacion" runat="server" 
                                            ValidationGroup="ValidationAddCap"/>
                                    </div>
                                </div><br/>
                                   
                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Descripción de la capacitacion:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox id="txtDescCapAdd" runat="server" TextMode="multiline" 
                                            class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                        </asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                            Font-Bold="true" ControlToValidate="txtDescCapAdd" runat="server"
                                            ValidationGroup="ValidationAddCap"/>
                                    </div>
                                </div><br/>
                                
                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Objetivo de la capacitacion:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox id="txtObjCapAdd" runat="server" TextMode="multiline" 
                                            class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                        </asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                            Font-Bold="true" ControlToValidate="txtObjCapAdd" runat="server" 
                                            ValidationGroup="ValidationAddCap"/>
                                    </div>
                                </div><br/>
                                   
                                <div class="row">
                                    <div class="col-md-6 control-label">
                                        <label>Cantidad de Horas:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox id="txtHoras" type="number" runat="server" ClientIDMode="Static" 
                                            CssClass="form-control"></asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                            Font-Bold="true" ControlToValidate="txtHoras" runat="server" 
                                            ValidationGroup="ValidationAddCap"/>
                                    </div>
                                </div><br />
                                   
                                <asp:PlaceHolder runat="server" id="phAsisAddCap">
                                    <div class="row">
                                        <div class="col-md-6 control-label">
                                            <label>Seleccione los trabajadores que asistiran a la Actividad: </label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button  runat="server" Text="Lista de Trabajadores" 
                                                class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                        </div>
                                    </div>
                                </asp:PlaceHolder>
                            </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                   
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                            OnClick="InsertarCapacitacion" ValidationGroup="ValidationAddCap"/>
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

        <!-- EditCapacitacion -->
        <div id="EditCapacitacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Capacitación</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel13" runat="server">
                           <ContentTemplate> 
                               <div class="modal-body form-group">
                                <asp:HiddenField id="hdfEditCapacitacionID" runat="server"/><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpEditCap">
                                       <div class="row">
                                           <div class="col-md-6 control-label">
                                               <label>Empresa: </label>
                                           </div>
                                           <div class="col-md-6">
                                               <asp:DropDownList id="ddlEmpEditCap" AutoPostBack="true" runat="server" 
                                                   ClientIDMode="Static" CssClass="form-control" 
                                                   OnSelectedIndexChanged="ddlEmpEditCap_SelectedIndexChanged">
                                               </asp:DropDownList>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="ddlEmpEditCap" runat="server" 
                                                   ValidationGroup="ValidationEditCap"/>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucEditCap">
                                       <div class="row">
                                           <div class="col-md-6 control-label">
                                               <label>Sucursal: </label>
                                           </div>
                                           <div class="col-md-6">
                                               <asp:DropDownList id="ddlSucEditCap" AutoPostBack="true" runat="server" 
                                                   ClientIDMode="Static" CssClass="form-control" 
                                                   OnSelectedIndexChanged="ddlSucEditCap_SelectedIndexChanged">
                                               </asp:DropDownList>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" 
                                                   Font-Bold="true" ControlToValidate="ddlSucEditCap" runat="server" 
                                                   ValidationGroup="ValidationEditCap"/>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuEditCap">
                                       <div class="row">
                                           <div class="col-md-6 control-label">
                                               <label>Responsable: </label>
                                           </div>
                                           
                                           <div class="col-md-6">
                                               <asp:DropDownList id="ddlUsuEditCap" AutoPostBack="true" runat="server" 
                                                   ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="ddlUsuEditCap" runat="server" 
                                                   ValidationGroup="ValidationEditCap"/>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                        <label class="col-md-6 control-label">Fecha de la Capacitación: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox id="txtFechaEditCapacitacion" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtFechaEditCapacitacion" runat="server" 
                                                ValidationGroup="ValidationEditCap"/>
                                         </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                        <label class="col-md-6 control-label">Descripción de la capacitacion: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox id="txtDesCapEdit" runat="server" TextMode="multiline" 
                                                class="form-control" Rows="3" ClientIDMode="Static" 
                                                CssClass="form-control">
                                            </asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDesCapEdit" runat="server" 
                                                ValidationGroup="ValidationEditCap"/>
                                         </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                        <label class="col-md-6 control-label">Objetivos de la capacitacion: </label>
                                        <div class="col-md-6">
                                            
                                            <asp:TextBox id="txtObjCapEdit" runat="server" TextMode="multiline" 
                                                class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control">
                                            </asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtObjCapEdit" runat="server" 
                                                ValidationGroup="ValidationEditCap"/>
                                         </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                        <label class="col-md-6 control-label">Cantidad de Horas: </label>
                                        <div class="col-md-6">
                                            <asp:TextBox id="txtHorasEditCapacitacion" type="number" runat="server" 
                                                ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                            
                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtHorasEditCapacitacion" runat="server" 
                                                ValidationGroup="ValidationEditCap"/>
                                        </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisEditCap" Visible="false">
                                       <div class="row">
                                           <label class="col-md-6 control-label">
                                               Seleccione los trabajadores que asistiran a la Capacitación: 
                                           </label>
                                           <div class="col-md-6">
                                               <asp:Button id="Button15" runat="server" Text="Lista de Trabajadores" 
                                                   class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                           </div>
                                       </div>
                                   </asp:PlaceHolder>
                               </div>
                               
                               <div class="modal-footer">
                                   <div class="row">
                                        <div class="col-md-4 col-md-offset-2">
                                            <asp:Button id="Button4" runat="server" Text="Editar" class="btn btn-block btn-info" 
                                                OnClick="btnEditarCapacitacion_Click" ValidationGroup="ValidationEditCap"/>
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
    </div>

    <!-- Actividades Recreativas -->
    <div>
        <!-- Add Actividad Modal-->
        <div id="AddActividad" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Actividad Recreativa</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel9" runat="server">
                           <ContentTemplate> 
                               <div class="modal-body form-group">
                                   <br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpAddAct">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlEmpAddAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control" 
                                                       OnSelectedIndexChanged="ddlEmpAddAct_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlEmpAddAct" runat="server" 
                                                       ValidationGroup="ValidationAddAct"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucAddAct">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Sucursal: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlSucAddAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control" 
                                                       OnSelectedIndexChanged="ddlSucAddAct_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlSucAddAct" runat="server" 
                                                       ValidationGroup="ValidationAddAct"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuAddAct">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Responsable: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlUsuAddAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlUsuAddAct" runat="server" 
                                                       ValidationGroup="ValidationAddAct"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Fecha de la Actividad Recreativa: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtFechaActividad" runat="server" ClientIDMode="Static"
                                                   CssClass="form-control" TextMode="Date"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtFechaActividad" runat="server" 
                                                   ValidationGroup="ValidationAddAct"/>
                                           </div>
                                       </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Descripción: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtDescActividad" TextMode="multiline" class="form-control" Rows="3"
                                                   runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtDescActividad" runat="server" 
                                                   ValidationGroup="ValidationAddAct"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisAddAct">
                                       <div class="row">
                                           <div>
                                               <label class="col-md-6 control-label">
                                                   Seleccione los trabajadores que asistiran a la Actividad: </label>
                                               
                                               <div class="col-md-4">
                                                   <asp:Button id="Button6" runat="server" Text="Lista de Trabajadores" 
                                                       class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                               </div>
                                           </div>
                                       </div>
                                   </asp:PlaceHolder>

                            </div>
                               
                               <div class="modal-footer">
                                   <div class="row">
                                       
                                       <div class="col-md-4 col-md-offset-2">
                                           <asp:Button id="Button16" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                               OnClick="InsertarActividad" ValidationGroup="ValidationAddAct"/>
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

        <!-- Edit Actividad Modal -->
        <div id="EditActividad" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Actividad Recreativa</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel12" runat="server">
                           <ContentTemplate>
                               
                               <div class="modal-body form-group">
                                   <asp:HiddenField id="hdfEditActividadID" runat="server"/><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpEditAct">
                                       <div class="row">
                                           <div>
                                               
                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlEmpEditAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control" 
                                                       OnSelectedIndexChanged="ddlEmpEditAct_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlEmpEditAct" runat="server" 
                                                       ValidationGroup="ValidationEditAct"/>
                                               </div>

                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucEditAct">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                  <label>Sucursal: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlSucEditAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control"
                                                       OnSelectedIndexChanged="ddlSucEditAct_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlSucEditAct" runat="server" 
                                                       ValidationGroup="ValidationEditAct"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuEditAct">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Responsable: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlUsuEditAct" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlUsuEditAct" runat="server" 
                                                       ValidationGroup="ValidationEditAct"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Fecha de la Actividad Recreativa: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtFechaEditActividad" runat="server" ClientIDMode="Static" 
                                                   CssClass="form-control" TextMode="Date"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtFechaEditActividad" runat="server" 
                                                   ValidationGroup="ValidationEditAct"/>
                                           </div>
                                       </div>
                                   </div><br/>
                                    
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Descripción: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtDescEditActividad" runat="server" ClientIDMode="Static" 
                                                   CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtDescEditActividad" runat="server" 
                                                   ValidationGroup="ValidationEditAct"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisEditAct">
                                       <div class="row">
                                           <div>
                                               <label class="col-md-6 control-label">
                                                   Seleccione los trabajadores que asistiran a la Actividad Recreativa: </label>
                                               
                                               <div class="col-md-6">
                                                   <asp:Button id="Button13" runat="server" Text="Lista de Trabajadores" 
                                                       class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                               </div>

                                           </div>
                                       </div>
                                   </asp:PlaceHolder>
                               </div>
                               
                               <div class="modal-footer">
                                   <div class="row">
                                       <div class="col-md-4 col-md-offset-2">
                                           <asp:Button id="Button7" runat="server" Text="Editar" class="btn btn-block btn-info" 
                                               OnClick="btnEditarActividad_Click" ValidationGroup="ValidationEditAct"/>
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
    </div>

    <!-- Jornada Examenes -->
    <div>
        <!-- Add Jornada Modal -->
        <div id="AddJornada" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Agregar Jornada de examenes</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel8" runat="server">
                           <ContentTemplate> 
                               <div class="modal-body form-group">
                                   <br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpAddJor">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlEmpAddJor" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control"
                                                       OnSelectedIndexChanged="ddlEmpAddJor_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlEmpAddJor" runat="server" 
                                                       ValidationGroup="ValidationAddJor"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucAddJor">
                                       <div class="row">
                                           <div>
                                               
                                               <div class="col-md-6 control-label">
                                                   <label>Sucursal: </label>
                                               </div>
                                               
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlSucAddJor" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control" 
                                                       OnSelectedIndexChanged="ddlSucAddJor_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlSucAddJor" runat="server" 
                                                       ValidationGroup="ValidationAddJor"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuAddJor">
                                       <div class="row">
                                           <div>
                                               
                                               <div class="col-md-6 control-label">
                                                   <label>Responsable: </label>
                                               </div>
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlUsuAddJor" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlUsuAddJor" runat="server" 
                                                       ValidationGroup="ValidationAddJor"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <div class="row">
                                       <div>

                                           <label class="col-md-6 control-label">Fecha de la Jornada: </label>

                                           <div class="col-md-6">
                                               <asp:TextBox id="txtFechaJornada" runat="server" ClientIDMode="Static"
                                                   CssClass="form-control" TextMode="Date"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtFechaJornada" runat="server" 
                                                   ValidationGroup="ValidationAddJor"/>
                                           </div>
                                       </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                       <div>
                                           <label class="col-md-6 control-label">Descripción: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtDescJornada" runat="server" TextMode="multiline" 
                                                   class="form-control" Rows="3" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                               
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                   setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                   Font-Bold="true" ControlToValidate="txtDescJornada" runat="server" 
                                                   ValidationGroup="ValidationAddJor"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisAddJor">
                                       <div class="row">
                                           <div>
                                               <label class="col-md-6 control-label">
                                                   Seleccione los trabajadores que asistiran a la Actividad: </label>
                                               <div class="col-md-4">
                                                   <asp:Button id="Button3" runat="server" Text="Lista de Trabajadores" 
                                                       class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                               </div>
                                           </div>
                                       </div>
                                   </asp:PlaceHolder>
                               </div>
                               
                               <div class="modal-footer">
                                   <div class="row">
                                       <div class="col-md-4 col-md-offset-2">
                                           <asp:Button id="Button14" runat="server" Text="Agregar" class="btn btn-block btn-info" 
                                               OnClick="InsertarJornada" ValidationGroup="ValidationAddJor"/>
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

        <!-- Edit Jornada Modal -->
        <div id="EditJornada" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Editar Jornada de Examenes</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel10" runat="server">
                           <ContentTemplate>
                               <div class="modal-body form-group">
                                   <asp:HiddenField id="hdfEditJornadaID" runat="server"/><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phEmpEditJor">
                                       <div class="row">
                                           <div>

                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>

                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlEmpEditJor" AutoPostBack="true" runat="server" 
                                                       ClientIDMode="Static" CssClass="form-control" 
                                                       OnSelectedIndexChanged="ddlEmpEditJor_SelectedIndexChanged"></asp:DropDownList>
                                                   
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlEmpEditJor" runat="server" 
                                                       ValidationGroup="ValidationEditJor"/>
                                               </div>

                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phSucEditJor">
                                       <div class="row">
                                           <div>
                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlSucEditJor" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlSucEditJor_SelectedIndexChanged"></asp:DropDownList>
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlSucEditJor" runat="server" 
                                                       ValidationGroup="ValidationEditJor"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>
                                   
                                   <asp:PlaceHolder runat="server" id="phUsuEditJor">
                                       <div class="row">
                                           <div>
                                               <div class="col-md-6 control-label">
                                                   <label>Empresa: </label>
                                               </div>
                                               <div class="col-md-6">
                                                   <asp:DropDownList id="ddlUsuEditJor" AutoPostBack="true" runat="server" ClientIDMode="Static" CssClass="form-control" OnSelectedIndexChanged="ddlEmpEditJor_SelectedIndexChanged"></asp:DropDownList>
                                                   <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                       setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                       Font-Bold="true" ControlToValidate="ddlUsuEditJor" runat="server" 
                                                       ValidationGroup="ValidationEditJor"/>
                                               </div>
                                           </div>
                                       </div><br />
                                   </asp:PlaceHolder>

                                   <div class="row">
                                      <div>

                                         <label class="col-md-6 control-label">Fecha de la Jornada: </label>

                                         <div class="col-md-6">
                                            <asp:TextBox id="txtFechaEditJornada" runat="server" ClientIDMode="Static" 
                                                CssClass="form-control" TextMode="Date"></asp:TextBox>

                                             <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                 setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                 Font-Bold="true" ControlToValidate="txtFechaEditJornada" runat="server" 
                                                 ValidationGroup="ValidationEditJor"/>
                                         </div>
                                      </div>
                                   </div><br/>
                                   
                                   <div class="row">
                                       <div>

                                           <label class="col-md-6 control-label">Descripción: </label>
                                           
                                           <div class="col-md-6">
                                               <asp:TextBox id="txtDescEditJornada" runat="server" ClientIDMode="Static" 
                                                   CssClass="form-control" TextMode="multiline" class="form-control" Rows="3"></asp:TextBox>
                                            
                                               <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                                Font-Bold="true" ControlToValidate="txtDescEditJornada" runat="server" 
                                                ValidationGroup="ValidationEditJor"/>
                                           </div>
                                       </div>
                                   </div><br />
                                   
                                   <asp:PlaceHolder runat="server" id="phAsisEditJor">
                                       <div class="row">
                                           <div>
                                               
                                               <label class="col-md-6 control-label">
                                                   Seleccione los trabajadores que asistiran a la Jornada: </label>
                                               
                                               <div class="col-md-4">
                                                   <asp:Button id="Button9" runat="server" Text="Lista de Trabajadores" 
                                                       class="btn btn-block btn-success" OnClick="MostrarModalLista"/>
                                               </div>
                                           </div>

                                       </div>
                                   </asp:PlaceHolder>
                               </div>

                               <div class="modal-footer">
                                   <div class="row">
                                       <div class="col-md-4 col-md-offset-2">
                                           <asp:Button id="Button5" runat="server" Text="Editar" class="btn btn-block btn-info" 
                                               OnClick="btnEditarJornada_Click" ValidationGroup="ValidationEditJor"/>
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
    </div>

    <!-- otros  modales  -->
    <div>
        <!-- Delete Record Modal-->
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
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btnDelete" runat="server" Text="Eliminar" 
                                            class="btn btn-block btn-info" OnClick="EliminarRegistro"/>
                                    </div>

                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" 
                                        aria-hidden="true">Cerrar</button>
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
        
        <!-- print lista Modal-->
        <div id="PrintListaModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Imprimir Registro</h3>
                    </div>
                            <div class="modal-body form-group">
                                <asp:HiddenField id="hImprimir" runat="server"/>
                                
                                <div class="row">
                                    <h4 class="text-center">¿Seguro desea imprimir este registro?</h4>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <asp:Button id="btPrint" runat="server" Text="Imprimir" AutoPostBack="true"
                                            class="btn btn-block btn-info" OnClick="btPrint_Click"/>
                                    </div>

                                    <div class="col-md-4">
                                        <button class="btn btn-block btn-default" data-dismiss="modal" 
                                        aria-hidden="true">Cerrar</button>
                                    </div>
                                </div>
                            </div>
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

        <!-- lista trabajadores  -->
        <div id="listaModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Seleccione Trabajadores</h3>
                    </div>

                    <asp:updatepanel id="UpdatePanel4" runat="server">
                            <ContentTemplate>

                                <div class="modal-body form-group">
                                    <asp:CheckBoxList id="chkTrabajadores" runat="server"></asp:CheckBoxList>
                                </div>
                                
                                <div class="modal-footer">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-4">
										<button class="btn btn-block btn-info" data-dismiss="modal" aria-hidden="true">Aceptar</button></div>
                                    </div>
                                </div>

                            </ContentTemplate>
                            <Triggers></Triggers>
                        </asp:updatepanel>

                </div>
            </div>
        </div>

        <!-- Escaneado Modal -->
        <div id="EscaneadoModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        <h3>Subir Archivo Escaneado</h3>
                    </div>
                    
                    <asp:updatepanel id="UpdatePanel14" runat="server">
                        <ContentTemplate>
                            
                            <div class="modal-body form-group">
                                <asp:HiddenField id="hdfIDEsc" runat="server"/>
                                
                                <div class="row form-group">
                                    <label class="col-md-2 control-label">Archivo: </label>
                                    <div class="col-md-10">
                                        <asp:FileUpload id="flEscaneado" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:FileUpload>

                                    </div>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    
                                    <div class="col-md-3">
                                        <asp:Button id="btnEscaneado" runat="server" Text="Subir" OnClick="btnSubirArchivo" 
                                            class="btn btn-block btn-info"/>
                                    </div>
                                    
                                    <div class="col-md-3">
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

        <!-- Msj Modal -->
        <ucm:ucMsjModal runat="server" id="ucMsjModal"/>
    </div>
</asp:Content>