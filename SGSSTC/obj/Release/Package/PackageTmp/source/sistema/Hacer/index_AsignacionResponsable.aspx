<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_AsignacionResponsable.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_AsignacionResponsable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:scriptmanager id="ScriptManager1" runat="server"/>
    
    <div class="container" style="width: 100%;">
        
        <ol class="breadcrumb">
            <li><a href="#">Fase: Hacer</a></li>
            <li><a href="#">Actas de Asignación del Responsable</a></li>
        </ol>
        
        <div class="page-header">
            <h3 class="text-center">Acta de asignación del responsable del SGSST</h3>
        </div>
        
        <div class="row form-group">
            
            <asp:PlaceHolder runat="server" id="phEmpresa">
                <div class="col-md-3">
					    <h4 class="text-center">Empresa</h4>
					    <asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
						    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
				    </div>
			    </asp:PlaceHolder>

			    <asp:PlaceHolder runat="server" id="phSucursal" Visible="false">
				    <div class="col-md-3">
					    <h4 class="text-center">Sucursal</h4>
					    <asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" AutoPostBack="true"  class="form-control" 
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
					
					    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						    Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						    runat="server" ValidationGroup="ValidationAdd" />
				    </div>
			    </asp:PlaceHolder>
                <div class="col-md-3">
                    <h4 class="text-center">Trabajador</h4>
                    <asp:TextBox id="txtTrabajador" runat="server" CssClass="form-control"></asp:TextBox>
                    <cc1:AutoCompleteExtender ServiceMethod="SearchTrabajador" MinimumPrefixLength="1" 
                        CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                        TargetControlid="txtTrabajador" id="AutoCompleteExtender1" runat="server" 
                        FirstRowSelected = "false" 
                        CompletionListCssClass="completionList"
                        CompletionListItemCssClass="listItem"
                        CompletionListHighlightedItemCssClass="itemHighlighted">
                    </cc1:AutoCompleteExtender>
                </div>
                <div class="col-md-3">
                    <h4 class="text-center">&nbsp;</h4>
                    <asp:Button runat="server" ID="btnGenerar" Text="Generar Acta" CssClass="btn btn-default" OnClick="btnGenerarActa_OnClick" />
                </div>
		    </div>
		    <asp:PlaceHolder runat="server" ID="phActa" Visible="false">
		        <div class="row form-group">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <p class="text-right" style="padding-bottom:30px;"><strong><asp:Label runat="server" ID="lblFecha"></asp:Label></strong></p>
                        <h4 class="text-center" style="padding-bottom:30px;">ASIGNACION DEL RESPONSABLE DEL SGSST</h4>
                        <p class="text-justify" style="padding-bottom:50px;">
                            La gerencia de la empresa <asp:Label runat="server" ID="lblEmpresaSel"></asp:Label>, en cumplimiento 
                            con el artículo 8, numerales 2 y 10 del Decreto 1443 del 2012, delega para el 
                            desarrollo del sistema de gestión de seguridad y salud en el trabajo al 
                            empleado <asp:Label runat="server" ID="lblEmpleado"></asp:Label> identificado con la CC N° <asp:Label runat="server" ID="lblCedula"></asp:Label>, 
                            asignando la responsabilidad ejecutiva de asegurar la implementación y el mantenimiento de dicho sistema, 
                            para lo cual deberá planificar, organizar, dirigir, desarrollar y aplicar el SG-SST y como mínimo una vez 
                            al año realizar su evaluación, informar a la alta dirección sobre el funcionamiento y los resultados del SG-SST 
                            además será el responsable de coordinar con los jefes de las áreas la elaboración y actualización de la matriz 
                            de identificación de peligros, evaluación y valoración de riesgos y hacer la priorización para focalizar la intervención.
			            </p>
                        <p class="text-center" style="padding-bottom:50px;"> 
                            __________________________<br />
                            Gerente<br />
                            <asp:Label runat="server" ID="lblEmpresa"></asp:Label>
                        </p>
                    </div>
                    <div class="col-lg-3"></div>			
		        </div>
            </asp:PlaceHolder>
		    <div class="row text-center form-group">

			    <div class="col-md-4 col-md-offset-4">
				    <asp:imagebutton id="btnPrint" runat="server" imageurl="~\ico\print.png"
					    onclick="GenerarDocumento" ValidationGroup="ValidationAdd"/>
				    <h4>Generar Documento</h4>
			    </div>

		    </div>

	    </div>
        
</asp:Content>