<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_InspeccionPrimAux.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_InspeccionPrimAux" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<asp:scriptmanager id="ScriptManager1" runat="server"/>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="//www.google.com/jsapi"></script>

	<div class="container" style="width: 100%;">

        <ol class="breadcrumb">
            <li><a href="#">Fase: Evaluación Inicial</a></li>
            <li><a href="../EvaluacionInicial/index_Inspecciones.aspx">Inspecciones</a></li>
            <li><a href="#">Crear Inspección de Botiquín</a></li>
        </ol>

        <div class="page-header">
             <h1 class="text-center">Botiquín de Primeros Auxilios</h1>
         </div>

		<asp:updatepanel id="MyUpdatePanel" runat="server" updatemode="Always">
			<ContentTemplate>
				<asp:hiddenfield runat="server" id="cantInspecciones" value="0"></asp:hiddenfield> 

				<div class="row form-group">

					<asp:PlaceHolder runat="server" id="phEmpresa">
						<div class="col-md-4">
							<h4 class="text-center">Empresa</h4>
							<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
						</div>
					</asp:PlaceHolder>
					<asp:PlaceHolder runat="server" id="phSucursal">
						<div class="col-md-4">
							<h4 class="text-center">Sucursal</h4>
							<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
						</div>
					</asp:PlaceHolder> 
					<div class="col-md-4">
						<h4 class="text-center">Seleccione el Tipo</h4>
						<asp:DropDownList runat="server" id="ddlTipo" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
							<asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
							<asp:ListItem Text="Tipo A" Value="a"></asp:ListItem>
							<asp:ListItem Text="Tipo B" Value="b"></asp:ListItem>
							<asp:ListItem Text="Tipo C" Value="c"></asp:ListItem>
						</asp:DropDownList>
					</div>
				</div>
						
					<!-- TIPO A -->
					 <asp:PlaceHolder runat="server" id="phInformacionTipoA" Visible="false">
						 <div class="row form-group text-center">
							 <h4 class="text-left">Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo A)</h4>
						 </div>
						 <div class="row">
							 <div class="col-md-12  ">
								 <asp:Panel runat="server" id="pnDatosA">
									 <asp:Table runat="server" id="tb_datos" CssClass="table">
										 <asp:TableHeaderRow CssClass="bg-aqua color-palette">
											 <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
										 </asp:TableHeaderRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="GASAS LIMPIAS PAQUETE" id="lblAIns1"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="1" id="lblACant1"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="Paquete de 20 Unidades" id="lblAUni1"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi1"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif1"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot1"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp1" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO de 4" id="lblAIns2"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="1" id="lblACant2"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni2"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled = "false" CssClass="form-control" id="txtADif2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp2" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="BAJALENGUAS" id="lblAIns3"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant3"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Paquete de 20 Unidades" id="lblAUni3"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled ="false" CssClass="form-control" id="txtADif3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp3" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="GUANTES DE LATEX PARA EXAMEN" id="lblAIns4"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant4"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Caja por 100" id="lblAUni4"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp4" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" id="lblAIns5"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant5"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni5"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp5" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" id="lblAIns6"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant6"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni6"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtADif6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp6" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" id="lblAIns7"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant7"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni7"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtADif7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp7" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" id="lblAIns8"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant8"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni8"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp8" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" id="lblAIns9"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant9"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Paquete de 20 Unidades" id="lblAUni9"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp9" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="YODOPOVIDONA (JABÓN QUIRÚRGICO)" id="lblAIns10"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant10"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Frasco x 120 ml" id="lblAUni10"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp10" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" id="lblAIns11"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant11"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni11"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp11" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO O DIGITAL" id="lblAIns12"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant12"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni12"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp12" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" id="lblAIns13"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblACant13"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblAUni13"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtAExi13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="false" CssClass="form-control" id="txtADif13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtAMot13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlARemp13" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
									 </asp:Table>
								 </asp:Panel>
							 </div>
						</div>
						 <div class="row form-group">
							<label>Observaciones</label><br />
							<asp:TextBox class="col-md-12  " runat="server" id="txtObsA" TextMode="Multiline" Rows="4"></asp:TextBox>
						 </div>
						 <div class="row" align="center">
						 
						<div class="col-md-4 col-md-offset-2">
							<asp:Button runat="server" id="btnDocumento" Text="Generar Documento" CssClass="btn btn-block btn-info"
								OnClick="GenerarDocumento"/>
						 </div>
					</div>
					</asp:PlaceHolder>

					<!-- TIPO B -->
					<asp:PlaceHolder runat="server" id="phInformacionTipoB" Visible="False">
						<div class="row form-group text-center">
							<h4 class="text-left">Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo B)</h4>

						</div>
						 <div class="row">
							 <div class="col-md-12">
								 <asp:Panel runat="server" id="pnDatosB">
									 <asp:Table runat="server" id="Table1" CssClass="table">
										 <asp:TableHeaderRow CssClass="bg-aqua color-palette">
											 <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
											 <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
										 </asp:TableHeaderRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="GASAS LIMPIAS" id="lblBIns1"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant1"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:Label runat="server" Text="Paquete de 100" id="lblBUni1"></asp:Label></asp:TableCell>
											 <asp:TableCell><asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" CssClass="form-control" id="txtBExi1"></asp:TextBox></asp:TableCell>
											 <asp:TableCell><asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif1"></asp:TextBox></asp:TableCell>
											 <asp:TableCell><asp:TextBox runat="server" CssClass="form-control" id="txtBMot1"></asp:TextBox></asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp1" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="GASAS ESTÉRILES" id="lblBIns2"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="20" id="lblBCant2"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Paquete de 3" id="lblBUni2"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot2"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp2" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="APÓSITO ó COMPRESAS NO ESTÉRILES" id="lblBIns3"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant3"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni3"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot3"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp3" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO 4" id="lblBIns4"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant4"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni4"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot4"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp4" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="BAJALENGUAS" id="lblBIns5"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant5"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Paquete de 20" id="lblBUni5"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot5"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp5" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" id="lblBIns6"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant6"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni6"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot6"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp6" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" id="lblBIns7"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant7"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni7"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot7"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp7" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" id="lblBIns8"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant8"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni8"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot8"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp8" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="CLORHEXIDINA O YODOPOVIDONA (JABÓN QUIRÚRGICO)" id="lblBIns9"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant9"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Galón" id="lblBUni9"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot9"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp9" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" id="lblBIns10"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="5" id="lblBCant10"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni10"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot10"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp10" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="GUANTES DE LÁTEX PARA EXAMEN" id="lblBIns11"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant11"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Caja de 100" id="Label1"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot11"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp11" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO O DIGITAL" id="lblBIns12"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant12"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni12"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot12"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp12" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" id="lblBIns13"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant13"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni13"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot13"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp13" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow> 
											 <asp:TableCell><asp:Label runat="server" Text="TIJERAS" id="lblBIns14"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant14"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni14"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi14"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif14"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot14"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp14" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="LINTERNA" id="lblBIns15"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant15"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni15"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi15"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif15"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot15"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp15" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="PILAS DE REPUESTO" id="lblBIns16"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="4" id="lblBCant16"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Par" id="lblBUni16"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi16"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif16"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot16"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp16" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="TABLA ESPINAL LARGA" id="lblBIns17"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant17"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni17"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi17"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif17"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot17"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp17" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="COLLAR CERVICAL" id="lblBIns18"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant18"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni18"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi18"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif18"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot18"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp18" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="INMOVILIZADORES ó FÉRULA MIEMBROS SUPERIORES" id="lblBIns19"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant19"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni19"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi19"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif19"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot19"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp19" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow> 
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="VASOS DESECHABLES" id="lblBIns20"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant20"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Paquete de 25" id="lblBUni20"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi20"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif20"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot20"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp20" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="TENSIÓMETRO" id="lblBIns21"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant21"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni21"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi21"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif21"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot21"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp21" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="FONENDOSCOPIO" id="lblBIns22"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant22"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni22"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi22"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif22"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot22"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp22" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ACETAMINOFÉN TABLETAS POR 500 mg" id="lblBIns23"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="2" id="lblBCant23"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Sobre de 100" id="lblBUni23"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi23"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif23"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot23"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp23" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="HIDRÓXIDO DE ALUMINIO TABLETAS" id="lblBIns24"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant24"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Sobre de 10" id="lblBUni24"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi24"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif24"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot24"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp24" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ASA TABLETAS POR 100 mg" id="lblBIns25"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant25"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Sobre de 10" id="lblBUni25"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi25"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif25"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot25"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp25" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
										 <asp:TableRow>
											 <asp:TableCell><asp:Label runat="server" Text="ELEMENTO DE BARRERA ó MÁSCARA PARA RCP" id="lblBIns26"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="1" id="lblBCant26"></asp:Label></asp:TableCell>
											<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblBUni26"></asp:Label></asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtBExi26"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtBDif26"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:TextBox runat="server" CssClass="form-control" id="txtBMot26"></asp:TextBox>
											 </asp:TableCell>
											 <asp:TableCell>
												 <asp:DropDownList runat="server" id="ddlBRemp26" CssClass="form-control">
													<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
													<asp:ListItem Text="No" Value="No"></asp:ListItem>
												</asp:DropDownList>
											 </asp:TableCell>
										 </asp:TableRow>
									 </asp:Table>
								 </asp:Panel>
							 </div>
						</div>
						 <div class="row form-group">
							<label>Observaciones</label><br />
							<asp:TextBox class="col-md-12  " runat="server" id="txtBObse" TextMode="Multiline" Rows="4"></asp:TextBox>
						 </div>
						
						<div class="row" align="center">					   
							<div class="col-md-4 col-md-offset-2">
								<asp:Button runat="server" id="btnDocumen" Text="Generar Documento" 
									CssClass="btn btn-block btn-info" OnClick="GenerarDocumento"/>
							 </div>
						</div>
					</asp:PlaceHolder>

					<!-- TIPO C -->
					<asp:PlaceHolder runat="server" id="phInformacionTipoC" Visible="False">
						<div class="row form-group text-center">
							<h4 class="text-left">Hoja de Inventario - Botiquín de Primeros Auxilios(Tipo C)</h4>

						</div>

						<div class="row">
								 <div class="col-md-12  ">
									 <asp:Panel runat="server" id="pnDatosC">
										 <asp:Table runat="server" id="Table2" CssClass="table">
											 <asp:TableHeaderRow CssClass="bg-aqua color-palette">
												 <asp:TableHeaderCell>Insumo</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Cantidad Requerida</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Unidad</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Existencia</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Diferencia</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
												 <asp:TableHeaderCell>Reemplazado</asp:TableHeaderCell>
											 </asp:TableHeaderRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="GASAS LIMPIAS" id="lblCIns1"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant1"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Paquete de 100" id="lblCUni1"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi1"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif1"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot1"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp1" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="GASAS ESTÉRILES" id="lblCIns2"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="20" id="lblCCant2"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Paquete de 3" id="lblCUni2"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi2"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif2"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot2"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp2" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="APÓSITO ó COMPRESAS NO ESTÉRILES" id="lblCIns3"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="8" id="lblCCant3"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni3"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi3"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif3"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot3"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp3" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="ESPARADRAPO DE TELA ROLLO 4" id="lblCIns4"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant4"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni4"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi4"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif4"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot4"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp4" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="BAJALENGUAS" id="lblCIns5"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant5"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Paquete de 20" id="lblCUni5"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi5"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif5"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot5"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp5" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 2 X 5 YARDAS" id="lblCIns6"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant6"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni6"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi6"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif6"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot6"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp6" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 3 X 5 YARDAS" id="lblCIns7"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant7"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni7"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi7"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif7"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot7"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp7" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VENDA ELÁSTICA 5 X 5 YARDAS" id="lblCIns8"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant8"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni8"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi8"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif8"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot8"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp8" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VENDA DE ALGODÓN 3 X 5 YARDAS" id="lblCIns9"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant9"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni9"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi9"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif9"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot9"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp9" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VENDA DE ALGODÓN 5 X 5 YARDAS" id="lblCIns10"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant10"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni10"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi10"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif10"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot10"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp10" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="CLORHEXIDINA O YODOPOVIDONA (JABÓN QUIRÚRGICO)" id="lblCIns11"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant11"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Galón" id="Label2"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi11"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif11"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot11"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp11" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="SOLUCIÓN SALINA 250 cc ó 500 cc" id="lblCIns12"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="10" id="lblCCant12"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni12"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi12"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif12"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot12"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp12" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="GUANTES DE LÁTEX PARA EXAMEN" id="lblCIns13"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant13"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Caja de 100" id="lblCUni13"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi13"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif13"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot13"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp13" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="TERMÓMETRO DE MERCURIO ó DIGITAL" id="lblCIns14"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant14"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni14"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi14"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif14"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot14"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp14" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="ALCOHOL ANTISÉPTICO FRASCO POR 275 ml" id="lblCIns15"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant15"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni15"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi15"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif15"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot15"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp15" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="TIJERAS" id="lblCIns16"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant16"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni16"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi16"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif16"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot16"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp16" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="LINTERNA" id="lblCIns17"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant17"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni17"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi17"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif17"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot17"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp17" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="PILAS DE REPUESTO" id="lblCIns18"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant18"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Par" id="lblCUni18"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi18"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif18"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot18"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp18" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="TABLA ESPINAL LARGA" id="lblCIns19"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="1" id="lblCCant19"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni19"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi19"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif19"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot19"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp19" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow> 
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="COLLAR CERVICAL" id="lblCIns20"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant20"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni20"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi20"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif20"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot20"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp20" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="INMOVILIZADORES ó FÉRULA MIEMBROS SUPERIORES" id="lblCIns21"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant21"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni21"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi21"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif21"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot21"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp21" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="VASOS DESECHABLES" id="lblCIns22"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant22"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Paquete de 25" id="lblCUni22"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi22"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif22"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot22"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp22" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="TENSIÓMETRO" id="lblCIns23"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant23"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni23"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi23"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif23"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot23"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp23" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="FONENDOSCOPIO" id="lblCIns24"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant24"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni24"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi24"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif24"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot24"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp24" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="ACETAMINOFÉN TABLETAS POR 500 mg" id="lblCIns25"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant25"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Sobre de 10" id="lblCUni25"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi25"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif25"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot25"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp25" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="HIDRÓXIDO DE ALUMINIO TABLETAS" id="lblCIns26"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="4" id="lblCCant26"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Sobre de 10" id="lblCUni26"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi26"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif26"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot26"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp26" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="ASA TABLETAS POR 100 mg" id="lblCIns27"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant27"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Sobre de 10" id="lblCUni27"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi27"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif27"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot27"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp27" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
											 <asp:TableRow>
												 <asp:TableCell><asp:Label runat="server" Text="ELEMENTO DE BARRERA ó MÁSCARA PARA RCP" id="lblCIns28"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="2" id="lblCCant28"></asp:Label></asp:TableCell>
												<asp:TableCell><asp:Label runat="server" Text="Unidad" id="lblCUni28"></asp:Label></asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" AutoPostBack="true" OnTextChanged="calcularDif" TextMode="Number" CssClass="form-control" id="txtCExi28"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" Enabled="False" CssClass="form-control" id="txtCDif28"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:TextBox runat="server" CssClass="form-control" id="txtCMot28"></asp:TextBox>
												 </asp:TableCell>
												 <asp:TableCell>
													 <asp:DropDownList runat="server" id="ddlCRemp28" CssClass="form-control">
														<asp:ListItem Text="Si" Value="Si"></asp:ListItem>
														<asp:ListItem Text="No" Value="No"></asp:ListItem>
													</asp:DropDownList>
												 </asp:TableCell>
											 </asp:TableRow>
										 </asp:Table>
									 </asp:Panel>
								 </div>
							</div>

						<div class="row form-group">
							<label>Observaciones</label><br />
							<asp:TextBox class="col-md-12  " runat="server" id="txtObsC" TextMode="Multiline" Rows="4"></asp:TextBox>
						</div>

						<div class="row" align="center">

							<div class="col-md-3 col-md-offset-4">
								<asp:Button runat="server" id="Button1" Text="Generar Documento" 
									CssClass="btn btn-block btn-info" OnClick="GenerarDocumento"/>
							</div>
						</div>
					</asp:PlaceHolder>
				  </ContentTemplate>
				<Triggers>
					<asp:PostBackTrigger ControlID = "btnDocumento"/>
				</Triggers>
			</asp:updatepanel>

	</div>
</asp:Content>