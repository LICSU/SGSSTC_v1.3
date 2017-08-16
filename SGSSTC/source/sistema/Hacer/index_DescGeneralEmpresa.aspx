<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_DescGeneralEmpresa.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_DescGeneralEmpresa" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="#">Descripción General De La Empresa</a></li>
        </ol>
        
        <div class="page-header">
            <h1 class="text-center">Descripción General De La Empresa</h1>
        </div>

        <div class="row text-center">
            <div class="box">
                
                <table class="table table-condensed" style="overflow: scroll;">
                    <tbody>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label1" runat="server" text="Nombre de la Empresa:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:label id="label2" runat="server" text="---"></asp:label>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label3" runat="server" text="Representante Legal:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox1" MaxLength="100" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label4" runat="server" text="Dirección:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox2" MaxLength="100" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label5" runat="server" text="Municipio:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:label id="label6" runat="server" text="---"></asp:label>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label7" runat="server" text="Teléfono:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox3" MaxLength="50" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label8" runat="server" text="Teléfono Celular:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox4" MaxLength="50" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label9" runat="server" text="Correo Electrónico:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox5" MaxLength="100" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label10" runat="server" text="Nº de Trabajadores del área Administrativa:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <div class="col-md-6">Nº de Trabajadores</div>
                                <div class="col-md-6">Puesto de Trabajo</div>
                                <br />
                                <br />
                                <asp:panel id="pAreaAdm" runat="server"></asp:panel>
                                <br />

                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label11" runat="server" text="Nº de Trabajadores del área Operativa:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <div class="col-md-6">Nº de Trabajadores</div>
                                <div class="col-md-6">Puesto de Trabajo</div>
                                <br />
                                <br />
                                <asp:panel id="pAreaOpe" runat="server"></asp:panel>
                                <br />
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label12" runat="server" text="Clase de Riesgo DEC. 1607" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:dropdownlist runat="server" id="ddlNivelClase" cssclass="form-control">
                                    <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                                    <asp:ListItem Text="CLASE I - Riesgo mínimo" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="CLASE II - Riesgo bajo" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="CLASE III - Riesgo medio" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="CLASE IV - Riesgo alto" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="CLASE V - Riesgo máximo" Value="5"></asp:ListItem>
                                </asp:dropdownlist>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label13" runat="server" text="Actividad Económica:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:panel id="pCodigoCiiu" runat="server"></asp:panel>
                                <br />
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label15" runat="server" text="ARL a la que están afiliados los Trabajadores:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:dropdownlist runat="server" id="ddlArp" cssclass="form-control"></asp:dropdownlist>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label16" runat="server" text="Horario de Trabajo:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:panel id="pHorario" runat="server"></asp:panel>
                                <br />
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label18" runat="server" text="Nº de Trabajadores:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:label id="label19" runat="server" text="----"></asp:label>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label21" runat="server" text="Tipo de Material Usado En La Construcción de las Instalaciones:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox8" MaxLength="500" runat="server" class="form-control" placeholder="(indicar según aplique: ladrillo-cemento, piedra, madera, construcciones tipo invernadero, estructuras metálicas y tejados de zinc)"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label22" runat="server" text="Número Y Tipo De Dependencias Administrativas Y Productivas de La Empresa:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox9" MaxLength="500" runat="server" class="form-control" placeholder="(Debe indicar según aplique: oficina, talleres, departamentos, servicios, unidades, secciones, etc.)"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label23" runat="server" text="Número Y Tipo De Dependencias de Uso No Administrativo o Productivas:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox10" MaxLength="500" runat="server" class="form-control" placeholder="(Debe indicar según aplique: áreas de descanso, recreación, almacenamiento de materiales peligrosos, almacenamiento de herramientas o de suministros, depósitos etc.)"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label24" runat="server" text="Nº de Personas en Tránsito:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox11" runat="server" class="form-control" placeholder="(El tipo y el número de personas en tránsito diario como visitantes, usuarios o clientes de algún servicio, personal vinculado a término fijo)"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label25" runat="server" text="Las vías de acceso y evacuación por áreas y la general de la Empresa:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox12" MaxLength="500" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label26" runat="server" text="Las salidas de Emergencia señaladas, conocidas y demarcadas:" font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox13" MaxLength="500" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                        <tr>
                            <th class="col-md-4  text-left">
                                <asp:label id="label27" runat="server" text="La existencia o no de señalización en escaleras, ascensores, corredores, oficinas, talleres: " font-size="Smaller"></asp:label>
                            </th>
                            <th class="col-md-8  text-left">
                                <asp:textbox id="Textbox14" MaxLength="500" runat="server" class="form-control"></asp:textbox>
                            </th>
                        </tr>
                    </tbody>
                </table>


            </div>
        </div>

        <div class="row" align="center">
            <div class="col-md-4 col-md-offset-4">
                <asp:ImageButton alt="-" id="btnSave" runat="server" imageurl="~\ico\agregar.png"
                    onclick="AgregarRegistro"/>
                <h4>Guardar y/o Actualizar</h4>
            </div>
        </div>

    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>