<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_Sucursal.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_Sucursal" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <div class="container" style="width:100%;">

                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="../GestionDatos/index_Sucursal.aspx">Sucursal</a></li>
                    <li><a href="#">Crear Sucursal</a></li>
                </ol>
            
                <div class="page-header">
                    <h1 class="text-center">Registrar Sucursal</h1>
                </div>

                <asp:PlaceHolder runat="server" id="phEmpresaAdd" Visible="false">
                    <div class="row">
                        <div class="col-md-4">
                            <h4 class="text-center">Empresa</h4> 
                            <asp:DropDownList id="ddlEmpresaAdd"  
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" 
                                runat="server" ClientIDMode="Static" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Sucursal</h4>

                        <asp:TextBox id="txtNombreAdd" runat="server" MaxLength="50" ClientIDMode="Static" 
                            CssClass="form-control" placeholder="Nombre de la sucursal"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre de la Sucursal"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNombreAdd"
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                
                    <div class="col-md-4">
                        <h4 class="text-center">Actividad Principal</h4>

                        <asp:DropDownList runat="server" id="ddlItemDivision1" CssClass="form-control" 
                            OnSelectedIndexChanged="ddlItemDivision1_SelectedIndexChanged" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione la Actividad Principal"></asp:DropDownList>
                    
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlItemDivision1" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    
                    <asp:PlaceHolder runat="server" id="phActividad2" Visible="false">
                        <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-center">Actividad Secundaria</h4>

                            <asp:DropDownList runat="server" id="ddlItemDivision2" CssClass="form-control" 
                                OnSelectedIndexChanged="ddlItemDivision2_SelectedIndexChanged" AutoPostBack="true"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione la Actividad Secundaria">
                            </asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                
                    <asp:PlaceHolder runat="server" id="phActividad3" Visible="false">
                        <div class="col-md-4">
                            <h4 class="text-center">Otras Actividades</h4>

                            <asp:DropDownList runat="server" id="ddlItemDivision3" CssClass="form-control" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione la Tercera Actividad"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Región</h4>

                        <asp:DropDownList id="ddlRegionAdd" runat="server" ClientIDMode="Static" CssClass="form-control" 
                          AutoPostBack="true" OnSelectedIndexChanged="ddlRegionAdd_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione la Región donde esta ubicado la Sucursal"></asp:DropDownList>
                    
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlRegionAdd"
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                                
                    <div class="col-md-4">
                        <h4 class="text-center">Departamento</h4>

                        <asp:DropDownList id="ddlDptoAdd" runat="server" ClientIDMode="Static" CssClass="form-control" 
                          AutoPostBack="true" OnSelectedIndexChanged="ddlDptoAdd_SelectedIndexChanged"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el departamento donde esta ubicado la Sucursal"></asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlDptoAdd" 
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Municipio</h4>

                        <asp:DropDownList id="ddlMcpioAdd" runat="server" ClientIDMode="Static" CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el municipio donde esta ubicado la Sucursal">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlMcpioAdd" 
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                                
                    <div class="col-md-4">
                        <h4 class="text-center">Dirección</h4>

                        <asp:TextBox id="txtDireccionAdd" MaxLength="100" runat="server" ClientIDMode="Static" 
                            CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese la dirección de la Sucursal"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtDireccionAdd" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Representante</h4>

                        <asp:TextBox id="txtRepresentanteAdd" MaxLength="100" runat="server" ClientIDMode="Static" 
                            CssClass="form-control" 
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el nombre del representante de la sucursal"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtRepresentanteAdd" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                
                    <div class="col-md-4">
                        <h4 class="text-center">Télefono Fijo</h4>

                        <asp:TextBox id="txtFijoAdd" MaxLength="50" TextMode="Number" runat="server" ClientIDMode="Static" 
                            CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el número de teléfono fijo"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFijoAdd" 
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-center">Télefono Movil</h4>

                        <asp:TextBox id="txtMovilAdd" MaxLength="50" TextMode="Number" runat="server" ClientIDMode="Static" 
                            CssClass="form-control"
                            data-toggle="tooltip" data-placement="bottom" title="Ingrese el numero de teléfono movil"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMovilAdd" 
                            runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <br />

                <div class="row" align="center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton id="btnGuardar" runat="server" ImageUrl="~\ico\save.png" OnClick="GuardarRegistro" 
                            ValidationGroup="ValidationAdd"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para registrar la sucursal"/>
                        <h4>Registrar</h4>
                    </div>
                </div>

            </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger Controlid="btnGuardar"/>
        </Triggers>
    </asp:updatepanel>

    <div class="modal fade" id="Msjmodal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span>
                    </button>

                    <h4 class="modal-title">
                        <label id="lblMsjTitle1"></label>
                    </h4>
                </div>

                <div class="modal-body form-group">
                    <div class="row">
                        <div class="col-md-1">
                            <span id="icoModal1" class="fa fa-times fa-2x text-danger"></span>
                        </div>

                        <div class="col-md-11">
                            <label id="lblMsjModal1"></label>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>