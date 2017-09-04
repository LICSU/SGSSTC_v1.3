<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ComunicadoElecciones.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ComunicadoElecciones" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
        <li><a href="#">Crear Comunicado de Elecciones</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Comunicado de Elecciones</h1>
    </div>

    <div class="row">
        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-4 col-md-offset-4">
                <h4 class="text-center">Empresa</h4>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
            <div class="col-md-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
                    runat="server" ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>
    <br />
    <br />

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <table align="justify">

                <tr>
                    <td class="col-md-4">
                        <h3>Ciudad y Fecha:</h3>
                    </td>
                    <td class="col-md-4">
                        <asp:TextBox ID="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" type="date"></asp:TextBox>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFecha"
                            runat="server" ValidationGroup="ValidationAdd" />
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Dirigido a:</h3>
                    </td>
                    <td class="col-md-4">
                        <asp:TextBox ID="txtDirigido" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtDirigido"
                            runat="server" ValidationGroup="ValidationAdd" />
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>De:</h3>
                    </td>
                    <td class="col-md-4">
                        <asp:TextBox ID="txtDe" runat="server" ClientIDMode="Static" CssClass="form-control"
                            placeholder="(Gerencia General, Dirección de RRHH, etc.)"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtDe"
                            runat="server" ValidationGroup="ValidationAdd" />
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Asunto:</h3>
                    </td>
                    <td class="col-md-8">
                        <p>
                            Elección de candidatos en representación de los trabajadores para la conformación 
								del Comité Paritario de Seguridad y Salud en el Trabajo con vigencia del año
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Del Año:</h3>
                    </td>
                    <td class="col-md-6">
                        <asp:TextBox ID="txtAnho1" placeholder="Año Inicio" min="2000" max="2100" runat="server" ClientIDMode="Static"
                            CssClass="form-control" type="number" Width="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAnho1"
                            runat="server" ValidationGroup="ValidationAdd" />
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Al Año:</h3>
                    </td>
                    <td class="col-md-4">
                        <asp:TextBox ID="txtAnho2" placeholder="Año Fin" min="2000" max="2100" runat="server" ClientIDMode="Static"
                            CssClass="form-control" type="number" Width="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtAnho2"
                            runat="server" ValidationGroup="ValidationAdd" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-11">
                        <h3>
                            <asp:Label runat="server" ID="txtEmpresa" CssClass="control-label" Text="Nombre Empresa"></asp:Label>
                            Dando cumplimiento a la legislación laboral relacionada con la conformación del 
								Comité Paritario de Seguridad y Salud en el Trabajo, convoca a la inscripción de los:
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>N° de Trabajadores:</h3>
                    </td>
                    <td class="col-md-11">
                        <h3>
                            <asp:TextBox ID="txtNumTrab" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="number" min="0" placeholder="(N° de trabajadores según resolución 2013 de 1986)"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNumTrab"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-11">
                        <h3>candidatos con sus respectivos suplentes en representación de los trabajadores.
								<br />
                            La hoja de inscripción de candidatos debe reclamarse en la oficina de:
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Contacto de salud ocupacional:</h3>
                    </td>
                    <td class="col-md-11">
                        <h3>
                            <asp:TextBox ID="txtContacto" runat="server" ClientIDMode="Static" CssClass="form-control"
                                placeholder="(contacto de salud ocupacional)"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtContacto"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-11">
                        <h3>hasta el día
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Máximo dos días hábiles:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="txtMaxDiasHabiles" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtMaxDiasHabiles"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-12">
                        <h3>y  deberá ser diligenciada y entregada nuevamente como fecha límite el día .</h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Máximo tres días hábiles:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox1" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox1"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-12">
                        <h3>Las planchas presentadas serán publicadas en cartelera para conocimiento de todos los trabajadores por </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Máximo dos días hábiles:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox2" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox2"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-12">
                        <h3>La votación de las diferentes planchas que se presenten se realizará el día</h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Máximo 4 días de entregadas las hojas de inscripción:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox3" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox3"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>En:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox4" runat="server" ClientIDMode="Static" CssClass="form-control"
                                placeholder="(lugar de votación: la portería, la entrada al restaurante, la entrada al vestuario, la entrada al salón de producción o área de servicio)"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox4"
                                runat="server" ValidationGroup="ValidationAdd" />
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>A las:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox5" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="time"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox5"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-12">
                        <h3>El conteo de votos se realizará el día </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Día:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox6" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox6"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>A las:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox7" runat="server" ClientIDMode="Static" CssClass="form-control"
                                type="time"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox7"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="col-md-12">
                        <h3>en presencia de un representante de cada una de las planchas presentadas y el jurado de votación.</h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-md-4">
                        <h3>Cordialmente:</h3>
                    </td>
                    <td class="col-md-8">
                        <h3>
                            <asp:TextBox ID="Textbox8" runat="server" ClientIDMode="Static" CssClass="form-control"
                                placeholder="Gerente/ Director RRHH/ Jefe de Personal"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="Textbox8"
                                runat="server" ValidationGroup="ValidationAdd" />

                        </h3>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br />

    <div class="row">

        <div class="col-md-4 col-md-offset-2">
            <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>

    </div>

</asp:Content>
