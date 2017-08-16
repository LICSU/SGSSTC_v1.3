<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_ExamenLaboral.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_ExamenLaboral" %>

<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:updatepanel id="MyUpdatePanel" runat="server">
		<ContentTemplate>
			<script>
                $(function () {
                    $("#accordion").accordion({
                        collapsible: true
                    });
                });

                function redireccionar() {
                    window.location = "index.aspx";
                }
				</script>
			
			
            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_ExamenLaboral.aspx">Examen Laboral</a></li>
                <li><a href="#">Crear Examen Laboral</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Nuevo Examen Laboral</h1>
            </div>
			
			<!-- Empresa -->
			<div class="row">
				<asp:PlaceHolder runat="server" id="phEmpresa">
				<div class="col-md-3">
					<asp:Label runat="server" Text="Empresa"></asp:Label> 
					<asp:DropDownList runat="server" id="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged" AutoPostBack="True">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>
				</asp:PlaceHolder>
				
				<asp:PlaceHolder runat="server" id="phSucursal">
				<div class="col-md-3">
					<asp:Label runat="server" Text="Sucursal"></asp:Label> 
					<asp:DropDownList runat="server" id="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged" AutoPostBack="True">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>
				</asp:PlaceHolder>

				<div class="col-md-4">
					<asp:Label runat="server" Text="Ubicación"></asp:Label>
					<br />
					<asp:Label runat="server" id="lbUbicacion" Text="----"></asp:Label>
				</div>

				<div class="col-md-2">
					<asp:Label runat="server" Text="N° de Historia"></asp:Label>
					<br />
					<asp:Label runat="server" id="lbNumHistoria" Text="----"></asp:Label>
				</div>
			</div><hr />
			
			<!-- Tipo Examen -->
			<div class="row">
				<div class="col-md-4">
					<asp:Label runat="server" Text="Tipo de Examen"></asp:Label>
					
					<asp:DropDownList runat="server" id="ddlTipoExamen" AutoPostBack="True" CssClass="form-control">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>
				
				<div class="col-md-4">
					<asp:Label runat="server" Text="Fecha"></asp:Label>
					<br />
					<asp:TextBox id="txtFecha" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="Date"/> 
				</div>
				
				<div class="col-md-4">
					<asp:Label runat="server" Text="Trabajador"></asp:Label>
					
					<asp:DropDownList runat="server" id="ddlTrabajador" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlTrabajador_SelectedIndexChanged">
						<asp:ListItem Text="Seleccione un Valor" Value="0"></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div><hr />
			
			<!-- datos del trabajador  -->
			<div class="accordion" id="accordion2"> 
				<div class="accordion-group">
					<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
								<h3>Datos Personales</h3>
							</a>
						</div>
					<div id="collapseOne" class="accordion-body collapse">
						<div>
							<div class="col-md-12 text-center"><h3>Información del Trabajador</h3></div><br />
					
							<!-- 1er nombre -->
							<div class="row">
 <div class="col-md-12 text-left">
	 <asp:Label runat="server" id="Label28" Text="Primer Nombre" Font-Bold="True"></asp:Label>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtNombre1" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
					
							<!-- 2do nombre -->
							<div class="row">
 <div class="col-md-12 text-left">
	 <asp:Label runat="server" id="Label15" Text="Segundo Nombre" Font-Bold="True"></asp:Label>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtNombre2" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
					
							<!-- Apellidos -->
							<div class="row">
 <div class="col-md-12 text-left">
	 <asp:Label runat="server" id="Label1" Text="Primer Apellido" Font-Bold="True"></asp:Label>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtApellido1" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="col-md-12 text-left">
	 <asp:Label runat="server" id="Label16" Text="Segundo Apellido" Font-Bold="True"></asp:Label>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtApellido2" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
					
							<!-- Cedula y FechaNacimiento -->
							<div class="row">
 <div class="col-md-12 text-left">
	 <asp:Label runat="server" id="Label3" Text="Cedula" Font-Bold="True"></asp:Label>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtCedula" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label20" Text="Fecha de Nacimiento" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtFechaNac" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
					
							<!-- Email -->
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label2" Text="Email" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtEmail" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
					
							<!-- Sexo - Edo civil -->
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label5" Text="Sexo" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
	 <asp:Label runat="server" id="txtSexo" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label17" Text="Estado Civil" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
	 <asp:Label runat="server" id="txtEdoCivil" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label7" Text="Télefono de Casa" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtTelCasa" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label6" Text="Teléfono Celular" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class=""> 
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtTelCelular" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label9" Text="EPS" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class="">
	 <div class="col-md-6">
		 <asp:Label runat="server" id="txtEps" Text="----"></asp:Label>
	 </div>
 </div>
										</div><br />
							<div class="row">
 <div class="">
	 <div class="col-md-12 text-left">
		 <asp:Label runat="server" id="Label8" Text="Foto" Font-Bold="True"></asp:Label>
	 </div>
 </div>
 <div class=""> 
	 <div class="col-md-6">
		 <asp:Image alt="-" runat="server" id="fuFoto"></asp:image>
	 </div>
	 <div class="col-md-6">
		 <asp:Image alt="-" runat="server" id="Image1"></asp:image>
	 </div>
 </div>
										</div><br />
							<div class="row">
								<div class="col-md-12 text-left">
									<asp:Label runat="server" id="Label12" Text="Dirección" Font-Bold="True"></asp:Label><br />
									<asp:Label runat="server" id="txtDireccion" Text="----"></asp:Label>
								</div>
							</div>
						</div>
						</div>
				 </div>
				
				<div class="accordion-group">
					<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<h3>Información SocioDemografica del Trabajador</h3>
							</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse"> 
							<div>
						<div class="col-md-12 text-center">
							<h3>Información SocioDemografica</h3>
						</div><br /><hr />
					
						<!-- Lugar de Nacimiento/nivel escolaridad -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Lugar de Nacimiento</h4>
								<asp:Label runat="server" id="txtLugarNac" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Nivel de Escolaridad</h4>
								<asp:Label runat="server" id="txtNivelEsc" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Años aprobados/cabeza de familia -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Años aprobados en ese último nivel</h4>
								<asp:Label runat="server" id="txtAñosAprob" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">¿Es usted cabeza de familia?</h4>
								<asp:Label runat="server" id="txtCabezaFlia" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Cuantos hijos/responsabilidad económica -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">¿Cuantos hijos tiene?</h4>
								<asp:Label runat="server" id="txtCantHijos" Text="----"></asp:Label>
							 </div>
							<div class="col-md-6">
								<h4 class="text-left">¿Con quién reparte la responsabilidad económica de su familia?</h4>
								<asp:Label runat="server" id="txtRespEco" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- MenoresDependen/Condicion Social -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">¿Cuantos menores dependen económicamente de ud?</h4>
									<asp:Label runat="server" id="txtDependen" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">¿Socialmente en que condición se encuentra usted?</h4>
									<asp:Label runat="server" id="txtCondSocio" Text="----"></asp:Label>
								</div>
						</div><br />
					
						<!-- Motivo Desplazamiento/tipo de vivienda -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">¿Cual fue el motivo del desplazamiento?</h4>
								<asp:Label runat="server" id="txtMotivoDespl" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">La vivienda donde habita es:</h4>
								<asp:Label runat="server" id="txtTipoVivienda" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Servicios públicos / tipo de vivienda -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Servicios públicos de su vivienda</h4>
								<asp:Label runat="server" id="txtServicioPublico" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Tipo de Vivienda</h4>
								<asp:Label runat="server" id="txtVivienda" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Cerca de Industrias / Hay mucho ruido -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Cerca de Industrias</h4>
								<asp:Label runat="server" id="txtCercaIndustria" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Hay mucho ruido</h4>
								<asp:Label runat="server" id="txtRuido" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Hay Mucha Contaminación / Hay mucho ruido -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Hay Mucha Contaminación</h4>
								<asp:Label runat="server" id="txtContaminacion" Text="----"></asp:Label>
							 </div>
							<div class="col-md-6">
								<h4 class="text-left">Descripcion el techo, paredes y piso</h4>
								<asp:Label runat="server" id="txtDescripcion" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  afiliado al sistema de seguridad social / Régimen de Afiliación -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Se encuentra afiliado al sistema de seguridad social en salud</h4>
								<asp:Label runat="server" id="txtAfiliado" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Régimen de Afiliación</h4>
								<asp:Label runat="server" id="txtRegimenAfiliacion" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  ¿A qué EPS pertenece? / Nivel de SISBEN -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">¿A qué EPS pertenece?</h4>
								<asp:Label runat="server" id="txtEPS1" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Nivel de SISBEN</h4>
								<asp:Label runat="server" id="txtNivelSISBEN" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  Sistea seg pensiones / ¿A qué fondo pertenece? -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">Se encuentra afiliado al sistema de seguridad social en pensiones</h4>
								<asp:Label runat="server" id="txtSistSocial" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">¿A qué fondo pertenece?</h4>
								<asp:Label runat="server" id="txtFondoPensiones" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  afiliado a riesgos profe / ¿A qué ARP pertenece? -->
						<div class="row">
							<div class="col-md-6 text-left">
								<h4 class="text-left">¿A qué ARP pertenece?</h4>
								<asp:Label runat="server" id="txtARP" Text="----"></asp:Label>
							</div>
							<div class="col-md-6">
								<h4 class="text-left">Se encuentra afiliado a riesgos profesionales</h4>
								<asp:Label runat="server" id="txtRiesgosProf" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  Estrato / ¿A qué ARP pertenece? -->
						<div class="row">
							<div class="col-md-12 text-left">
								<h4 class="text-left">¿Cual es el estrato que registran sus facturas de los servicios públicos de la vivienda donde reside?</h4>
								<asp:Label runat="server" id="txtEstrato" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!--  Empleos Anteriores -->
						<div class="col-md-12 text-center">
							<h3>Empleos Anteriores</h3>
						</div><hr />
					
						<div class="row">
							<div class="col-md-2 text-left">
								<h4 class="text-left">Empresa</h4>
							</div>
							<div class="col-md-2 text-left">
								<h4 class="text-left">Área</h4>
							</div>
							<div class="col-md-2 text-left">
								<h4 class="text-left">Cargo u Oficio</h4>
							</div>
							<div class="col-md-2 text-left">
								<h4 class="text-left">Años</h4>
							</div>
							<div class="col-md-2 text-left">
								<h4 class="text-left">Meses</h4>
							</div>
							<div class="col-md-2 text-left">
								<h4 class="text-left">Enfermedades adquiridas en el cargo</h4>
							</div>
						</div>
						
							<asp:PlaceHolder runat="server" id="phempleo1" Visible="false">
								<hr /><div class="row">
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtEmpresa1" Text="----"></asp:Label>
 </div>
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtArea1" Text="----"></asp:Label>
 </div>
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtCargo1" Text="----"></asp:Label>
 </div>
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtAños1" Text="----"></asp:Label>
 </div>
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtMeses1" Text="----"></asp:Label>
 </div>
 <div class="col-md-2">
	 <asp:Label runat="server" id="txtEnfermedades1" Text="----"></asp:Label>
 </div>
										</div>
							</asp:PlaceHolder>
						
							<asp:PlaceHolder runat="server" id="phempleo2" Visible="false">
							   <hr /><div class="row">
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtEmpresa2" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtArea2" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtCargo2" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtAños2" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtMeses2" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtEnfermedades2" Text="----"></asp:Label>
	 </div>
 </div>
							</asp:PlaceHolder>
						
							<asp:PlaceHolder runat="server" id="phempleo3" Visible="false">
							   <hr /><div class="row">
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtEmpresa3" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtArea3" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtCargo3" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtAños3" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtMeses3" Text="----"></asp:Label>
	 </div>
	 <div class="col-md-2">
		 <asp:Label runat="server" id="txtEnfermedades3" Text="----"></asp:Label>
	 </div>
 </div>
							</asp:PlaceHolder><br />


					</div>
						</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTree">
							<h3>Información del Puesto de Trabajo del Trabajador</h3>
						</a>
					</div>
					<div id="collapseTree" class="accordion-body collapse"> 
						<div>
						<div class="col-md-12 text-center">
							<h3>Información del Puesto de Trabajo</h3>
						</div><br />
					
						<!-- Nombre -->
						<div class="row">
							<div class="col-md-12 text-left">
								<h4 class="text-left">Nombre del Puesto</h4>
								<asp:Label runat="server" id="txtNombrePuesto" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Descripcion -->
						<div class="row">
							<div class="col-md-12 text-left">
								<h4 class="text-left">Descripcion del Puesto</h4>
								<asp:Label runat="server" id="txtDescPuesto" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<!-- Area -->
						<div class="row">
							<div class="col-md-12 text-left">
								<h4 class="text-left">Area del Puesto</h4>
								<asp:Label runat="server" id="txtAreaPuesto" Text="----"></asp:Label>
							</div>
						</div><br />
					
						<div class="col-md-12 text-center">
							<h3>Información del Riesgos del Puesto de Trabajo</h3>
						</div>
						<br /><br /><br /><br />

						<div class="row">
						<div class="box-body">
						<div class="dataTables_wrapper form-inline dt-bootstrap"><ucpag:pagination runat="server" id="pagination"/>
						
							<asp:GridView id="GridView4" 
								class="table table-bordered table-hover dataTable"
								runat="server"
								AutoGenerateColumns="false" 
								AllowPaging="true"
								PageSize="10" 
								onpageindexchanging="GridView4_PageIndexChanging"
								EmptyDataText="No existen Registros">
								<rowstyle  HorizontalAlign="Center"/>
									
										<Columns>
 <asp:TemplateField HeaderText="Riesgo">
 <ItemTemplate>
	 <asp:Label id="identificacion_riesgo" runat="server" Text='<%# Eval("identificacion_riesgo") %>'/>
 </ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Probabilidad">
 <ItemTemplate>
	 <asp:Label id="probabilidad" runat="server" Text='<%# Eval("probabilidad") %>'/>
 </ItemTemplate>
										</asp:TemplateField>
										 <asp:TemplateField HeaderText="Severidad">
 <ItemTemplate>
	 <asp:Label id="severidad" runat="server" Text='<%# Eval("severidad") %>'/>
 </ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Valor de Riesgo">
 <ItemTemplate>
	 <asp:Label id="valor_riesgo" runat="server" Text='<%# Eval("valor_riesgo") %>'/>
 </ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Prioridad">
 <ItemTemplate>
	 <asp:Label id="prioridad" runat="server" Text='<%# Eval("prioridad") %>'/>
 </ItemTemplate>
										</asp:TemplateField>

										</Columns>
									</asp:GridView>
						</div>
					</div>
				</div><br /><hr />
					</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
							<h3>Accidentes Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseFour" class="accordion-body collapse"> 
						<div>
						<div class="col-md-12 text-center">
							<h3>Accidentes Laborales del Trabajador</h3>
						</div><br /><br /><br />

						<div class="row">
							<div class="box-body">
							<div class="dataTables_wrapper form-inline dt-bootstrap">
								<ucpag:pagination runat="server" id="pagination0"/>
						
								<asp:GridView id="GridView1" 
									class="table table-bordered table-hover dataTable"
									runat="server"
									AutoGenerateColumns="false" 
									AllowPaging="true"
									PageSize="10" 
									onpageindexchanging="GridView1_PageIndexChanging" 
									OnRowCommand="GridView1_RowCommand" 
									EmptyDataText="No existen Registros">
									<rowstyle  HorizontalAlign="Center"/>
									
		 
 <Columns>
	 <asp:TemplateField HeaderText="Id Accidente">
		 <ItemTemplate>
			 <asp:Label id="id" runat="server" Text='<%# Eval("id_acc_lab") %>'/>
		 </ItemTemplate>
	 </asp:TemplateField>

	 <asp:TemplateField HeaderText="Fecha del Accidente">
		 <ItemTemplate>
			 <asp:Label id="fecha_accidente" runat="server" Text='<%# Eval("fecha_acc") %>'/>
		 </ItemTemplate>
	 </asp:TemplateField>
					
	 <asp:TemplateField HeaderText="Afectado">
		 <ItemTemplate><asp:Label id="afectado" runat="server" Text='<%# Eval("nombre") %>'/></ItemTemplate>
	 </asp:TemplateField> 
										
	 <asp:TemplateField HeaderText="Ver">
		 <ItemTemplate>
			 <asp:HyperLink id="hlEscaneado" runat="server" Target = "_blank" NavigateUrl='<%# Eval("documento_escaneado") %>'>Ver Archivo </asp:HyperLink>
		 </ItemTemplate>
	 </asp:TemplateField>

	 <asp:ButtonField CommandName="verDetalle" ButtonType="Image" ImageUrl="~\ico\view.png">
		 <ControlStyle></ControlStyle>
	 </asp:ButtonField>

 </Columns>
										</asp:GridView> 
	 </div>
							</div>
							</div><br />
					</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
							<h3>Examenes Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseFive" class="accordion-body collapse"> 
						<div>
					<div class="col-md-12 text-center">
						<h3>Examenes Laborales del Trabajador</h3>
					</div><br /><br /><br />

					<div class="row">
					<div class="box-body">
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<ucpag:pagination runat="server" id="pagination1"/>
						
							<asp:GridView id="GridView2" 
								class="table table-bordered table-hover dataTable"
								runat="server"
								AutoGenerateColumns="false" 
								AllowPaging="true"
								PageSize="10" 
								onpageindexchanging="GridView2_PageIndexChanging" 
								EmptyDataText="No existen Registros">
								<rowstyle  HorizontalAlign="Center"/>
									 
									<Columns>
										<asp:TemplateField HeaderText="Id Historia">
 <ItemTemplate>
	 <asp:Label id="id_his_cli_ocu" runat="server" Text='<%# Eval("id_his_cli_ocu") %>'/>
 </ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Fecha">
 <ItemTemplate>
	 <asp:Label id="fecha" runat="server" Text='<%# Eval("fecha") %>'/>
 </ItemTemplate>
										</asp:TemplateField>
					
										<asp:TemplateField HeaderText="Diagnostico">
 <ItemTemplate><asp:Label id="diagnostico" runat="server" Text='<%# Eval("diagnostico") %>'/></ItemTemplate>
										</asp:TemplateField> 
										
										<asp:TemplateField HeaderText="Recomendaciones">
 <ItemTemplate><asp:Label id="recomendaciones" runat="server" Text='<%# Eval("recomendaciones") %>'/></ItemTemplate>
										</asp:TemplateField>

									</Columns>
								</asp:GridView> 
										</div>
									</div>
								</div><br />

				</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix">
							<h3>Equipos Laborales del Trabajador</h3>
						</a>
					</div>
					<div id="collapseSix" class="accordion-body collapse"> 
						<div>
					<div class="col-md-12 text-center">
						<h3>Equipos Laborales del Trabajador</h3>
					</div><br /><br /><br />

					<div class="row">
						<div class="box-body">
						<div class="dataTables_wrapper form-inline dt-bootstrap">
							<ucpag:pagination runat="server" id="pagination2"/>
						
							<asp:GridView id="GridView3" 
								class="table table-bordered table-hover dataTable"
								runat="server"
								AutoGenerateColumns="false" 
								AllowPaging="true"
								PageSize="10" 
								onpageindexchanging="GridView3_PageIndexChanging"
								EmptyDataText="No existen Registros">
								<rowstyle  HorizontalAlign="Center"/>

									 
									<Columns>
										<asp:TemplateField HeaderText="Nombre">
 <ItemTemplate>
	 <asp:Label id="nombre" runat="server" Text='<%# Eval("nombre") %>'/>
 </ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Fecha">
 <ItemTemplate>
	 <asp:Label id="Label4" runat="server" Text='<%# Eval("fecha") %>'/>
 </ItemTemplate>
										</asp:TemplateField>
					
										<asp:TemplateField HeaderText="Tipo">
 <ItemTemplate><asp:Label id="tipo" runat="server" Text='<%# Eval("tipo") %>'/></ItemTemplate>
										</asp:TemplateField> 
										
									</Columns>
								</asp:GridView> 
									</div>
					</div>
					</div><br />
				</div>
					</div>
				</div>

			</div><br />
			
			<!-- tabs  -->
			<div class="row">
				<div class="col-md-12">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
						  <li class="active">
							  <a href="#tab_1" data-toggle="tab" aria-expanded="true">Tab 1</a>
						  </li>
						  <li class="">
							  <a href="#tab_2" data-toggle="tab" aria-expanded="false">Tab 2</a>
						  </li>
						  <li>
							  <a href="#tab_3" data-toggle="tab">Tab 3</a>
						  </li>
						</ul>
						<div class="tab-content">
							  <div class="tab-pane active" id="tab_1">
								  <div class="row text-center">
									  <div class="col-md-10">
										  <asp:Table runat="server" id="tbl1" CssClass="table">

   <asp:TableHeaderRow>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" ColumnSpan="5">
		   <label>HISTORIA CLINICA</label>
	   </asp:TableHeaderCell>
   </asp:TableHeaderRow>

   <asp:TableRow >
	   <asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Oficios desempeñados Empresa/ Area</label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Ocupacion/ Oficio</label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Tiempo Años/ Meses</label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>Ha presentado una enfermedad causada por el trabajo</label>
	   </asp:TableHeaderCell>
   </asp:TableRow>

   <asp:TableRow >
	   <asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label>1. </label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label></label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
		   <label></label>
	   </asp:TableHeaderCell>
	   <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center">
		   <label>
	 Si____  No_____
 </label>
	   </asp:TableHeaderCell>
   </asp:TableRow>

	 <asp:TableRow >
		 <asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label>2. </label>
		 </asp:TableHeaderCell>
		 <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label></label>
		 </asp:TableHeaderCell>
		 <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
			 <label></label>
		 </asp:TableHeaderCell>
		 <asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center" RowSpan="6">
			 <label></label>
		 </asp:TableHeaderCell>
	 </asp:TableRow>

									<asp:TableRow >
										<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>2. </label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
									</asp:TableRow>
									<asp:TableRow >
										<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>3. </label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
									</asp:TableRow>
									<asp:TableRow >
										<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>4. </label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
									</asp:TableRow>
									<asp:TableRow >
										<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>5. </label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
									</asp:TableRow>
									<asp:TableRow >
										<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label>Actual. </label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
										<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
 <label></label>
										</asp:TableHeaderCell>
									</asp:TableRow>
								</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div>
							  </div>

							  <div class="tab-pane" id="tab_2">
								  <b>Registro de Historia Clinica Ocupacional<br />Para Ser llenado por el Médico</b><br />
					  
								  <!-- Tabla #1 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="3">
		   <label>EXAMEN FÍSICO</label>
	   </asp:TableCell>
   </asp:TableRow>
 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Peso: <asp:TextBox CssClass="txt-corto" runat="server" id="txtPeso"/> Kg.</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estatura: <asp:TextBox CssClass="txt-corto" runat="server" id="txtEstatura"/> Mts. IMC:<asp:TextBox CssClass="txt-corto" runat="server" id="txtIMC"/></label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>P.A:<asp:TextBox CssClass="txt-corto" runat="server" id="txtPA1"/>/<asp:TextBox CssClass="txt-corto" runat="server" id="txtPA2"/> Pulso:<asp:TextBox CssClass="txt-corto" runat="server" id="txtPulso"/> F.R:<asp:TextBox runat="server" id="txtFR" CssClass="txt-corto"/></label>
	 </asp:TableCell>
 </asp:TableRow>
 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
		 <label>Estado General:<asp:TextBox runat="server" id="txtEstadoGen"/>.
			  Diestro:<asp:DropDownList runat="server" id="ddlDiestro"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList> . 
			  Zurdo:<asp:DropDownList runat="server" id="ddlZurdo"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>. 
			  Ambidiestro:<asp:DropDownList runat="server" id="ddlAmbidiestro"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>.</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estado Mental:<asp:TextBox CssClass="txt-corto" runat="server" id="txtEstadoMental"/></label>
	 </asp:TableCell>
 </asp:TableRow>
										</asp:Table>
									</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #2 --><br />
								  <div class="row">
									  <div class="col-md-10">
										<asp:Table id="Table2" runat="server" style="margin:0 auto;" CssClass="table">

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="7">
		 <label>CABEZA</label>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Parte del cuerpo</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estado</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Descripción</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Parte del cuerpo</label>
	 </asp:TableCell>
	  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Estado</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Descripción</label>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Craneo</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbCraneo">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescCraneo" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Mucosa Nasal</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		  <asp:RadioButtonList runat="server" id="rbMucosa">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescMuco" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="5">
		 <label>Ojos</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Párpados</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbParpados">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescPar" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Senos Paranasales</label>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbSenos">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescSenos" TextMode="MultiLine"/>
	 </asp:TableCell>

 </asp:TableRow>
 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Conjuntiva</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbConjuntiva">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescConjun" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Paladar</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbPaladar">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescPala" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Escleras</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbEscaleras">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescEscl" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Mucosa Oral</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbMucosaOral">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescMucoOral" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Córnea</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbCornea">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescCornea" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Dentadura</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbDentadura">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescDent" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Iris Pupila</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbIris">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescIris" TextMode="MultiLine"/>
	 </asp:TableCell>

	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Amigdalas</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbAmigdalas">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescAmig" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>

 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label></label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Pabellones</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbPabellones">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescPabe" TextMode="MultiLine"/>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Faringe</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbFaringe">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescFarin" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>
 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
		 <label>Oidos</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Conductos</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbConductos">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescConduc" TextMode="MultiLine"/>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Lengua</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbLengua">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescLengua" TextMode="MultiLine"/>
	 </asp:TableCell>
 </asp:TableRow>
 <asp:TableRow>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		 <label>Timpanos</label>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		<asp:RadioButtonList runat="server" id="rbTimpanos">
			 <asp:ListItem Text="Normal" Value="Normal"/>
			 <asp:ListItem Text="Anormal" Value="Anormal"/>
		 </asp:RadioButtonList>
	 </asp:TableCell>
	 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		 <asp:TextBox runat="server" id="txtDescTimpano" TextMode="MultiLine"/>
	 </asp:TableCell>

 </asp:TableRow>
										</asp:Table>
									</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #3 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table3" runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow CssClass="text-center">
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4">
		   <label>Agudeza Visual</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Carta Snellen</label>
	   </asp:TableCell>

	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>OD</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>OI</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>AO</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cercana</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtODCercana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtOICercana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtAOCercana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Lejana</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtODLejana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtOILejana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>20/<asp:TextBox runat="server" id="txtAOLejana" CssClass="txt-corto"/></label>
	   </asp:TableCell>
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #4 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table4" runat="server" style="margin:0 auto; " CssClass="table">
   <asp:TableRow CssClass="text-center">
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cuello</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Tórax</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inspección</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInspeccion">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescInsp" TextMode="MultiLine"/>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Auscultación</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbAuscultacion">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescAusc" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Palpación</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbPalpacion">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescPalp" TextMode="MultiLine"/>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Murmullo Vesicular</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		   <asp:RadioButtonList runat="server" id="rbrMulloVesicular">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		   <asp:TextBox runat="server" id="txtDescMurmu" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Adenopatias</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbAdenopatias">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescAdeno" TextMode="MultiLine"/>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Ruidos Cardiacos</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRuidosCardiacos">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescRuidos" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>

   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Glándula Tiroides</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbGlandulaTiroides">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescGalnd" TextMode="MultiLine"/>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Soplos</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbSoplos">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescSoplos" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #5 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table5" runat="server" style="margin:0 auto; " CssClass="table">
   <asp:TableRow CssClass="text-center">
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" Width="400px">
		   <label>Abdomen</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Parte del Cuerpo</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Descripción</label>
	   </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
		   <asp:TextBox runat="server" id="txtDescAbdomen" TextMode="MultiLine" PlaceHolder="Descripcion" Rows="9" Columns="70"/>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Mamas</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbMamas">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescMamas" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>

   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Piel</label>
	   </asp:TableCell>

	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbPiel">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescPiel" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow> 
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Uñas</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbUnas">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescUnas" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
		   <asp:TextBox runat="server" id="txtDescHerina" TextMode="MultiLine" PlaceHolder="Hernia.." Rows="9" Columns="70"/>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cicatrices</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbCicatrices">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescCicat" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>

   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Tatuajes</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbTatuajes">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" id="txtDescTatu" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Varices</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbVarices">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
		   <asp:TextBox runat="server" id="txtDescVarices" TextMode="MultiLine"/>
	   </asp:TableCell>
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #6 --><br />
								  <div class="row">
									  <div class="col-md-10">
									<asp:Table id="Table6" runat="server" style="margin:0 auto; " CssClass="table">
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
	 <label>Arcos de Movimiento</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
	 <label>Miembros Superiores</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
	 <label>Arcos de Movimiento</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
	 <label>Miembros Inferiores</label>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Hombro</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Codo</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Muñeca</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Dedos</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Cadera</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Rodilla</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Pie</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
	 <label>Dedos</label>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>D</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>I</label>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm1"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm2"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm3"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm4"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm5"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm6"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm7"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm8"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm9"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm10"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm11"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm12"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm13"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm14"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm15"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm16"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #7 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table7" runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
		   <label>Arcos de Movimiento</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cervical</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dorso Lumbar</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dolor</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Estado</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Flexión</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbFlexionCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbFlexionDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbFlexionDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Extensión</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbExtensionCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbExtensionDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbExtensionDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Rotación Derecha</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotDerCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotDerDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotDerDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Rotación Izquierda</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotIzqCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotIzqDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbRotIzqDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inclinacion Lateral Derecha</label>
	   </asp:TableCell>

	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatDerCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatDerDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatDerDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Inclinacion Lateral Izquierda</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatIzqCervical">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatIzqDorsoLumbar">
			   <asp:ListItem Text="Normal" Value="Normal"/>
			   <asp:ListItem Text="Anormal" Value="Anormal"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbInlLatIzqDolor">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #8 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table8" runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Escoliosis</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Cervical</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Dorsal</label>
	   </asp:TableCell>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Lumbar</label>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Derecha</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbDerCervical">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbDerDorsal">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbDerLumbar">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
   
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Izquierda</label>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbIzqCervical">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbIzqDorsal">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
	   
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:RadioButtonList runat="server" id="rbIzqLumbar">
			   <asp:ListItem Text="Si" Value="Si"/>
			   <asp:ListItem Text="No" Value="No"/>
		   </asp:RadioButtonList>
	   </asp:TableCell>
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
							  </div>

							  <div class="tab-pane" id="tab_3">
								  <b>Registro de Historia Clinica Ocupacional</b><br />
					  
								  <!-- Tabla #1 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table9" runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <label>Diagnosticos</label>
	   </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   <asp:TextBox runat="server" TextMode="MultiLine" id="txtDiagnostico" Rows="7" Columns="110" MaxLength="1000"/>
	   </asp:TableCell>
   </asp:TableRow>
										  </asp:Table>
									  </div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #2 --><br />
								  <div class="row">
									  <div class="col-md-10">
 <asp:Table id="Table10" runat="server" style="margin:0 auto;" CssClass="table">
	 <asp:TableRow>
		 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
			 <label>Recomendaciones</label>
		 </asp:TableCell>
	 </asp:TableRow>
	 <asp:TableRow>
		 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
			 <asp:TextBox runat="server" MaxLength="1000" TextMode="MultiLine" id="txtRecomendaciones" Rows="7" Columns="110"/>
		 </asp:TableCell>
	 </asp:TableRow>
 </asp:Table>
										</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #3 --><br />
								  <div class="row">
									  <div class="col-md-10">
									<asp:Table id="Table11" runat="server" style="margin:0 auto;" CssClass="table">
										<asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3" Width="240px">
	 <label>Uso de elementos de Proteccion recomendado para la labor asignada</label>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Ojos</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Oidos</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Cara</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Cabeza</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Respiracion</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Traje</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Otro (¿Cúal?)</label>
 </asp:TableCell>
										</asp:TableRow>
										 <asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlOjos"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlOidos"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlCara"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlCabeza"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlRespiracion"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:DropDownList runat="server" id="ddlTraje"><asp:ListItem Text="Si" Value="Si"></asp:ListItem><asp:ListItem Selected="True" Text="No" Value="No"></asp:ListItem></asp:DropDownList>
 </asp:TableCell> 
  <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	<asp:TextBox runat="server" id="txtOtroElemPro" TextMode="MultiLine"/>
 </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #4 --><br />
								  <div class="row">
									  <div class="col-md-10">
										  <asp:Table id="Table12" runat="server" style="margin:0 auto;" CssClass="table">
   <asp:TableRow>
	   <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
		   
		   <asp:RadioButtonList runat="server" id="rbElegible">
			   <asp:ListItem Text="Elegible" Value="Elegible"/>
			   <asp:ListItem Text="Elegible con restricciones que no interfieren con su trabajo normal" Value="Elegible con restricciones que no interfieren con su trabajo normal"/>
			   <asp:ListItem Text="Elegible con restricciones que difieren en su trabajo normal" Value="Elegible con restricciones que difieren en su trabajo normal"/>
			   <asp:ListItem Text="No Elegible" Value="No Elegible"/>
		   </asp:RadioButtonList>

	   </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div>
					  
								  <!-- Tabla #5 --><br />
								  <div class="row">
									  <div class="col-md-10">
									<asp:Table id="Table13" runat="server" style="margin:0 auto;" CssClass="table">
										<asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Requiere rebicación:
		 <asp:RadioButtonList runat="server" id="rbReubicacion">
			 <asp:ListItem Text="Si" Value="Si"/>
			 <asp:ListItem Text="No" Value="No"/>
		 </asp:RadioButtonList>

		 Restricciones</label>
 </asp:TableCell>
										</asp:TableRow>
										 <asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
	 <asp:TextBox runat="server" TextMode="MultiLine" id="txtRestricciones" Rows="7" Columns="110"/>
 </asp:TableCell> 
										</asp:TableRow>
									</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div><br />
					  
								  <!-- Tabla #6 -->
								  <div class="row">
									  <div class="col-md-10">
									<asp:Table id="Table14" runat="server" style="margin:0 auto;" CssClass="table text-center">
										<asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label>FECHA DEL EXAMEN</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label>FIRMA Y SELLO DEL MEDICO EXAMINADOR</label>
 </asp:TableCell>
										</asp:TableRow>
										 <asp:TableRow>
 <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <asp:TextBox TextMode="Date" id="txtFechaExamen" CssClass="form-control" runat="server"/>
 </asp:TableCell>
  <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
	 <label></label>
 </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</div>
									  <div class="col-md-2"></div>
								  </div><br />
								  
								  <div class="row text-center">
									  <div class="col-md-4 col-md-offset-4">
										  <asp:Button Text="GUARDAR" CssClass="btn btn-block btn-info" runat="server" id="btnGuardar" OnClick="GuardarRegistro"/>
									  </div>
								  </div>

							  </div>
						</div>
					</div>
				</div>
			</div>


			<!-- Impresion  -->
			<div class="container" id="zonaPrint" style="opacity:0; width:100%;">
				<script>
                    function imprimir() {
                        w = window.open();
                        w.document.write($('#zonaPrint').html());
                        w.print();
                        w.close();
                    }
					</script>
				
				<!-- Tab1-->
				<div class="row">
					<label>Empresa: <asp:Label id="lblEmpresa" runat="server"/></label><br />
					<label>Dirección: <asp:Label id="lblDireccion" runat="server"></asp:Label></label><br />
					<label>Nro de Historia: <asp:Label id="lblNumero" runat="server"></asp:Label></label><br />
					<label>Tipo de Examen: <asp:Label id="lblTipodeExamen" runat="server"></asp:Label></label><br />
					<label>Fecha: <asp:Label id="lblFecha" runat="server"></asp:Label></label><br />
					
					<div class="row text-center">
						<div class="col-md-10">
						<asp:Table runat="server" id="Table1" CssClass="table">
						<asp:TableHeaderRow>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" ColumnSpan="5">
								<label>HISTORIA CLINICA</label>
							</asp:TableHeaderCell>
						</asp:TableHeaderRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Oficios desempeñados Empresa/ Area</label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Ocupacion/ Oficio</label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Tiempo Años/ Meses</label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Ha presentado una enfermedad causada por el trabajo</label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow  >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>1. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center">
								<label>
									Si____  No_____
								</label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>2. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CssClass="text-center" RowSpan="6">
								<label>
									
								</label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>2. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>3. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>4. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>5. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
						</asp:TableRow>
						<asp:TableRow >
							<asp:TableHeaderCell  BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label>Actual. </label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
							<asp:TableHeaderCell BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
								<label></label>
							</asp:TableHeaderCell>
						</asp:TableRow>
					</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
				</div>
				
				<!-- Tab2 -->
				<div class="row">
					<div class="row text-center">
						<asp:Label id="Label10" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
						<asp:Label id="Label19" runat="server" Text="Para Ser llenado por el Médico"></asp:Label>
					</div>
					<br />
					
					<!-- Tabla #1 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table runat="server" style="margin:0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="3">
										<label>EXAMEN FÍSICO</label>
									</asp:TableCell>
								</asp:TableRow>

								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Peso: <asp:Label CssClass="txt-corto" runat="server" id="txtPeso1"></asp:Label> Kg.</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estatura: <asp:Label CssClass="txt-corto" runat="server" id="txtEstatura1"></asp:Label> Mts. IMC:<asp:Label CssClass="txt-corto" runat="server" id="txtIMC1"></asp:Label></label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>P.A:
 <asp:Label CssClass="txt-corto" runat="server" id="txtPA11"></asp:Label>
 /
 <asp:Label CssClass="txt-corto" runat="server" id="txtPA22"></asp:Label> 
 Pulso:
 <asp:Label CssClass="txt-corto" runat="server" id="txtPulso1"></asp:Label> 
 F.R:
 <asp:Label runat="server" id="txtFR1" CssClass="txt-corto"></asp:Label></label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Estado General:<asp:Label runat="server" id="txtEstadoGen1"></asp:Label>.
 Diestro:<asp:Label runat="server" id="ddlDiestro1"></asp:Label> . 
 Zurdo:<asp:Label runat="server" id="ddlZurdo1"></asp:Label>. 
 Ambidiestro:<asp:Label runat="server" id="ddlAmbidiestro1"></asp:Label>.</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado Mental:<asp:Label CssClass="txt-corto" runat="server" id="txtEstadoMental1"></asp:Label></label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #2 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table16" runat="server" style="margin:0 auto;" CssClass="table">
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="7">
										<label>CABEZA</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del cuerpo</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del cuerpo</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell ColumnSpan="2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Craneo</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbCraneo1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescCraneo1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mucosa Nasal</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbMucosa1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescMuco1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="5">
										<label>Ojos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Párpados</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbParpados1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescPar1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Senos Paranasales</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbSenos1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescSenos1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Conjuntiva</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbConjuntiva1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescConjun1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Paladar</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbPaladar1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescPala1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Escleras</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbEscaleras1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescEscl1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mucosa Oral</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbMucosaOral1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescMucoOral1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Córnea</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbCornea1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescCornea1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Dentadura</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbDentadura1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescDent1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Iris Pupila</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbIris1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescIris1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Amigdalas</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbAmigdalas1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
										<asp:TextBox runat="server" id="txtDescAmig1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label></label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Pabellones</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbPabellones1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
										<asp:TextBox runat="server" id="txtDescPabe1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Faringe</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbFaringe1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"> 
										<asp:TextBox runat="server" id="txtDescFarin1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
										<label>Oidos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Conductos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbConductos1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescConduc1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lengua</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbLengua1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescLengua1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Timpanos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbTimpanos1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescTimpano1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #3 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table17" runat="server" style="margin:0 auto;" CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4">
										<label>Agudeza Visual</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Carta Snellen</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>OD</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>OI</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>AO</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cercana</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtODCercana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtOICercana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtAOCercana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lejana</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtODLejana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtOILejana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>20/<asp:TextBox runat="server" id="txtAOLejana1" CssClass="txt-corto"/></label>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #4 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table18" runat="server" style="margin:0 auto; " CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cuello</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Tórax</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Inspección</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInspeccion1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescInsp1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Auscultación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbAuscultacion1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescAusc1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Palpación</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbPalpacion1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescPalp1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Murmullo Vesicular</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbrMulloVesicular1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescMurmu1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Adenopatias</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbAdenopatias1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescAdeno1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Ruidos Cardiacos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRuidosCardiacos1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescRuidos1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Glándula Tiroides</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbGlandulaTiroides1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescGalnd1" TextMode="MultiLine"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Soplos</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbSoplos1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescSoplos1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #5 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table19" runat="server" style="margin:0 auto; " CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" Width="400px">
										<label>Abdomen</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Parte del Cuerpo</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Estado</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Descripción</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
										<asp:TextBox runat="server" id="txtDescAbdomen1" TextMode="MultiLine" PlaceHolder="Descripcion" Rows="9" Columns="70"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Mamas</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbMamas1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescMamas1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Piel</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbPiel1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescPiel1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Uñas</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbUnas1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescUnas1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="4" RowSpan="3">
										<asp:TextBox runat="server" id="txtDescHerina1" TextMode="MultiLine" PlaceHolder="Hernia.." Rows="9" Columns="70"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cicatrices</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbCicatrices1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescCicat1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Tatuajes</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbTatuajes1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescTatu1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Varices</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbVarices1" runat="server"/>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:TextBox runat="server" id="txtDescVarices1" TextMode="MultiLine"/>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #6 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table20" runat="server" style="margin:0 auto; " CssClass="table">
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
										<label>Arcos de Movimiento</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
										<label>Miembros Superiores</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3">
										<label>Arcos de Movimiento</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="8">
										<label>Miembros Inferiores</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Hombro</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Codo</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Muñeca</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Dedos</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Cadera</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Rodilla</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Pie</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ColumnSpan="2">
										<label>Dedos</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>D</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>I</label>
									</asp:TableCell>
								</asp:TableRow>
								<asp:TableRow CssClass="text-center">
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Flexión</label>
									</asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Flexión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="f161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Extensión</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="e161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Abducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ab161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad2111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Aducción</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ad161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Interna</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="ri161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Rotación Externa</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="re161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Pronación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="p161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Supinación</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="s161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow CssClass="text-center">
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm1111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm21"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm31"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm41"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm51"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm61"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm71"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm81"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <label>Fuerza Muscular</label>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm91"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm101"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm111"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm121"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm131"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm141"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm151"></asp:CheckBox>
 </asp:TableCell>
 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
	 <asp:CheckBox runat="server" id="fm161"></asp:CheckBox>
 </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #7 -->
					 <div class="row">
						 <div class="col-md-10">
							 <asp:Table id="Table21" runat="server" style="margin:0 auto;" CssClass="table">
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="2">
										 <label>Arcos de Movimiento</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Cervical</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Dorso Lumbar</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Dolor</label>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Estado</label>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Flexión</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbFlexionCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbFlexionDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbFlexionDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Extensión</label>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbExtensionCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbExtensionDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbExtensionDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Rotación Derecha</label>
									 </asp:TableCell>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotDerCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotDerDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotDerDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Rotación Izquierda</label>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotIzqCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotIzqDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbRotIzqDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Inclinacion Lateral Derecha</label>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatDerCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatDerDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatDerDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
								 
								 <asp:TableRow>
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										 <label>Inclinacion Lateral Izquierda</label>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatIzqCervical1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatIzqDorsoLumbar1" runat="server"/>
									 </asp:TableCell>
									 
									 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbInlLatIzqDolor1" runat="server"/>
									 </asp:TableCell>
								 </asp:TableRow>
							 </asp:Table>
						 </div>
						 <div class="col-md-2"></div>
					 </div>
					<br />
					
					<!-- Tabla #8 -->
					<div class="row">
						<div class="col-md-10">
							<asp:Table id="Table22" runat="server" style="margin:0 auto;" CssClass="table">
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Escoliosis</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Cervical</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Dorsal</label>
									</asp:TableCell>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Lumbar</label>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Derecha</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbDerCervical1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbDerDorsal1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbDerLumbar1" runat="server"/>
									</asp:TableCell>
								</asp:TableRow>
								
								<asp:TableRow>
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<label>Izquierda</label>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbIzqCervical1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbIzqDorsal1" runat="server"/>
									</asp:TableCell>
									
									<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
										<asp:Label id="rbIzqLumbar1" runat="server"/>
									</asp:TableCell>
								</asp:TableRow>
							</asp:Table>
						</div>
						<div class="col-md-2"></div>
					</div>
					
					<div style="height:20px;"></div>
				</div>

				<!-- Tab3 -->
				<div class="row">
					<div class="row text-center">
						<asp:Label id="Label23" runat="server" Text="Registro de Historia Clinica Ocupacional"></asp:Label><br />
					</div>
					<br />
					
					<!-- Tabla #1 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table15" runat="server" style="margin:0 auto;" CssClass="table">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Diagnosticos</label>
								</asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="txtDiagnostico1"></asp:Label>
								</asp:TableCell>
							</asp:TableRow>
							
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #2 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table23" runat="server" style="margin:0 auto;" CssClass="table">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Recomendaciones</label>
								</asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
									<asp:Label runat="server" id="txtRecomendaciones1"></asp:Label>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #3 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table24" runat="server" style="margin:0 auto;" CssClass="table">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" RowSpan="3" Width="240px">
									<label>Uso de elementos de Proteccion recomendado para la labor asignada</label>
								</asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Ojos</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Oidos</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Cara</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Cabeza</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Respiracion</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Traje</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Otro (¿Cúal?)</label>
								</asp:TableCell>
							</asp:TableRow>
							 <asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="ojos1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="oidos1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="cara1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="cabeza1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="respiracion1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<asp:Label runat="server" id="traje1"></asp:Label>
								</asp:TableCell> 
								 <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
								   <asp:Label runat="server" id="otro1"></asp:Label>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #4 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table25" runat="server" style="margin:0 auto;" CssClass="table">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									
									<asp:RadioButtonList runat="server" id="rbElegible1">
										<asp:ListItem Text="Elegible" Value="Elegible"/>
										<asp:ListItem Text="Elegible con restricciones que no interfieren con su trabajo normal" Value="Elegible con restricciones que no interfieren con su trabajo normal"/>
										<asp:ListItem Text="Elegible con restricciones que difieren en su trabajo normal" Value="Elegible con restricciones que difieren en su trabajo normal"/>
										<asp:ListItem Text="No Elegible" Value="No Elegible"/>
									</asp:RadioButtonList>

								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #5 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table26" runat="server" style="margin:0 auto;" CssClass="table">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
									<label>Requiere rebicación:
										
										<asp:RadioButtonList runat="server" id="rbReubicacion1">
 <asp:ListItem Text="Si" Value="Si"/>
 <asp:ListItem Text="No" Value="No"/>
										</asp:RadioButtonList> 

										Restricciones</label>
								</asp:TableCell>
							</asp:TableRow>
							 <asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="800px">
									<asp:Label runat="server" id="txtRestricciones1"></asp:Label>
								</asp:TableCell> 
							</asp:TableRow>
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
					<br />
					
					<!-- Tabla #6 -->
					<div class="row">
						<div class="col-md-10">
						<asp:Table id="Table27" runat="server" style="margin:0 auto;" CssClass="table text-center">
							<asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label>FECHA DEL EXAMEN</label>
								</asp:TableCell>
								<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label>FIRMA Y SELLO DEL MEDICO EXAMINADOR</label>
								</asp:TableCell>
							</asp:TableRow>
							 <asp:TableRow>
								<asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<asp:Label TextMode="Date" id="txtFechaExamen1" runat="server"></asp:Label>
								</asp:TableCell>
								 <asp:TableCell BorderColor="Black" BorderStyle="Double" BorderWidth="1px" Width="400px">
									<label></label>
								</asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</div>
						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</ContentTemplate>
	</asp:updatepanel>
</asp:Content>