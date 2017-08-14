<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_MatrizLegal.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_MatrizLegal" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width: 100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="#">Matriz Legal</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Matriz Legal</h1>
                </div>


                <!-- Buscar -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <asp:TextBox id="txtSearch" 
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese Texto a Buscar" 
                            runat="server" class="form-control" PlaceHolder="Ingrese la norma a buscar"></asp:TextBox>
                    </div>
                  
                    <div class="col-md-2">
                        <asp:Button id="btnSearch" 
                            data-toggle="tooltip" data-placement="bottom" title="Presione para Buscar" 
                            runat="server" Text="Buscar" CssClass="btn btn-info" OnClick="BuscarRegistro"/>
                    </div>
                </div>
                <br />

                <!-- Filtro  -->
                <div class="row">
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4 col-md-offset-2">
                                <h4 class="text-center">Empresa</h4>
                                <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                    </asp:PlaceHolder>

                </div>
                <br />

                <div class="row">
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-3 col-md-offset-1 text-center">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <div class="col-md-3 text-center">
                            <h4 class="text-center">Tipo de Norma</h4>
                            <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" id="ddlTipoNorma" 
                                OnSelectedIndexChanged="ddlTipoNorma_SelectedIndexChanged"
                                data-toggle="tooltip" data-placement="bottom" 
                                title="Seleccione un tipo de norma">
                                <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                <asp:ListItem Text="General" Value="General"></asp:ListItem>
                                <asp:ListItem Text="Especifico" Value="Especifico"></asp:ListItem>
                                <asp:ListItem Text="Jurisprudencia" Value="Jurisprudencia"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                
                    <div class="col-md-3 text-center">
                        <h4 class="text-center">Año Norma</h4>
                        <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="ddlAñoNorma" 
                            OnSelectedIndexChanged="ddlAñoNorma_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" 
                            title="Seleccione el año de una norma para filtrar la tabla"></asp:DropDownList>
                    </div>

                </div>
                <br />
            
                <div class="row">

                    <div class="col-md-12">
                      <div class="box box-solid">
                        <div class="box-header with-border">
                          <h3 class="box-title">Estatus de cumplimiento de la matriz = <% =CalcularEstatus()%>%</h3>
                        </div>
                        <div class="box-body">
                          <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="barraEstatus" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:<% =CalcularEstatus()%>%">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable"
                                runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                                OnRowCommand="GridView1_RowCommand" onpageindexchanging="GridView1_PageIndexChanging"
                                OnRowCreated="GridView1_RowCreated" EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                
                                <Columns> 

                                    <asp:TemplateField HeaderText="Sucursal" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="id_norma" runat="server" Visible="false" Text='<%# Eval("id_normas") %>'/>
                                            <asp:Label id="id_sucursal" runat="server" Visible="false" Text='<%# Eval("id_sucursal") %>'/>
                                            <asp:HiddenField runat="server" id="id_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>

                                            <asp:Label id="lbempresa" runat="server" Text='<%# Eval("Sucursal") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                    
                                    <asp:TemplateField HeaderText="Norma / Tema Especifico" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="documento" runat="server" Text='<%# Eval("documento") +" /<br/> "+Eval("tema_especifico") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Año" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="anho" runat="server" Text='<%# Eval("anho") %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                    <asp:TemplateField HeaderText="Articulo / Literal" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="articulo" runat="server" Text='<%# Eval("articulo") +" /  "+ Eval("literal") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Obligaciones" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="obligaciones" runat="server" Text='<%# Eval("obligaciones") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tipo matriz" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="tipo_matriz" runat="server" Text='<%# Eval("tipo_matriz") %>'/></ItemTemplate>
                                    </asp:TemplateField>

                    
                                    <asp:ButtonField HeaderText="Medidas a Cumplir" HeaderStyle-CssClass="text-center" CommandName="seguimiento" Text="seguimiento" ButtonType="Image" ImageUrl="~\ico\seguimiento.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
                                        
                                    <asp:TemplateField HeaderText="Estatus norma" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate><asp:Label id="estatus_norma" runat="server" Text='<%# Eval("estatus")+" %" %>'/></ItemTemplate>
                                    </asp:TemplateField>
                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:updatepanel>

</asp:Content>