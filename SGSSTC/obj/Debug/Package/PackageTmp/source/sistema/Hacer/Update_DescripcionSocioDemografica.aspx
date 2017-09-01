<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_DescripcionSocioDemografica.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_DescripcionSocioDemografica" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content><%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %><%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %><%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %><%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_DescripcionSocioDemografica.aspx">Descripción SocioDemografica</a></li>
            <li><a href="#">Actualizar Descripción SocioDemografica</a></li>
        </ol>
        
        <div class="page-header">
        <h1 class="text-center">Actualizar Descripción SocioDemografica</h1>
    </div> 

        <div class="row">
            <div class="col-md-4">
                0) Seleccione los datos del Trabajador<br />
                <asp:label runat="server" id="ddlTrabajador" cssclass="control-label" font-bold="True"></asp:label>
                <hr />
            </div>
            <div class="col-md-4">
                Lugar de Nacimiento
                <asp:textbox runat="server" MaxLength="1000" id="txtLugar" cssclass="form-control" placeholder="Lugar de Nacimiento"></asp:textbox>
                <hr />
                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="txtLugar" runat="server" validationgroup="ValidationEdit"/>
            </div>
            <div class="col-md-4">
                1) Seleccione el Nivel de escolaridad<br />
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

                <asp:textbox visible="false" runat="server" MaxLength="450" placeholder="Nivel Escolar" id="txtNivel" cssclass="form-control"></asp:textbox>
                <hr />
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-4">
                2) Años aprobados en ese último nivel
                <asp:textbox runat="server" id="txtAnhosApro" cssclass="form-control" placeholder="Años Aprobados"></asp:textbox>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtAnhosApro" runat="server" 
                    validationgroup="ValidationEdit"/>
            </div>

            <div class="col-md-4">
                3) ¿Es usted cabeza de familia?<br />
                <asp:radiobuttonlist runat="server" id="rdlCabeza" cssclass="radio-inline">
                    <asp:ListItem Text="Si" Value="SI"></asp:ListItem>
                    <asp:ListItem Text="No" Value="NO"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rdlCabeza" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>

            <div class="col-md-4">
                4) ¿Cuantos hijos tiene?<br />
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
                <hr />
                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic" 
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="ddlHijos" runat="server" 
                    validationgroup="ValidationEdit"/>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4">
                5) ¿Con quién reparte la responsabilidad económica de su familia?<br />

                <asp:dropdownlist runat="server" id="rblResponsabilidad" cssclass="form-control">
                    <asp:ListItem Text="Con Nadie" Value="Con Nadie"></asp:ListItem>
                    <asp:ListItem Text="Con el Conyugue" Value="Con el Conyugue"></asp:ListItem>
                    <asp:ListItem Text="Con Otros" Value="Con Otros"></asp:ListItem>
                </asp:dropdownlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="rblResponsabilidad" runat="server" validationgroup="ValidationEdit"/>
            </div>

            <div class="col-md-4">
                6) ¿Cuantos menores dependen económicamente de ud?
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
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="ddlMenores" runat="server" validationgroup="ValidationEdit"/>

            </div>

            <div class="col-md-4">
                7) ¿Socialmente en que condición se encuentra usted?<br />
                <asp:radiobuttonlist runat="server" id="rblCondicion" cssclass="radio-inline" autopostback="true"
                    onselectedindexchanged="rblCondicion_SelectedIndexChanged">
                        <asp:ListItem Text="Desplazado" Value="Desplazado"></asp:ListItem>
                        <asp:ListItem Text="Desmovilizado" Value="Desmovilizado"></asp:ListItem>
                        <asp:ListItem Text="Ninguna" Value="Ninguna"></asp:ListItem>
                    </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblCondicion" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>

        </div>
        <br />

        <div class="row">
            <asp:placeholder id="phDesplazado" runat="server" visible="false">
            <div class="col-md-4">
                    7.1) ¿Cual fue el motivo del desplazamiento?<br />
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
            <div class="col-md-4">
                8) La vivienda donde habita es:<br />

                <asp:dropdownlist runat="server" id="dblVivienda" cssclass="form-control" autopostback="true" onselectedindexchanged="dblVivienda_SelectedIndexChanged">
                    <asp:ListItem Text="Propia" Value="Propia"></asp:ListItem>
                        <asp:ListItem Text="Alquilada" Value="Alquilada"></asp:ListItem>
                        <asp:ListItem Text="De un Familiar" Value="De un Familiar"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                </asp:dropdownlist>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="dblVivienda" runat="server"
                    validationgroup="ValidationEdit"/>

                <asp:textbox runat="server" id="txtOtroVivienda" MaxLength="450" cssclass="form-control" visible="false" placeholder="Otra Vivienda"></asp:textbox>
                <hr />
            </div>
            <div class="col-md-4">
                9) Seleccione con cuales servicios públicos cuenta su vivienda<br />
                <asp:checkboxlist runat="server" id="cblServicios" cssclass="checkbox-inline" repeatcolumns="1">
                    <asp:ListItem Text="Energia Electrica" Value="Energia Electrica"></asp:ListItem>
                    <asp:ListItem Text="Agua" Value="Agua"></asp:ListItem>
                    <asp:ListItem Text="Alcantarillado" Value="Alcantarillado"></asp:ListItem>
                    <asp:ListItem Text="Teléfono Fijo" Value="Telefono Fijo"></asp:ListItem>
                    <asp:ListItem Text="Teléfono Móvil" Value="Teléfono Móvil"></asp:ListItem>
                    <asp:ListItem Text="Gas" Value="Gas"></asp:ListItem>
                    <asp:ListItem Text="Internet" Value="Internet"></asp:ListItem>
                    <asp:ListItem Text="Ninguno" Value="Ninguno"></asp:ListItem>
                </asp:checkboxlist>
                <hr />
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4">
                10) Su vivienda es:<br />
                <asp:radiobuttonlist runat="server" id="dblTipoVivienda" cssclass="radio-inline" autopostback="true" onselectedindexchanged="dblTipoVivienda_SelectedIndexChanged">
                    <asp:ListItem Text="Apartamento" Value="Apartamento"></asp:ListItem>
                    <asp:ListItem Text="Casa" Value="Casa"></asp:ListItem>
                    <asp:ListItem Text="Habitación" Value="Habitacion"></asp:ListItem>
                    <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                </asp:radiobuttonlist>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="dblTipoVivienda" runat="server" validationgroup="ValidationEdit"/>

                <asp:textbox runat="server" id="txtTipoVivienda" MaxLength="450" cssclass="form-control" visible="false" placeholder="Otra Vivienda"></asp:textbox>
                <hr />
            </div>
            <div class="col-md-4">
                11) Esta Cerca de Industrias<br />

                <asp:radiobuttonlist runat="server" id="rblIndustria" cssclass="radio-inline">
                    <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblIndustria" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>
            <div class="col-md-4">
                12) Hay mucho ruido:<br />

                <asp:radiobuttonlist runat="server" id="rblRuido" cssclass="radio-inline">
                    <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />
                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblRuido" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4">
                13) Hay Mucha Contaminación<br />
                <asp:radiobuttonlist runat="server" id="rblContaminacion" cssclass="radio-inline">
                    <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="rblContaminacion" runat="server" validationgroup="ValidationEdit"/>
            </div>
            <div class="col-md-8 text-left">
                13) Describa el techo, paredes y piso:<br />
                <asp:textbox runat="server" id="txtDescripcion" MaxLength="1000" textmode="MultiLine" rows="3" cssclass="form-control"></asp:textbox>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="txtDescripcion" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4">
                14) Se encuentra afiliado al sistema de seguridad social en salud<br />
                <asp:radiobuttonlist runat="server" id="dblSeguridad" cssclass="radio-inline" autopostback="true" onselectedindexchanged="dblSeguridad_SelectedIndexChanged">
                    <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>"
                    setfocusonerror="true" display="Dynamic" forecolor="#B50128" font-size="10"
                    font-bold="true" controltovalidate="dblSeguridad" runat="server" validationgroup="ValidationEdit"/>
            </div>

            <asp:placeholder id="phRegimen" runat="server" visible="false">
                <div class="col-md-4">
                    14.1) Régimen de Afiliación<br />
                    <asp:RadioButtonList runat="server" id="rblRegimen" CssClass="checkbox-inline" AutoPostBack="true" OnSelectedIndexChanged="rblRegimen_SelectedIndexChanged">
                        <asp:ListItem Text="Contributivo" Value="Contributivo"></asp:ListItem>
                        <asp:ListItem Text="Subsidiado" Value="Subsidiado"></asp:ListItem>
                    </asp:RadioButtonList><hr />
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblRegimen" runat="server" ValidationGroup="ValidationEdit"/>
                </div>
            </asp:placeholder>

            <asp:placeholder id="phRegimen2" runat="server" visible="false">
                <div class="col-md-4">
                    14.1.1) Nivel de SISBEN<br />
                    
                    <asp:RadioButtonList runat="server" id="rblNivelSisben" CssClass="radio-inline" RepeatColumns="2">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="No sabe" Value="No sabe"></asp:ListItem>
                    </asp:RadioButtonList><hr />
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="rblNivelSisben" runat="server" ValidationGroup="ValidationEdit"/>
                </div>
            </asp:placeholder>
        </div>
        <br />

        <div class="row">
            <asp:placeholder id="phRegimen3" runat="server" visible="false">
                <div class="col-md-4">
                    14.2) ¿A qué EPS pertenece?<br />
                    
                    <asp:DropDownList runat="server" id="ddlEps" CssClass="form-control"></asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                        setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                        Font-Bold="true" ControlToValidate="ddlEps" runat="server" ValidationGroup="ValidationEdit"/>
                </div>
            </asp:placeholder>

            <div class="col-md-4">
                15) Se encuentra afiliado al sistema de seguridad social en pensiones<br />

                <asp:radiobuttonlist runat="server" id="rblPensiones" cssclass="radio-inline" autopostback="true" onselectedindexchanged="rblPensiones_SelectedIndexChanged">
                    <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:radiobuttonlist>
                <hr />

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblPensiones" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>

            <asp:placeholder id="phPensiones1" runat="server" visible="false">
                <div class="col-md-4">
                    15.1) ¿A qué fondo pertenece?<br />
                    <asp:DropDownList runat="server" id="ddlFondo" CssClass="form-control"></asp:DropDownList>
                        
                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" Display="Dynamic" 
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlFondo" runat="server" 
                        ValidationGroup="ValidationEdit"/>
                </div>
            </asp:placeholder>

        </div>
        <br />

        <div class="row">
            <div class="col-md-4">
                17) ¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?<br />

                <asp:radiobuttonlist runat="server" id="rblEstrato" cssclass="radio-inline" repeatcolumns="1">
                    <asp:ListItem Text="Estrato 1" Value="Estrato 1"></asp:ListItem>
                    <asp:ListItem Text="Estrato 2" Value="Estrato 2"></asp:ListItem>
                    <asp:ListItem Text="Estrato 3" Value="Estrato 3"></asp:ListItem>
                    <asp:ListItem Text="Estrato 4" Value="Estrato 4"></asp:ListItem>
                    <asp:ListItem Text="Estrato 5" Value="Estrato 5"></asp:ListItem>
                    <asp:ListItem Text="Estrato 6" Value="Estrato 6"></asp:ListItem>
                </asp:radiobuttonlist>

                <asp:requiredfieldvalidator errormessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" display="Dynamic"
                    forecolor="#B50128" font-size="10" font-bold="true" controltovalidate="rblEstrato" runat="server"
                    validationgroup="ValidationEdit"/>
            </div>

        </div>
        <br />

        <div class="col-md-12 text-left">
            <h3>18) Empleos Anteriores</h3>
        </div>
        <br />

        <div class="col-md-12">
            <asp:table runat="server" id="tblEmpleos" cssclass="table">
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
                </asp:table>
        </div>
        <br />

        <div class="col-md-12" align="center">
            <div class="col-md-4 col-md-offset-4">
                <asp:ImageButton alt="-" id="btnActualizar" runat="server" imageurl="~\ico\save.png" onclick="EditarRegistro" validationgroup="ValidationEdit"/>
                <h4>Actualizar</h4>
            </div>

        </div>
    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>