<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_Empresa.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Create_Empresa" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width:100%;">
                
                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="../GestionDatos/index_Empresa.aspx">Empresas</a></li>
                    <li><a href=".#">Crear Empresa</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Registrar Nueva Empresa</h1>
                </div>
                
                <div class="row text-left">
                    <div class="col-md-12">
                        <h4 class="text-left">Nombre de la Empresa</h4>
                        
                        <asp:TextBox runat="server" id="txtNomEmpresa" CssClass="form-control" PlaceHolder="Nombre" 
                            MaxLength="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator setfocusonerror="true" runat="server" Font-Size="10" Font-Bold="true" 
                            Display="Dynamic" ForeColor="#B50128" ControlToValidate="txtNomEmpresa" 
                            ValidationGroup="ValidationAdd" ErrorMessage="<p>Campo Obligatorio!</p>"/>
                    </div>
                </div>                
                
                <br />

                <div class="row text-left">
                    <h4 class="text-left">Actividad Principal</h4>
                    
                    <div class="col-md-6">
                        <h5 class="text-info text-left">Sección</h5>
                        
                        <asp:DropDownList runat="server" id="ddlSeccion1" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged"></asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-info text-left">División</h5>
                        <asp:DropDownList runat="server" id="ddlDivision1" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-6">
                        <h5 class="text-info text-left">Grupo</h5>
                        <asp:DropDownList runat="server" id="ddlGrupo1" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                        
                    <div class="col-md-6">
                        <h5 class="text-info text-left">Clase</h5>
                        <asp:DropDownList runat="server" id="ddlClase1" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                            ControlToValidate="ddlClase1" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>
                <br />
                
                <asp:PlaceHolder runat="server" id="phActividad2" Visible="false">
                    <div class="row text-left">
                        <h4 class="text-left">Actividad Secundaria</h4>
                        
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Sección</h5>
                            
                            <asp:DropDownList runat="server" id="ddlSeccion2" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged"></asp:DropDownList>
                        </div>

                        <div class="col-md-6">
                            <h5 class="text-info text-left">División</h5>
                            <asp:DropDownList runat="server" id="ddlDivision2" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Grupo</h5>
                            <asp:DropDownList runat="server" id="ddlGrupo2" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Clase</h5>
                            <asp:DropDownList runat="server" id="ddlClase2" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                                ControlToValidate="ddlClase2" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    </div>
                    <br />
                </asp:PlaceHolder>
                
                <asp:PlaceHolder runat="server" id="phActividad3" Visible="false">
                    <div class="row text-left">
                        <h4 class="text-left">Otras Actividades</h4>
                        
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Sección</h5>
                            
                            <asp:DropDownList runat="server" id="ddlSeccion3" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged"></asp:DropDownList>
                        </div>

                        <div class="col-md-6">
                            <h5 class="text-info text-left">División</h5>
                            <asp:DropDownList runat="server" id="ddlDivision3" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Grupo</h5>
                            <asp:DropDownList runat="server" id="ddlGrupo3" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCodigoCiuu_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        
                        <div class="col-md-6">
                            <h5 class="text-info text-left">Clase</h5>
                            <asp:DropDownList runat="server" id="ddlClase3" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <br />
                </asp:PlaceHolder>

                <div class="row text-left">                    
                    <div class="col-md-4">
                        <h4 class="text-left">Código de la Empresa</h4>
                        
                        <asp:TextBox runat="server" id="txtCodigoEmpresa" CssClass="form-control" PlaceHolder="Código" 
                            MaxLength="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtCodigoEmpresa" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">NIT</h4>
                        
                        <asp:TextBox runat="server" id="txtNit" CssClass="form-control" PlaceHolder="NIT" MaxLength="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNit" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                                            
                    <div class="col-md-4">
                        <style>
                            span.valerror[style*="inline"] 
                            {
                                display: block !Important;
                                background-color: #f56954;
                                border: 1px solid #f56954;
                                font-size: 1em;
                            }
                        </style>
                        
                        <h4 class="text-left">Email</h4>
                        
                        <asp:TextBox runat="server" id="txtEmail" TextMode="Email" CssClass="form-control" MaxLength="100"
                            PlaceHolder="mi_correo@grupoli.com"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"  runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtEmail" 
                            ValidationGroup="ValidationAdd"/>
                        
                        <asp:RegularExpressionValidator id="regexEmailValid" runat="server" SetFocusOnError="True" Display="Dynamic"
                            CssClass="valerror" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="txtEmail" ErrorMessage="Email inválido"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <br />
                
                <div class="row text-left">
                    <div class="col-md-12">
                        <h4 class="text-left">Dirección</h4>
                        
                        <asp:TextBox runat="server" id="txtDireccion" CssClass="form-control" PlaceHolder="Dirección" 
                            MaxLength="100"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtDireccion" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <br />
                
                <div class="row text-left">
                    <div class="col-md-4">
                        <h4 class="text-left">Región</h4>
                        
                        <asp:DropDownList runat="server" id="ddlRegion" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged"></asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlRegion" ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Departamento</h4>
                        
                        <asp:DropDownList runat="server" id="ddlDepartamento" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged"></asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlDepartamento" ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Municipio</h4>
                        
                        <asp:DropDownList runat="server" id="ddlMunicipio" CssClass="form-control"></asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlMunicipio" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <br />
                
                <div class="row text-left">
                    <div class="col-md-4">
                        <h4 class="text-left">Representante</h4>
                        
                        <asp:TextBox runat="server" id="txtRepresentante" CssClass="form-control" PlaceHolder="Representante" 
                            MaxLength="100"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtRepresentante" ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Teléfono Fijo</h4>
                        
                        <asp:TextBox runat="server" id="txtTelFijo" CssClass="form-control" PlaceHolder="Numero Fijo" 
                            TextMode="Number" MaxLength="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelFijo" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Teléfono Movil</h4>
                        
                        <asp:TextBox runat="server" id="txtTelMovil" CssClass="form-control" PlaceHolder="Movil" TextMode="Number" 
                            MaxLength="50"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true"  runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelMovil" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <br />
                
                <div class="row text-left">                    
                    <div class="col-md-4">
                        <h4 class="text-left">ARL</h4>
                        <asp:DropDownList runat="server" id="ddlArp" CssClass="form-control"></asp:DropDownList>
                            
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlArp" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Jornada Laboral</h4>
                        
                        <asp:DropDownList runat="server" id="ddlJornada" CssClass="form-control">
                            <asp:ListItem Text="Lunes a Viernes" Value="1"/>
                            <asp:ListItem Text="Lunes a Sabado" Value="2"/>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlJornada" 
                            ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-4">
                        <h4 class="text-left">Logo</h4>
                        
                        <asp:FileUpload runat="server" id="fuLogoEmpresa"/>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" runat="server"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="fuLogoEmpresa" 
                            ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <br />

                <div class="row" align="center">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ImageButton alt="-" id="btnGuardar" runat="server" ImageUrl="~\ico\save.png" OnClick="GuardarRegistro" 
                            ValidationGroup="ValidationAdd"/>
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
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
                <!-- /modal-body -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../../../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function MostrarMsjModal1(message, title, ccsclas) {
            var vIcoModal = document.getElementById("icoModal1");
            vIcoModal.className = ccsclas;
            $('#lblMsjTitle1').html(title);
            $('#lblMsjModal1').html(message);
            $('#Msjmodal1').modal('show');
            return true;
        }
    </script>

</asp:Content>