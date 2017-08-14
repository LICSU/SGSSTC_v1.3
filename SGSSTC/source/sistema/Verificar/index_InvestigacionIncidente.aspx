<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_InvestigacionIncidente.aspx.cs" Inherits="SGSSTC.source.sistema.Verificar.index_InvestigacionIncidente" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel runat="server">
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Verificar</a></li>
                    <li><a href="#">Investigación de Incidente Laboral</a></li>
                </ol>            
            
                <div class="page-header">
                    <h1 class="text-center">Investigación de Incidente Laboral</h1>
                </div> 

                <div class="row text-center">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" runat="server" class="form-control" PlaceHolder="Ingrese nombre o apellido del afectado"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>

                <br />
            
                <div class="row text-center">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-3">
                            <label>Filtrar por Empresa</label>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                                
                    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
                        <div class="col-md-3">
                            <label>Filtrar por Sucursal</label>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <div class="col-md-3">
                        <label>Filtrar por Area</label>
                        <asp:DropDownList runat="server" id="ddlArea" data-toggle="tooltip" data-placement="bottom" title="Seleccione un Área" CssClass="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label>Fecha Inicio</label>
                        <asp:TextBox runat="server" id="txtFechaInicio" CssClass="form-control" TextMode="Date" placeholder="dd/mm/yyyy" 
                          AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                    </div>

                    <div class="col-md-3">
                        <label>Fecha Fin</label>
                        <asp:TextBox runat="server" id="txtFechaFin" CssClass="form-control" TextMode="Date" placeholder="dd/mm/yyyy" 
                          AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                    </div>

                </div>

                <br />
            
                <div class="row" style="overflow:auto;">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                                OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                
                            <Columns>
                                <asp:TemplateField HeaderText="Id Accidente" visible ="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="id_at_it_el_pa" runat="server" Text='<%# Eval("id_at_it_el_pa") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                <asp:TemplateField HeaderText="Fecha del Incidente" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc", "{0:dd/MM/yyyy}") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                    
                                
                                <asp:TemplateField HeaderText="Afectado" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="afectado" runat="server" Text='<%# Eval("Afectado") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                
                                <asp:TemplateField HeaderText="Posee Investigación" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label id="posee" runat="server" Text='<%# Eval("posee") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:ButtonField  HeaderText="Imprimir" CommandName="print" ButtonType="Image"  HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\print.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                 <asp:ButtonField HeaderText="Crear Investigacion" CommandName="crear" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                     ImageUrl="~\ico\addConsulta.png">
                                    <ControlStyle></ControlStyle>
                                 </asp:ButtonField>

                                <asp:ButtonField HeaderText="Ver" CommandName="Ver" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                    ImageUrl="~\ico\view.png">
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

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>
    
    
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
                            <asp:Button id="btPrint" runat="server" Text="Imprimir" AutoPostBack="true" class="btn btn-block btn-info" 
                                OnClick="btPrint_Click"/>
                        </div>

                        <div class="col-md-4">
                            <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>

                        </div>
                    </div>

                </div>

            </div>

        </div>
    
    </div>


    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" ID="ucMsjModal"/>
</asp:Content>