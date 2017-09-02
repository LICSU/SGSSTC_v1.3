<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SGSSTC.source.sistema.Registro.index" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel id="updatePanelPrinicpal" runat="server">
        
        <ContentTemplate>
            
            <div class="page-header">
                <h1 class="text-center">Registro de Transacciones</h1>
            </div>
            
            <div class="row">                
                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4 col-md-offset-2">
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
            </div><br />
            
            
            <div class="row"> 
                <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">TipoEvento</h4>
                        <asp:DropDownList runat="server" id="ddlTipoEvento" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoEvento_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                
                <asp:PlaceHolder runat="server" id="phUsuario">
                    <div class="col-md-4">
                        <h4 class="text-center">Usuario</h4>
                        <asp:DropDownList runat="server" id="ddlUsuario" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlUsuario_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </asp:PlaceHolder>
                 
            </div><br />

            <div class="row"> 
                <div class="col-md-4 col-md-offset-2">
                    <h4>Fecha inicio</h4>
                    <asp:TextBox id="txtFechaInicio" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <h4>Fecha fin</h4>
                    <asp:TextBox id="txtFechaFin" runat="server" AutoPostBack="true" class="col-md-10" CssClass="form-control" TextMode="Date" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div> 
            </div><br/>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap"><ucpag:pagination runat="server" id="pagination"/>
                        
            <asp:GridView id="GridView1" 
                class="table table-bordered table-hover dataTable"
                runat="server"
                AutoGenerateColumns="false" 
                AllowPaging="true"
                PageSize="10" 
                onpageindexchanging="GridView1_PageIndexChanging"
                OnRowCreated="GridView1_RowCreated" 
                EmptyDataText="No existen Registros">
                <rowstyle  HorizontalAlign="Center"/>
                
                <Columns>
                    <asp:TemplateField HeaderText="Empresa">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" id="HFid_empresa" Visible="false" Value='<%# Eval("id_empresa") %>'/>
                            <asp:Label id="empresa" runat="server" Text='<%# Eval("nombreEmpresa") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Sucursal">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" id="HFid_sucursal" Visible="false" Value='<%# Eval("id_sucursal") %>'/>
                            <asp:Label id="sucursal" runat="server" Text='<%# Eval("nombreSucursal") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate><asp:Label id="Fecha" runat="server" Text='<%# Eval("fecha") %>'/></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Usuario">
                        <ItemTemplate><asp:Label id="descripcion" runat="server" Text='<%# Eval("nombreUsuario") %>'/></ItemTemplate>
                    </asp:TemplateField> 
                                        
                    <asp:TemplateField HeaderText="Evento">
                        <ItemTemplate><asp:Label id="tipo_evento" runat="server" Text='<%# Eval("tipoEvento") %>'/></ItemTemplate>
                    </asp:TemplateField> 
                                        
                    <asp:TemplateField HeaderText="Pagina">
                        <ItemTemplate><asp:Label id="pagina" runat="server" Text='<%# Eval("pagina") %>'/></ItemTemplate>
                    </asp:TemplateField> 

                </Columns>
            </asp:GridView>
                    </div>
                </div>
            </div><br />

            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:updatepanel>

</asp:Content>