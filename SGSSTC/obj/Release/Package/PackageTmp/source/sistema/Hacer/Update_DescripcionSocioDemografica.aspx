<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_DescripcionSocioDemografica" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
    PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
        <ContentTemplate>
            
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_DescripcionSocioDemografica.aspx">Descripción SocioDemografica</a></li>
                <li><a href="#">Actualizar Descripción SocioDemografica</a></li>
            </ol>
        
            <div class="page-header">
            <h1 class="text-center">Actualizar Descripción SocioDemografica</h1>
        </div> 
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>0) Seleccione el Trabajador</h5>
                    <asp:label runat="server" id="ddlTrabajador" cssclass="control-label" font-bold="True"></asp:label>
                </div>

                <div class="col-md-4">
                    <h5>Lugar de Nacimiento</h5>
                    <asp:textbox runat="server" MaxLength="1000" id="txtLugar" cssclass="form-control" placeholder="Lugar de Nacimiento"></asp:textbox>
                    
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                        display="Dynamic" forecolor="#B50128" font-size="10" font-bold="true" 
                        controltovalidate="txtLugar" runat="server" validationgroup="ValidationEdit"/>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>1) Seleccione el Nivel de escolaridad</h5>
                    <asp:dropdownlist runat="server" id="rblNivel" cssclass="form-control" autopostback="true" 
                        onselectedindexchanged="rblNivel_SelectedIndexChanged">
                        <asp:ListItem Text="Ninguno" Value="Ninguno"></asp:ListItem>
                        <asp:ListItem Text="Primaria Incompleta" Value="Primaria Incompleta"></asp:ListItem>
                        <asp:ListItem Text="Primaria Completa" Value="Primaria Completa"></asp:ListItem>
                        <asp:ListItem Text="Secundaria Incompleta" Value="Secundaria Incompleta"></asp:ListItem>
                        <asp:ListItem Text="Secundaria Completa" Value="Secundaria Completa"></asp:ListItem>
                        <asp:ListItem Text="Tecnica" Value="Texnica"></asp:ListItem>
                        <asp:ListItem Text="Universitario" Value="Universitario"></asp:ListItem>
                        <asp:ListItem Text="Diplomado" Value="Diplomado"></asp:ListItem>
                        <asp:ListItem Text="Especializacion" Value="Especializacion"></asp:ListItem>
                        <asp:ListItem Text="Maestria" Value="Maestria"></asp:ListItem>
                        <asp:ListItem Text="Doctorado" Value="Doctorado"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                     </asp:dropdownlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                        setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                        font-bold="true" controltovalidate="rblNivel" runat="server"
                        validationgroup="ValidationEdit"/>
                
                    <br />
                    <asp:textbox visible="false" runat="server" MaxLength="450" placeholder="Nivel Escolar" id="txtNivel" cssclass="form-control"></asp:textbox>

                </div>
                
                <div class="col-md-4">
                    <h5>2) Años aprobados en ese último nivel</h5>
                    <asp:textbox runat="server" id="txtAnhosApro" cssclass="form-control" placeholder="Años Aprobados"></asp:textbox>
                    
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                        forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtAnhosApro" runat="server" 
                        validationgroup="ValidationEdit"/>

                </div>
            </div>
            
            <br />
            <div class="row">                        
                <div class="col-md-4 col-md-offset-2">
                    3) ¿Es usted cabeza de familia?<br />
                    <asp:radiobuttonlist runat="server" id="rdlCabeza" cssclass="radio-inline">
                        <asp:ListItem Text="Si" Value="SI"></asp:ListItem>
                        <asp:ListItem Text="No" Value="NO"></asp:ListItem>
                    </asp:radiobuttonlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                        forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rdlCabeza" runat="server"
                        validationgroup="ValidationEdit"/>
                </div>

                <div class="col-md-4">
                    <h5>4) ¿Cuantos hijos tiene?</h4>
                    <asp:dropdownlist runat="server" id="ddlHijos" cssclass="form-control">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                        forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="ddlHijos" runat="server" 
                        validationgroup="ValidationEdit"/>
                </div>
            </div>
            
            <br />
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>5) ¿Con quién comparte la responsabilidad económica de su familia?</h5>

                    <asp:dropdownlist runat="server" id="rblResponsabilidad" cssclass="form-control">
                        <asp:ListItem Text="Con Nadie" Value="Con Nadie"></asp:ListItem>
                        <asp:ListItem Text="Con el Conyugue" Value="Con el Conyugue"></asp:ListItem>
                        <asp:ListItem Text="Con Otros" Value="Con Otros"></asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                        setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                        font-bold="true" controltovalidate="rblResponsabilidad" runat="server" validationgroup="ValidationEdit"/>
                </div>

                <div class="col-md-4">
                    <h5>6) ¿Cuantos menores dependen económicamente de ud?</h5>
                    <asp:dropdownlist runat="server" id="ddlMenores" cssclass="form-control">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:dropdownlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                        setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                        font-bold="true" controltovalidate="ddlMenores" runat="server" validationgroup="ValidationEdit"/>
                </div>
            </div>
            
            <br />
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>7) ¿Socialmente en que condición se encuentra usted?</h5>
                    <asp:radiobuttonlist runat="server" id="rblCondicion" cssclass="radio-inline" autopostback="true"
                        onselectedindexchanged="rblCondicion_SelectedIndexChanged">
                            <asp:ListItem Text="Desplazado" Value="Desplazado"></asp:ListItem>
                            <asp:ListItem Text="Desmovilizado" Value="Desmovilizado"></asp:ListItem>
                            <asp:ListItem Text="Ninguna" Value="Ninguna"></asp:ListItem>
                        </asp:radiobuttonlist>
                    <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                        forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblCondicion" runat="server"
                        validationgroup="ValidationEdit"/>
                </div>
                
                <asp:placeholder id="phDesplazado" runat="server" visible="false">
                    <div class="col-md-4">
                        <h5>7.1) ¿Cual fue el motivo del desplazamiento?</h5>  <br />
                            <asp:DropDownList runat="server" id="rblMotivo" CssClass="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="rblMotivo_SelectedIndexChanged">
                                <asp:ListItem Text="Violencia sociopolítica" Value="Violencia sociopolítica"></asp:ListItem>
                                <asp:ListItem Text="Desastre natural" Value="Desastre natural"></asp:ListItem>
                                <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                Font-Bold="true" ControlToValidate="rblMotivo" runat="server" ValidationGroup="ValidationEdit"/>
                    
                            <asp:TextBox id="txtOtroMotivo" runat="server" MaxLength="450" CssClass="form-control" Visible="false" placeholder="Otro Motivo"></asp:TextBox><hr />
                    
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                Font-Bold="true" ControlToValidate="txtOtroMotivo" runat="server" ValidationGroup="ValidationEdit"/>
                    </div>
                </asp:placeholder>
            </div>
            
            <br />
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>8) La vivienda donde habita es:</h4>
                    
                    <asp:DropDownList runat="server" id="dblVivienda" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="dblVivienda_SelectedIndexChanged">
                        <asp:ListItem Text="Propia" Value="Propia"></asp:ListItem>
                        <asp:ListItem Text="Alquilada" Value="Alquilada"></asp:ListItem>
                        <asp:ListItem Text="De un Familiar" Value="De un Familiar"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="dblVivienda" runat="server" ValidationGroup="ValidationEdit"/>
                    
                    <asp:TextBox runat="server" id="txtOtroVivienda" MaxLength="450" CssClass="form-control" Visible="false" 
                        placeholder="Otra Vivienda"></asp:TextBox>
                </div>
                
                <div class="col-md-4">
                    <h5>9) Seleccione con cuales servicios públicos cuenta su vivienda</h4><br />
                    <asp:CheckBoxList runat="server" id="cblServicios" CssClass="checkbox-inline" RepeatColumns="1">
                        <asp:ListItem Text="Energia Electrica" Value="Energia Electrica"></asp:ListItem>
                        <asp:ListItem Text="Agua" Value="Agua"></asp:ListItem>
                        <asp:ListItem Text="Alcantarillado" Value="Alcantarillado"></asp:ListItem>
                        <asp:ListItem Text="Teléfono Fijo" Value="Telefono Fijo"></asp:ListItem>
                        <asp:ListItem Text="Teléfono Móvil" Value="Teléfono Móvil"></asp:ListItem>
                        <asp:ListItem Text="Gas" Value="Gas"></asp:ListItem>
                        <asp:ListItem Text="Internet" Value="Internet"></asp:ListItem>
                        <asp:ListItem Text="Ninguno" Value="Ninguno"></asp:ListItem>
                    </asp:CheckBoxList>
                </div>

            </div>
            
            <br />

            <!-- Su vivienda es:Esta Cerca de IndustriasHay mucho ruido:-->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>10) Su vivienda es:</h4><br />
                    <asp:RadioButtonList runat="server" id="dblTipoVivienda" CssClass="radio-inline" AutoPostBack="true" OnSelectedIndexChanged="dblTipoVivienda_SelectedIndexChanged">
                        <asp:ListItem Text="Apartamento" Value="Apartamento"></asp:ListItem>
                        <asp:ListItem Text="Casa" Value="Casa"></asp:ListItem>
                        <asp:ListItem Text="Habitación" Value="Habitacion"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="dblTipoVivienda" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                
                    <asp:TextBox runat="server" id="txtTipoVivienda" MaxLength="450" CssClass="form-control" Visible="false" placeholder="Otra Vivienda"></asp:TextBox>
                </div>
                
                <div class="col-md-4">
                    <h5>11) Esta Cerca de Industrias</h5><br />
                    <asp:RadioButtonList runat="server" id="rblIndustria" CssClass="radio-inline">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblIndustria" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>                
            </div>
            
            <br />
            
            <!-- Hay Mucha Contaminación Describa el techo, paredes y piso -->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>12) Hay mucho ruido:</h4><br />
                    <asp:RadioButtonList runat="server" id="rblRuido" CssClass="radio-inline">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblRuido" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>

                <div class="col-md-4">
                    <h5>13) Hay Mucha Contaminación</h4><br />
                    <asp:RadioButtonList runat="server" id="rblContaminacion" CssClass="radio-inline">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblContaminacion" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>                
            </div>

            <br />

            <div class="row">                
                <div class="col-md-8 col-md-offset-2">
                    13) Describa el techo, paredes y piso:<br />
                    <asp:TextBox runat="server" id="txtDescripcion" MaxLength="1000" TextMode="MultiLine" Rows="3" 
                        CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="txtDescripcion" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>
            </div>
            
            <br />

            <!-- 14) Se encuentra afiliado al sistema de seguridad social en salud
                 14.1) Régimen de Afiliación
                 14.1.1) Nivel de SISBEN -->
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>14) Se encuentra afiliado al sistema de seguridad social en salud</h4><br />
                    <asp:RadioButtonList runat="server" id="dblSeguridad" CssClass="radio-inline" AutoPostBack="true"
                        OnSelectedIndexChanged="dblSeguridad_SelectedIndexChanged">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" runat="server"
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="dblSeguridad" ValidationGroup="ValidationEdit"/>
                </div>
             </div>

            <div class="row">
                <asp:PlaceHolder id="phRegimen" runat="server" Visible="false">
                    <div class="col-md-4 col-md-offset-2">
                        <h5>14.1) Régimen de Afiliación</h4><br />
                        <asp:RadioButtonList runat="server" id="rblRegimen" CssClass="checkbox-inline" 
                            AutoPostBack="true" 
                            OnSelectedIndexChanged="rblRegimen_SelectedIndexChanged">
                            <asp:ListItem Text="Contributivo" Value="Contributivo"></asp:ListItem>
                            <asp:ListItem Text="Subsidiado" Value="Subsidiado"></asp:ListItem>
                        </asp:RadioButtonList>
                        
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" runat="server" 
                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="rblRegimen"ValidationGroup="ValidationEdit"/>
                    </div>
                </asp:PlaceHolder>
                
                
                <asp:PlaceHolder id="phRegimen3" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>14.2) ¿A qué EPS pertenece?</h5><br />
                        <asp:DropDownList runat="server" id="ddlEps" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="ddlEps" runat="server" ValidationGroup="ValidationEdit"/>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder id="phRegimen2" runat="server" Visible="false">
                    <div class="col-md-4">
                        <h5>14.3) Nivel de SISBEN</h4><br />
                        <asp:RadioButtonList runat="server" id="rblNivelSisben" TextAlign="Right" RepeatDirection="Vertical" RepeatLayout="Table" CssClass="radio-inline">
                            <asp:ListItem Text="Nivel 0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Nivel 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Nivel 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Nivel 3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Nivel 4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Nivel 5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Nivel 6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                            setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                            Font-Bold="true" ControlToValidate="rblNivelSisben" runat="server" ValidationGroup="ValidationEdit"/>
                    </div>
                </asp:PlaceHolder>
                

            </div>
            
            <br />

            <div class="row">                
                <div class="col-md-4 col-md-offset-2">
                    <h5>15) Se encuentra afiliado al sistema de seguridad social en pensiones</h5><br />
                    <asp:RadioButtonList runat="server" id="rblPensiones" CssClass="radio-inline" AutoPostBack="true" 
                        OnSelectedIndexChanged="rblPensiones_SelectedIndexChanged">
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblPensiones" runat="server" ValidationGroup="ValidationEdit"/>

                </div>
                
                <asp:PlaceHolder id="phPensiones1" runat="server" Visible="false">
                    <div class="col-md-4">
                    <h5>15.1) ¿A qué fondo pertenece?</h5><br />
                    <asp:DropDownList runat="server" id="ddlFondo" CssClass="form-control"></asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlFondo" runat="server" ValidationGroup="ValidationEdit"/>
                 </div>

                </asp:PlaceHolder>
            </div> 

            <br />
            
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h5>16) ¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?</h5><br />
                    <asp:RadioButtonList runat="server" id="rblEstrato" CssClass="radio-inline" RepeatColumns="1">
                        <asp:ListItem Text="Estrato 1" Value="Estrato 1"></asp:ListItem>
                        <asp:ListItem Text="Estrato 2" Value="Estrato 2"></asp:ListItem>
                        <asp:ListItem Text="Estrato 3" Value="Estrato 3"></asp:ListItem>
                        <asp:ListItem Text="Estrato 4" Value="Estrato 4"></asp:ListItem>
                        <asp:ListItem Text="Estrato 5" Value="Estrato 5"></asp:ListItem>
                        <asp:ListItem Text="Estrato 6" Value="Estrato 6"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblEstrato" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>
            </div>

            <br />
            
            <div class="row">
                <h5>17) Empleos Anteriores</h5>
                
                <asp:Table runat="server" id="tblEmpleos" CssClass="table">
                    <asp:TableRow runat="server" id="row1">
                                <asp:TableCell Text="Empresa"></asp:TableCell>
                                <asp:TableCell Text="Área"></asp:TableCell>
                                <asp:TableCell Text="Cargo u Oficio"></asp:TableCell>
                                <asp:TableCell Text="Años"></asp:TableCell>
                                <asp:TableCell Text="Meses"></asp:TableCell>
                                <asp:TableCell Text="Enfermedades adquiridas en el cargo Ninguna/Nombre Enfermedad"></asp:TableCell>

                            </asp:TableRow>
                    <asp:TableRow runat="server" id="TableRow1">
                                <asp:TableCell><asp:TextBox runat="server" id="txtEmpresa1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtArea1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtCargo1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtAños1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtMeses1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades1" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                            </asp:TableRow>
                    <asp:TableRow runat="server" id="TableRow2">
                                <asp:TableCell><asp:TextBox runat="server" id="txtEmpresa2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtArea2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtCargo2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtAños2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtMeses2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades2" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                            </asp:TableRow>
                    <asp:TableRow runat="server" id="TableRow3">
                                <asp:TableCell><asp:TextBox runat="server" id="txtEmpresa3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtArea3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtCargo3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtAños3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtMeses3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox runat="server" id="txtEnfermadades3" MaxLength="50" CssClass="form-control"></asp:TextBox></asp:TableCell>

                            </asp:TableRow>
                </asp:Table>
            </div>
            
            <br />

        <div class="col-md-12" align="center">
            <div class="col-md-4 col-md-offset-4">
                <asp:ImageButton alt="-" id="btnActualizar" runat="server" imageurl="~\ico\save.png" onclick="EditarRegistro" validationgroup="ValidationEdit"/>
                <h4>Actualizar</h5>
            </div>

        </div>

        </ContentTemplate>
    </asp:updatepanel>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>