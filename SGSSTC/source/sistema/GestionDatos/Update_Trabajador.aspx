<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_Trabajador.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Update_Trabajador" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:updatepanel id="MyUpdatePanel" runat="server">
        <ContentTemplate>
            
            <div class="container" style="width:100%;">
                <ol class="breadcrumb">
                    <li><a href="#">Gestión de Datos</a></li>
                    <li><a href="../GestionDatos/index_Trabajador.aspx">Trabajador</a></li>
                    <li><a href="#">Editar Trabajador</a></li>
                </ol>

                <div class="page-header">
                    <h1 class="text-center">Editar Trabajador</h1>
                </div>
                
                <!-- Empresa y sucursal -->
                <asp:PlaceHolder runat="server" id="phEmpresa1" Visible="false">
                    <div class="row">
                            <div class="col-md-4  col-md-offset-4">
                                <h4 class="text-left">Empresa</h4>
                                
                                <asp:DropDownList runat="server" id="ddlEmpresas" 
                                    data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" 
                                    CssClass="form-control" AutoPostBack="true" 
                                    OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged"></asp:DropDownList>

                                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                    ControlToValidate="ddlEmpresas" runat="server" ValidationGroup="ValidationAdd"/>
                            </div>
                    </div>
                </asp:PlaceHolder>
                    
                <asp:PlaceHolder runat="server" id="phSucursal1" Visible="false">
                    <div class="row">
                        <div class="col-md-4  col-md-offset-4">
                            <h4 class="text-left">Sucursal</h4>
                            
                            <asp:DropDownList runat="server" id="ddlSucursal" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" 
                                CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                                ControlToValidate="ddlSucursal" ValidationGroup="ValidationAdd"/>

                        </div>
                    </div>
                </asp:PlaceHolder>
                
                <div class="row">
                        <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Primer Nombre</h4>
                            
                            <asp:TextBox runat="server" MaxLength="50" id="txtNombre1" CssClass="form-control" 
                                placeholder="Primer Nombre"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el primer nombre del trabajador(a)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtNombre1" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>

                        <div class="col-md-4">
                            <h4 class="text-left">Segundo Nombre</h4>
                            <asp:TextBox runat="server" MaxLength="50" id="txtNombre2" CssClass="form-control" 
                                placeholder="Segundo Nombre"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el segundo nombre del trabajador(a)"></asp:TextBox>
                        </div>
                </div>

                <div class="row">
                        <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Primer Apellido</h4>
                            <asp:TextBox runat="server" MaxLength="50" id="txtApellido1" CssClass="form-control" 
                                placeholder="Primer Apellido"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el primer apellido del trabajador(a)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtApellido1" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>

                        <div class="col-md-4">
                            <h4 class="text-left">Segundo Apellido</h4>
                            <asp:TextBox runat="server" MaxLength="50" id="txtApellido2" CssClass="form-control" 
                                placeholder="Segundo Apellido"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el segundo apellido del trabajador(a)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtApellido2" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Estatus</h4>
                            <asp:DropDownList runat="server" id="ddlEstatus" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccion el estatus dentro de la empresa en la que se encuentra el trabajador(a)"></asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlEstatus" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-4">
                            <h4 class="text-left">Documento de Identidad</h4> 
                            <asp:TextBox runat="server" MaxLength="15" id="txtCedula" CssClass="form-control" 
                                placeholder="Cédula" TextMode="Number"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el numero de identidad del trabajador(a)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtCedula" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                </div>  

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Fecha de Nacimiento</h4>
                        <asp:TextBox runat="server" id="txtFechadeNacimiento" CssClass="form-control" TextMode="Date" 
                            placeholder="dd/mm/yyyy"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese la fecha de nacimiento del trabajador(a)"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtFechadeNacimiento" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>

                    <div class="col-md-4">
                            <h4 class="text-left">Email</h4>
                            <asp:TextBox runat="server" MaxLength="50" id="txtEmail" CssClass="form-control" 
                                placeholder="Email"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el correo electronico del trabajador(a)"></asp:TextBox>

                        </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Puesto de Trabajo</h4>
                        <asp:DropDownList runat="server" id="ddlPuestoTrabajo" 
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione el Puesto de Trabajo del trabajador(a)" 
                            CssClass="form-control"></asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlPuestoTrabajo" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Sexo</h4> 
                        
                        <asp:DropDownList runat="server" id="ddlSexo" CssClass="form-control" 
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el sexo del trabajador(a)">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Femenino" Value="Femenino"></asp:ListItem>
                            <asp:ListItem Text="Masculino" Value="Masculino"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlSexo" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Estado Civil</h4>

                        <asp:DropDownList runat="server" id="ddlEdoCivil" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el estado civil del trabajador(a)">
                            <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                            <asp:ListItem Text="Soltero(a)" Value="Soltero(a)"></asp:ListItem>
                            <asp:ListItem Text="Casado(a)" Value="Casado(a)"></asp:ListItem>
                            <asp:ListItem Text="Divorciado(a)" Value="Divorciado(a)"></asp:ListItem>
                            <asp:ListItem Text="Viudo(a)" Value="Viudo(a)"></asp:ListItem>
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlEdoCivil" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Cargo</h4>

                        <asp:DropDownList runat="server" id="ddlCargo" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el cargo del trabajador(a)"></asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="ddlCargo" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <h4 class="text-left">Télefono Casa</h4>

                        <asp:TextBox runat="server" MaxLength="15" id="txtTelCasa" CssClass="form-control" 
                            placeholder="Casa" TextMode="Number"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el número de telefono de casa del trabajador(a)"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtTelCasa" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                    
                    <div class="col-md-4">
                        <h4 class="text-left">Télefono Movil</h4>

                        <asp:TextBox runat="server" MaxLength="15" id="txtTelCelular" CssClass="form-control" 
                            placeholder="Celular" TextMode="Number"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el número de teléfono movil del trabajador(a)"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtTelCelular" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h4 class="text-left">Dirección</h4>
                        <asp:TextBox runat="server" MaxLength="100" id="txtDireccion" CssClass="form-control" 
                            TextMode="MultiLine" Columns="3"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese la dirección del trabajador(a)"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                            ControlToValidate="txtDireccion" runat="server" ValidationGroup="ValidationAdd"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 col-md-offset-1">
                            <h4 class="text-left">Región donde Reside</h4>

                            <asp:DropDownList runat="server" id="ddlRegion" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione la región donde reside el trabajador(a)"></asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlRegion" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>

                    <div class="col-md-4">
                            <h4 class="text-left">Departamento donde Reside</h4>

                            <asp:DropDownList runat="server" id="ddlDepartamento" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el departamento donde reside el trabajador(a)"></asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlDepartamento" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>

                    <div class="col-md-3">
                            <h4 class="text-left">Municipio donde Reside</h4>

                            <asp:DropDownList runat="server" id="ddlMunicipio" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el municipio  donde reside el trabajador(a)"></asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlMunicipio" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">¿Es Discapacitado?</h4>

                            <asp:DropDownList runat="server" id="ddlDiscapacitado" CssClass="form-control" AutoPostBack="true" 
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione si el trabajador(a) tiene una discapacidad">
                                <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlDiscapacitado" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-4">
                        <br />
                        <br />
                        <asp:TextBox runat="server" id="txtDiscapacidad" MaxLength="200" CssClass="form-control" 
                            Visible="false" placeholder="Descripcion Discapacidad"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese la discapacidad del trabajador(a)"></asp:TextBox>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Mano Dominante</h4>

                            <asp:DropDownList runat="server" id="ddlManodominante" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione la mano dominante del trabajador(a)">
                                <asp:ListItem Text="Derecha" Value="Derecha"></asp:ListItem>
                                <asp:ListItem Text="Izquierda" Value="Izquierda"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlManodominante" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-4">
                            <h4 class="text-left">Tipo Vinculacion Laboral</h4>

                            <asp:DropDownList runat="server" id="ddlTipoVinculacion" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el tipo de vinculación laboral del trabajador(a) con la empresa">
                                <asp:ListItem Text="Contrato" Value="Contrato"></asp:ListItem>
                                <asp:ListItem Text="Carrera" Value="Carrera"></asp:ListItem>
                                <asp:ListItem Text="Cooperador" Value="Cooperador"></asp:ListItem>
                                <asp:ListItem Text="Estudiante o aprendiz" Value="Estudiante o aprendiz"></asp:ListItem>
                                <asp:ListItem Text="Independiente" Value="Independiente"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlTipoVinculacion" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Tipo de Horario</h4>

                            <asp:DropDownList runat="server" id="ddlTipoHorario" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el tipo de horario del trabajador(a)">
                                <asp:ListItem Text="Diurno" Value="Diurno"></asp:ListItem>
                                <asp:ListItem Text="Nocturno" Value="Nocturno"></asp:ListItem>
                                <asp:ListItem Text="Mixto" Value="Mixto"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlTipoHorario" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-4">
                            <h4 class="text-left">Horario</h4>
                            
                            <asp:DropDownList runat="server" id="ddlHorario" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione el horario del trabajador(a)"></asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlHorario" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Salario</h4>

                            <asp:TextBox runat="server" MaxLength="15" id="txtSalario" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese el salario (en pesos colombianos) del trabajador(a)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtSalario" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="col-md-4">
                            <h4 class="text-left">Fecha de Ingreso</h4>

                            <asp:TextBox runat="server" id="txtFechaIngreso" CssClass="form-control" TextMode="Date" 
                                placeholder="dd/mm/yyyy"
                                data-toggle="tooltip" data-placement="bottom" title="Ingrese la fecha de ingreso del trabajador(a) a la empresa"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="txtFechaIngreso" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>

                </div>
                    
                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                            <h4 class="text-left">Caja de Compensación Familiar</h4>

                            <asp:DropDownList runat="server" id="ddlCcf" CssClass="form-control"
                                data-toggle="tooltip" data-placement="bottom" title="Seleccione la Caja de Compensación Familiar del trabajador(a)"></asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlCcf" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <h4 class="text-left">Foto</h4>

                            <asp:Image alt="-" runat="server" id="ImgFoto" CssClass="img-thumbnail"/>

                            <asp:FileUpload runat="server" id="fuFoto"/>

                        </div>
                    </div>
                    <br />

                </div>

                <br />
                <hr />
                
                <!-- aceptar y cancelar-->
                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <asp:Button runat="server" id="btnAceptar" Text="Aceptar" OnClick="btnAceptar_Click" 
                            class="btn btn-block btn-info" ValidationGroup="ValidationAdd"
                            data-toggle="tooltip" data-placement="bottom" title="Presione para registrar el trabajador"></asp:Button>
                    </div>
                </div>
            </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger Controlid="btnAceptar"/>
        </Triggers>
    </asp:updatepanel>
    
    <!-- Msj Modal -->
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

	

    </asp:Content>