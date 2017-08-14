<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_EvaluacionRiesgo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_EvaluacionRiesgo" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        <ContentTemplate>
            
            <div class="container" style ="width:100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Fase: Hacer</a></li>
                    <li><a href="#">Evaluación de Riesgos</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Evaluación de Riesgos</h1>
                </div> 

                <div class="row" align="center">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4">
                            <h4 class="text-left">Empresa</h4> 
                            <asp:DropDownList runat="server" AutoPostBack="true" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-4">
                            <h4 class="text-left">Seleccione una Sucursal</h4>
                            <asp:DropDownList runat="server" CssClass="form-control" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                </div>
                <br />
                
                <div class="row" style="overflow:auto;">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap">
                            <ucpag:pagination runat="server" id="pagination"/>
                        
                            <asp:GridView id="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand" 
                                onpageindexchanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" 
                                EmptyDataText="No existen Registros">
                                <rowstyle  HorizontalAlign="Center"/>
                            
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label id="id_ide_puesto" runat="server" Text='<%# Eval("id_ide_puesto") %>'/>
                                            <asp:Label id="id_puesto" runat="server" Text='<%# Eval("id_puesto") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Puesto de Trabajo" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Puesto" runat="server" Text='<%# Eval("Puesto") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Evaluación Riesgos" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Evaluacion" runat="server" Text='<%# Eval("Evaluacion") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="N° de Evaluaciones" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label id="Num_Evaluacion" runat="server" Text='<%# Eval("Num_Evaluacion") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField HeaderText="Agregar Evaluación" CommandName="add" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                        ImageUrl="~\ico\agregar.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField HeaderText="Ver Evaluaciones" CommandName="Ver" ButtonType="Image" HeaderStyle-CssClass="text-center"
                                        ImageUrl="~\ico\view.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>
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
    
    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" ID="ucMsjModal"/>
</asp:Content>