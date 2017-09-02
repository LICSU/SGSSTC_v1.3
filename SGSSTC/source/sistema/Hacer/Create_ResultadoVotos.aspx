<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ResultadoVotos.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ResultadoVotos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
	PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:Panel runat="server" ID="panel1">
		
		<ol class="breadcrumb">
			<li><a href="#">Fase: Hacer</a></li>
			<li><a href="../Hacer/index_ActaCopasst.aspx">Actas Copasst</a></li>
			<li><a href="#">Crear Resultados Votos</a></li>
		</ol>

		<div class="page-header">
			<h1 class="text-center">Resultados obtenidos del conteo de votos</h1>
		</div>

		<div class="row">
			<asp:placeholder runat="server" id="phEmpresa">
				<div class="col-md-4">
					<h4 class="text-center">Empresa</h4>
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" 
						OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
				</div>
			</asp:placeholder>

			<asp:placeholder runat="server" id="phSucursal" visible="false">
				<div class="col-md-4 col-md-offset-4">
					<h4 class="text-center">Sucursal</h4>
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
					
					<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" setfocusonerror="true" 
						Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" 
						runat="server" ValidationGroup="ValidationAdd"/>
				</div>
			</asp:placeholder>
		</div>
		<br />

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<table class="table table-condensed">
					<tbody>
						<tr class="bg-aqua color-palette">
							<th class="col-md-8 text-center">PERSONA</th>
							<th class="col-md-4 text-center">N° DE VOTOS</th>
						</tr>

						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox1" placeholder="Candidato 1"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox2" type="number" min="0"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox3" placeholder="Candidato 2"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox4"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox5" placeholder="Candidato 3"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox6"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox7" placeholder="Candidato 4"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox8"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>VOTOS EN BLANCO:</h4>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox9"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>VOTOS ANULADOS:</h4>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox10"></asp:textbox>
							</td>
						</tr>
						<tr>
							<td>
								<h4>RESULTADOS DE LOS VOTOS:</h4>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" type="number" min="0" id="Textbox61"></asp:textbox>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<br />

		<h3>Resultaron elegidos en ésta votación las siguientes personas:</h3>
		<div class="row"> 
			<div class="col-md-10 col-md-offset-1">
				<table class="table table-condensed">
					<tbody>
						<tr class="bg-aqua color-palette">
							<th class="col-md-3 text-center">NOMBRE</th>
							<th class="col-md-3 text-center">OFICIO</th>
							<th class="col-md-3 text-center">SECCIÓN</th>
							<th class="col-md-3 text-center">CATEGORÍA<br />
								<div class="col-md-6 bg-green color-palette">PRINCIPAL</div>
								<div class="col-md-6 bg-yellow color-palette">SUPLENTE</div>
							</th>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox11"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox12"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox13"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox14"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox15"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox16"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox17"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox18"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox19"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox20"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox21"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox22"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox23"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox24"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox25"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox26"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox27"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox28"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox29"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox30"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox31"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox32"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox33"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox34"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox35"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox36"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox37"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox38"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox39"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox40"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox41"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox42"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox43"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox44"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox45"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox46"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox47"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox48"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox49"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox50"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox51"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox52"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox53"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox54"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox55"></asp:textbox>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox56"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox57"></asp:textbox>
							</td>
							<td>
								<asp:textbox cssclass="form-control" runat="server" id="Textbox58"></asp:textbox>
							</td>
							<td>
								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox59"></asp:textbox>
								</div>

								<div class="col-md-6">
									<asp:textbox cssclass="form-control" runat="server" id="Textbox60"></asp:textbox>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<br />

		<div class="row" align="center">

			<div class="col-md-4 col-md-offset-4">
				<asp:ImageButton alt="-" id="btnPrint" runat="server" imageurl="~\ico\print.png"
					onclick="GenerarDocumento" validationgroup="ValidationAdd"/>
				<h4>Generar Documento</h4>
			</div>

		</div>
</asp:Panel>
</asp:Content>