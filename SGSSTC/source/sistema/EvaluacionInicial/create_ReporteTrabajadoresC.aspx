<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_ReporteTrabajadoresC.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_ReporteTrabajadoresC" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" style="width: 100%;">

        <div class="row text-center">
            <div class="box">
                
                <ol class="breadcrumb">
                    <li><a href="#">Fase: Evaluación Inicial</a></li>
                    <li><a href="../EvaluacionInicial/index_ReporteTrabajadores.aspx">Reporte de Trabajadores</a></li>
                    <li><a href="#">Crear Reporte de Condiciones de Trabajo</a></li>
                </ol>

                <div class="page-header">
                     <h1 class="text-center">Reporte De Condiciones De Trabajo</h1>
                 </div>

                <div class="row form-group">

                    <asp:PlaceHolder runat="server" id="phEmpresa">
                        <div class="col-md-4 col-md-offset-4">
                            <h4 class="text-center">Empresa</h4>
                            <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </asp:PlaceHolder> 
            
                    <asp:PlaceHolder runat="server" id="phSucursal">
                        <div class="col-md-4">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>

                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" 
                                ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd"/>
                        </div>
                    </asp:PlaceHolder>
                </div>
                
                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tbody>
                            
                            <!-- fila 1 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-12  text-left">DATOS DEL TRABAJADOR</th>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:label class="col-md-2 col-md-offset-3" runat="server" text="TRABAJADOR" font-bold="True"></asp:label>

                                    <div class="col-md-4">
                                        <asp:dropdownlist id="ddlTrabajador" cssclass="form-control" runat="server" 
                                          AutoPostBack="true" onselectedindexchanged="ddlTrabajador_SelectedIndexChanged"></asp:dropdownlist>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-3" runat="server" text="PRIMER APELLIDO" font-bold="True"></asp:label>
                                    <asp:label class="col-md-3" runat="server" text="SEGUNDO APELLIDO" font-bold="True"></asp:label>
                                    <asp:label class="col-md-3" runat="server" text="NOMBRES" font-bold="True"></asp:label>
                                    <asp:label class="col-md-3" runat="server" text="N° IDENTIFICACIÓN" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label id="lbPrimerApellido" class="col-md-3" runat="server" text="---"></asp:label>
                                    <asp:label id="lbSegundoApellido" class="col-md-3" runat="server" text="---"></asp:label>
                                    <asp:label id="lbNombres" class="col-md-3" runat="server" text="---"></asp:label>
                                    <asp:label id="lbCedula" class="col-md-3" runat="server" text="---"></asp:label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-2" runat="server" text="SEXO" font-bold="True"></asp:label>
                                    <asp:label class="col-md-2" runat="server" text="EDAD" font-bold="True"></asp:label>
                                    <asp:label class="col-md-2" runat="server" text="EDO CIVIL" font-bold="True"></asp:label>
                                    <asp:label class="col-md-6" runat="server" text="CCF" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label id="lbSexo" class="col-md-2" runat="server" text="---"></asp:label>
                                    <asp:label id="lbEdad" class="col-md-2" runat="server" text="---"></asp:label>
                                    <asp:label id="lbEdoCivil" class="col-md-2" runat="server" text="---"></asp:label>
                                    <asp:label id="lbCCF" class="col-md-6" runat="server" text="---"></asp:label>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <asp:label class="col-md-6" runat="server" text="AREA" font-bold="True"></asp:label>
                                    <asp:label class="col-md-6" runat="server" text="PUESTO DE TRABAJO" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label id="lbArea" class="col-md-6" runat="server" text="---"></asp:label>
                                    <asp:label id="lbPuesto" class="col-md-6" runat="server" text="---"></asp:label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Qué equipos opera?" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox1" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Actualmente presenta alguna enfermedad o esta en tratamiento médico? Explique" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox2" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="Describa que síntoma(s) físico(s) o emocional(es) percibe y el tiempo de evolución" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox3" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Considera que tiene alguna relación estos síntomas con su trabajo? Explique" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox4" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Considera que tiene alguna relación éste síntoma con sus actividades fuera del trabajo? Explique" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox5" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-5  text-left" runat="server" text="¿Ha consultado a su servicio de salud por estos síntomas?" font-bold="True"></asp:label>
                                    <asp:label class="col-md-1 text-center" runat="server" text="Si" font-bold="True"></asp:label>
                                    <asp:label class="col-md-1 text-center" runat="server" text="No" font-bold="True"></asp:label>
                                    <asp:label class="col-md-5  text-left" runat="server" text="¿Porqué?" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox6" runat="server" textmode="multiline" class="col-md-5  text-left" rows="3"></asp:textbox>
                                    <input id="radio1" type="radio" name="rbf1" value="1" runat="server" class="col-md-1 text-center">
                                    <input id="radio2" type="radio" name="rbf1" value="2" runat="server" class="col-md-1 text-center">
                                    <asp:textbox id="Textbox9" runat="server" textmode="multiline" class="col-md-5  text-left" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-5  text-left" runat="server" text="¿Durante el último año ha sido incapacitado por esta causa?" font-bold="True"></asp:label>
                                    <asp:label class="col-md-1 text-center" runat="server" text="Si" font-bold="True"></asp:label>
                                    <asp:label class="col-md-1 text-center" runat="server" text="No" font-bold="True"></asp:label>
                                    <asp:label class="col-md-5  text-left" runat="server" text="¿Porqué?" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox7" runat="server" textmode="multiline" class="col-md-5  text-left" rows="3"></asp:textbox>
                                    <input id="radio3" type="radio" name="rbf2" value="1" runat="server" class="col-md-1 text-center">
                                    <input id="radio4" type="radio" name="rbf2" value="2" runat="server" class="col-md-1 text-center">
                                    <asp:textbox id="Textbox8" runat="server" textmode="multiline" class="col-md-5  text-left" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Cuantos días de incapacidad médica?" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox10" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label class="col-md-12  text-left" runat="server" text="¿Tiene Ud. algún hobbie, o practica algún deporte? ¿Cual(es)? ¿Qué tiempo le dedica a cada uno?" font-bold="True"></asp:label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox11" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            <!-- fila 2 -->
                            <tr class="bg-aqua color-palette">
                                <th class="col-md-12  text-left">SUGERENCIAS Y RECOMENDACIONES PARA EL MEJORAMIENTO DE LAS CONDICIONES DE SALUD</th>
                            </tr>
                            <tr>
                                <td>
                                    <asp:textbox id="Textbox12" runat="server" textmode="multiline" class="form-control" rows="3"></asp:textbox>
                                </td>
                            </tr>

                            </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row" align="center">

            <div class="col-md-4">
                <asp:ImageButton alt="-"  runat="server" ImageUrl="~\ico\descargar.png" OnClick="GenerarDocumentoGeneral" 
                    ValidationGroup="ValidationAdd"/>
                <h4>Descargar Formato</h4>
            </div>

            <asp:placeholder id="phBtnPrint" runat="server">
                <div class="col-md-4">
                    <asp:ImageButton alt="-" id="btnPrint" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" 
                        ValidationGroup="ValidationAdd"/>
                    <h4>Generar Documento</h4>
                </div>
            </asp:placeholder>

        </div>

    </div>

 </asp:Content>