<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Politica_SST.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Politica_SST" %>

<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container" style="width: 100%;">
        
         <ol class="breadcrumb">
             <li><a href="#">Fase: Hacer</a></li>
             <li><a href="#">Política SST</a></li>
         </ol>

        <div class="box">
            
            <div class="page-header">
                <h1 class="text-center">Política de seguridad y salud en el trabajo</h1>
            </div>

            <div class="col-md-2">
                    <asp:label class="col-md-1" runat="server" text="Año" font-bold="True"></asp:label>
                    <asp:dropdownlist cssclass="form-control" runat="server" id="ddlYear"></asp:dropdownlist>
                </div>
            <br />
            <br />
            <br />
            <br />

            <div class="panel-group" id="accordion">

                    <div class="panel panel-default">
                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">COMPROMISO DE LA EMPRESA</a></h4>
                        </div>

                        <div id="collapse1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtCompromiso" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">EN TAL SENTIDO AL EMPRESA SE COMPROMETE A</a></h4>
                        </div>

                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtObjetivos" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>

                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading bg-aqua color-palette">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ALCANCE DEL SST</a></h4>
                        </div>

                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <CKEditor:CKEditorControl id="txtAlcance" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                            </div>

                        </div>
                    </div>

                </div>

        </div>

        <div class="row" align="center">

            <div class="col-md-4 col-md-offset-2">
                <asp:ImageButton alt="-" id="btnSave" runat="server" imageurl="~\ico\agregar.png"
                    onclick="btnSave_Click"/>
                <h4>Guardar y/o Actualizar</h4>
            </div>

            <div class="col-md-4">
                <asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
                    onclick="GenerarDocumento"/>
                <h4>Generar Documento</h4>
            </div>
        </div>

    </div>

    <!-- Msj Modal -->
    <ucm:ucMsjModal runat="server" id="ucMsjModal"/>

</asp:Content>