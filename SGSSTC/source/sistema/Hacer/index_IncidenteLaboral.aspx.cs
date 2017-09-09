using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Verificar
{
    public partial class index_IncidenteLaboral : Page
    {
        private  Utilidades objUtilidades = new Utilidades();
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phAgregar.Visible = BoolEmpSuc.Item2;
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;
            phArea.Visible = true;


            DateTime fechaActual = DateTime.Now;
            ViewState["FechaInicio"] = fechaActual.ToString("dd-MM-yyy");
            ViewState["FechaFin"] = fechaActual.AddMonths(1).ToString("dd-MM-yyy");

            if (!IsPostBack)
            {
                ViewState["area"] = "0";
                txtFechaInicio.Text = fechaActual.ToString("yyyy-MM-dd");
                txtFechaFin.Text = fechaActual.AddMonths(1).ToString("yyyy-MM-dd");
                LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Listas.Empresa(ddlEmpresa);
            }
            else
            {
                Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Area_Sucursal(ddlArea, ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Incidente_General(
                GridView1,
                IdEmpresa,
                IdSucursal,
                string.Empty + ViewState["area"],
                string.Empty + ViewState["search"],
                string.Empty + ViewState["FechaInicio"],
                " " + ViewState["FechaFin"]);

        }
        #endregion

        #region acciones
        protected void btn_Agregar(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_IncidenteLaboral.Value);
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            Respuesta tabla = new Respuesta();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            LlenarGridView();
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
        }
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }
        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            if (fuComunicado.FileName != string.Empty)
            {
                string ruta = Utilidades.GuardarArchivo(fuComunicado, hdfIDEsc.Value + "ArchivoIncidente", "~/source/archivos/incidentes/");

                GrupoLiEntities contexto = new GrupoLiEntities();
                int id_Acc = Convert.ToInt32(hdfIDEsc.Value);
                at_it_el_pa Edit = contexto.at_it_el_pa.SingleOrDefault(b => b.id_at_it_el_pa == id_Acc);

                if (Edit != null)
                {
                    Edit.documento_comunicado = ruta;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario,
                    HttpContext.Current.Request.Url.AbsoluteUri);

            }

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }
        protected void btPrint_Click(object sender, EventArgs e)
        {
            //List<at_it_el_pa> ListAccidentes = new List<at_it_el_pa>();
            //ListAccidentes = Getter.Accidente(Convert.ToInt32(string.Empty + ViewState["Imprimir"]));

            //foreach (var item in ListAccidentes)
            //{
            //    int IdSucursal = item.trabajador.puesto_trabajo.area.id_sucursal;
            //    Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //        IdSucursal,
            //        "ComunicadoIncidente_",
            //        "",
            //        this);

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Sucursal"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Fecha Incidente"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Hora Incidente"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.trabajador.puesto_trabajo.area.sucursal.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.fecha_accidente.Value.ToString("yyyy-MM-dd")));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.hora_accidente.Value.ToString("hh:mm:ss")));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Trabajador"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Area"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Puesto de Trabajo"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido));
            //    if (item.id_area == 0)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", "Ninguno"));
            //    }
            //    else
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.area.nombre));
            //    }
            //    if (item.id_puesto == 0)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", "Ninguno"));
            //    }
            //    else
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", item.puesto_trabajo.nombre));
            //    }

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Sitio donde se presentó el caso."));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Breve descripción de los hechos"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "", item.sitio));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "", item.descripcion));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "CAUSAS INMEDIATAS - Condiciones Inseguras"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", item.condiciones_inseguras));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "CAUSAS INMEDIATAS - Actos Inseguros"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", item.actos_inseguros));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "CAUSAS BÁSICAS - Factores del Trabajo"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", item.factores_inseguros));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "CAUSAS BÁSICAS - Factores Personales"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", item.factores_personales));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "Magnitud del Evento"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Días de incapacidad"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Días cargados."));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Días perdidos por ausencia del trabajo"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", string.Empty + item.dias_incapacidad));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", string.Empty + item.dias_cargados));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", string.Empty + item.dias_perdidos_ausencia));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Días perdidos por actividad restringida"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Sin Tiempo Perdido"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Tipo de enfermedad"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", string.Empty + item.dias_perdidos_restingido));
            //    if (Convert.ToString(item.dias_no_perdidos) == "true")
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", "Si"));
            //    }
            //    else
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", "No"));
            //    }

            //    string tipoEnf = "";
            //    if (Convert.ToString(item.tipo_enfermedad) == "A") { tipoEnf = "Enfermedades en la piel"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "B") { tipoEnf = "Enfermedades respiratorias"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "C") { tipoEnf = "Envenenamiento"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "D") { tipoEnf = "Enfermedades debidas a agentes físicos"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "E") { tipoEnf = "Enfermedades producidas por traumas repetitivos"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "F") { tipoEnf = "Otras enfermedades osteomusculares"; }
            //    else if (Convert.ToString(item.tipo_enfermedad) == "G") { tipoEnf = "Demás enfermedades profesionales"; }

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", tipoEnf));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "COMUNICADO A TRABAJADORES"));

            //    List<trabajador> ListaTrabajador = new List<trabajador>();
            //    ListaTrabajador = Getter.Trabajador(0, 0, IdSucursal);

            //    foreach (var item1 in ListaTrabajador)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Nombre y Apellido"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Cedula"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Firma"));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 4, 1, "", item1.primer_nombre + " " + item1.primer_apellido));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 4, 1, "", item1.cedula));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 4, 1, "", " "));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 4, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 4, 1, "", " "));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 4, 1, "", " "));
            //    }


            //    ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
            //}
        }
        #endregion

        #region Exportar listas
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void incializarExports()
        {
            LlenarGridView();
            GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            GridView1.Columns[7].Visible = false;
        }
        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToWord(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToExcel(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            incializarExports();
            ManageFiles.ExportToPdf(this, GridView1, "Accidente_Laboral", "Lista de Accidentes Laborales");
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id");
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));

                Response.Redirect(Paginas.View_Incidente.Value+"?id=" + hdfIDDel.Value);
            }
            else if (e.CommandName.Equals("Imprimir"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id");
                hdfIDDel.Value = objUtilidades.cifrarCadena(Convert.ToString(hdfIDDel.Value));
                Response.Redirect(Paginas.View_Accidente.Value+"?id=" + hdfIDDel.Value + "&Print=si");
            }
            else if (e.CommandName.Equals("Comunicado"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hImprimir.Value = (gvrow.FindControl("id") as Label).Text;
                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }
            else if (e.CommandName.Equals("Eliminar"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id");
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Subir"))
            {
                hdfIDEsc.Value = Utilidades.GetIdFila(GridView1, e, "id");
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
            }
            else if (e.CommandName.Equals("scan"))
            {
                hplComunicado.NavigateUrl = Utilidades.GetIdFila(GridView1, e, "lbComunicado");

                Modal.registrarModal("VerDocModal", "VerDocModalModalScript", this);
            }
            else if (e.CommandName.Equals("Ver"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id");
            }
            else if (e.CommandName.Equals("Editar"))
            {
                string id = Utilidades.GetIdFila(GridView1, e, "id");
                id = objUtilidades.cifrarCadena(id);

                Response.Redirect(Paginas.Update_Incidentes.Value+"?id=" + id);
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();

        }
        #endregion

        #region filtros
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            int _id = 0;
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                _id = Convert.ToInt32(ddlSucursal.SelectedValue);
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                Listas.Area_Sucursal(ddlArea, _id);
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
            }
            else
            {
                ViewState["empresa"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedValue != string.Empty)
            {
                ViewState["area"] = ddlArea.SelectedValue;
            }
            else
            {
                ViewState["area"] = "0";
            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtSearch.Text != string.Empty)
            {
                ViewState["search"] = txtSearch.Text;
            }
            else
            {
                ViewState["search"] = string.Empty;
            }

            LlenarGridView();
        }
        protected void txtFechaInicio_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaInicio.Text != string.Empty)
            {
                ViewState["FechaInicio"] = txtFechaInicio.Text;
            }
            else
            {
                ViewState["FechaInicio"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void txtFechaFin_TextChanged(object sender, EventArgs e)
        {
            if (txtFechaFin.Text != string.Empty)
            {
                ViewState["FechaFin"] = txtFechaFin.Text;
            }
            else
            {
                ViewState["FechaFin"] = string.Empty;
            }
            LlenarGridView();
        }
        #endregion
    }
}