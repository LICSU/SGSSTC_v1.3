<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_RecursosEconomicos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_RecursosEconomicos" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel runat="server" id="panel1">
        <div class="container" style="width: 100%;">
            
            <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="../Hacer/index_RecursosEconomicos.aspx">Recursos Económicos Aprobados</a></li>
            <li><a href="#">Crear Documento</a></li>
        </ol>
            
            <div class="page-header">
            <h3 class="text-center">Recursos Económicos Aprobados Por La Alta Gerencia</h3>
        </div>
            
            <div class="box">

                <div class="row">

                    <asp:placeholder runat="server" id="phSucursal" visible="false">
                        <div class="col-md-4 col-md-offset-4">
                            <h4 class="text-center">Sucursal</h4>
                            <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" 
                                    setfocusonerror="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                    Font-Bold="true" ControlToValidate="ddlSucursal" runat="server" 
                                    ValidationGroup="ValidationAdd"/>
                        </div>

                        </asp:placeholder>
                </div>
                <br />

                <div class="box-body no-padding">
                    <table class="table table-condensed">
                        <tbody>

                            <tr>
                                <th class="bg-aqua color-palette text-center" colspan="5">FICHA DE SOLICITUDES</th>
                                <th class="bg-teal color-palette text-center">CANTIDAD</th>
                            </tr>

                            <tr class="bg-aqua color-palette">
                                <th class="col-md-3 text-center">DESCRIPCION DE LA SOLICITUD</th>
                                <th class="col-md-2 text-center">CANTIDAD</th>
                                <th class="col-md-1 text-center">UNIDAD</th>
                                <th class="col-md-2 text-center">PROVEEDOR</th>
                                <th class="col-md-1 text-center">COSTO</th>
                                <th class="col-md-2 text-center bg-teal color-palette">CANTIDAD APROBADA</th>
                            </tr>

                            <tr>
                                <td>
                                    <asp:label runat="server" text="1" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox1" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox2" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox3" runat="server" type="number" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox4" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox5" runat="server" type="number" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox6" runat="server" type="number" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="2" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox7" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox8" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox9" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox10" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox11" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox12" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="3" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox13" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox14" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox15" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox16" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox17" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox18" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="4" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox19" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox20" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox21" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox22" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox23" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox24" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="5" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox25" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox26" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox27" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox28" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox29" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox30" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="6" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox31" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox32" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox33" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox34" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox35" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox36" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="7" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox37" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox38" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox39" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox40" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox41" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox42" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="8" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox43" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox44" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox45" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox46" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox47" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox48" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="9" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox49" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox50" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox51" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox52" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox53" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox54" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:label runat="server" text="10" class="col-md-1"></asp:label>
                                    <asp:textbox id="Textbox55" runat="server" class="col-md-10"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox56" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox57" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox58" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox59" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                                <td>
                                    <asp:textbox id="Textbox60" type="number" runat="server" class="col-md-12"></asp:textbox>
                                </td>
                            </tr>

                            <!-- resultados -->
                            <tr>
                                <th class="col-md-3 text-center"></th>
                                <th class="col-md-2 text-center"></th>
                                <th class="col-md-1 text-center"></th>
                                <th class="col-md-2 text-center"></th>
                                <th class="bg-aqua color-palette col-md-2 text-center">TOTAL REQUERIDO</th>
                                <th class="bg-teal color-palette col-md-2 text-center">TOTAL APROBADO</th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:label id="lbRequerido" runat="server" text="---"></asp:label>
                                </td>
                                <td class="bg-teal color-palette">
                                    <asp:label id="lbAprobado" runat="server" text="---"></asp:label>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <br />
                <div class="row" align="center">

                    <div class="col-md-4">
                        <asp:ImageButton alt="-" id="btnGenerar" runat="server" imageurl="~\ico\view.png"
                            onclick="btnGenerar_Onclick"/>
                        <h4>Generar Resultados</h4>
                    </div>

                    <asp:placeholder id="phGuardar" runat="server" visible="false">
                        <div class="col-md-4">
                            <asp:ImageButton alt="-" id="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                                OnClick="GenerarDocumento" ValidationGroup="ValidationAdd"/>
                            <h4>Imprimir Informe</h4>
                        </div>
                    </asp:placeholder>
						

                </div>

            </div>
        
        </div>
</asp:Panel>
</asp:Content>