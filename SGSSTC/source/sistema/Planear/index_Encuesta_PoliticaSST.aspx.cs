using Capa_Datos;
using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Encuesta_PoliticaSST : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region index principal
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phSucursal.Visible = BoolEmpSuc.Item2;


            if (!IsPostBack)
            {
                //LlenarGridView();
                CargarListas();
            }
        }
        private void CargarListas()
        {
            Listas.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);

            if (!BoolEmpSuc.Item1)
            {
                Listas.Sucursal(ddlSucursalAdd, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalGral, ObjUsuario.Id_empresa);
                Listas.Sucursal(ddlSucursalSubir, ObjUsuario.Id_empresa);
            }

            if (!BoolEmpSuc.Item2)
            {
                Listas.Trabajadores_Sucursal(ddlTrabajadorEsp, ObjUsuario.Id_sucursal);
                Listas.Trabajadores_Sucursal(ddlTrabajador, ObjUsuario.Id_sucursal);
            }
        }
        private void LlenarGridView()
        {
            int IdEmpresa = Getter.Set_IdEmpresa(ObjUsuario, Convert.ToInt32(ViewState["empresa"]));
            int IdSucursal = Getter.Set_IdSucursal(ObjUsuario, Convert.ToInt32(ViewState["sucursal"]));

            Tabla.Encuesta_PoliticaSST(
                GridView1,
                IdEmpresa,
                IdSucursal,
                Convert.ToInt32(string.Empty + ViewState["trabajador"])
                );
        }
        #endregion

        #region acciones

        protected void crearlistaGral(object sender, EventArgs e)
        {
        //    int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalGral);

        //    List<sucursal> ListaSucursal = new List<sucursal>();
        //    List<trabajador> ListaTrabajador = new List<trabajador>();

        //    ListaSucursal = Getter.Sucursal(ObjUsuario.Id_sucursal);
        //    ListaTrabajador = Getter.Trabajador(0, 0, ObjUsuario.Id_sucursal);

        //    Document pdfDoc = ManageFiles.InicializarPDF(ListaSucursal, this, "EncuestaPoliticaSST_", false);
        //    pdfDoc.Open();

        //    PdfPTable tablaPDF;

        //    string[] valores = {
        //    "¿Es de su Conocimiento la Política de Seguridad y Salud en el Trabajo de la Organización?",
        //    "¿Está publicado en Cartelera o en medios electrónicos el documento de la Política de Seguridad y Salud en el Trabajo de la Organización?",
        //    "¿Es concisa y está redactada con claridad?",
        //    "¿Está fechada y firmada por el representante legal de la Empresa?",
        //    "¿La Política es específica para la Empresa?",
        //    "¿ Es apropiada para la naturaleza de los peligros y el tamaño de la organización?",
        //    "¿Esta implícito en el Documento el compromiso de la alta dirección de la organización con la seguridad y la salud en el trabajo?",
        //    "¿La organización se compromete a Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua del SG-SST?",
        //    "¿Se compromete a cumplir la normatividad nacional vigente aplicable en materia de riesgos laborales?",
        //    "¿Se Compromete a mantener el bienestar físico y mental de todos los trabajadores?",
        //    "¿Se Compromete a establecer una cultura de prevención de Riesgos Laborales?",
        //    "¿La Polìtica contempla  las normas y responsabilidades a todos los niveles de la organización?",
        //    "¿Usted comprende las directrices descritas en la Política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted acata los lineamientos establecidos en la Política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted participa en la ejecución de la política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted Considera que la Política de Seguridad y Salud en el Trabajo complementa el logro de los objetivos de Seguridad y Salud en el Trabajo?",
        //    "¿Se realizan grupos de trabajo para escuchar las opiniones de los trabajadores y las necesidades en materia de seguridad y salud en el trabajo? para posibles actualizaciones de la Política de Seguridad y Salud en el Trabajo",
        //    "¿Es revisada como mínimo una vez al año y de ser necesario, actualizada con los cambios en materia de normatividad o por los requerimientos que surjan ?"
        //};

        //    foreach (var itemTrab in ListaTrabajador)
        //    {
        //        tablaPDF = new PdfPTable(12);
        //        tablaPDF.WidthPercentage = 100;

        //        ManageFiles.AddTitulo(pdfDoc, "C", "ENCUESTA SOBRE EL CONOCIMIENTO DE LA POLITICA DE SST");

        //        tablaPDF = ManageFiles.AddMembrete12(tablaPDF, ListaSucursal, ListaTrabajador.Count);

        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "N°");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "PREGUNTAS");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "SI");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "NO");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "OBSERVACIONES");

        //        for (int i = 0; i < 18; i++)
        //        {
        //            tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "", string.Empty + (i + 1));
        //            tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 4, 1, "", valores[i]);
        //            tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "", " ");
        //            tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 1, 1, "", " ");
        //            tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 5, 1, "", " ");
        //        }


        //        #region firma
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "TRABAJADOR AL QUE FUE COMUNICADO");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "FIRMA");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|0|1", 5, 1, "", string.Empty + itemTrab.primer_nombre + " " + itemTrab.primer_apellido);
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "1|1|0|1", 5, 1, "", " ");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "0|1|1|1", 5, 1, "", " ");
        //        tablaPDF = ManageFiles.AddCelda(tablaPDF, 1, "H4", "C", "0|1|1|1", 5, 1, "", " ");
        //        #endregion


        //        tablaPDF = ManageFiles.Footer(tablaPDF, ListaTrabajador.Count);

        //        pdfDoc.Add(tablaPDF);
        //        pdfDoc.NewPage();
        //    }

        //    pdfDoc.Close();
        //    Response.Write(pdfDoc);
        //    Response.End();
        }

        protected void Guardar(object sender, EventArgs e)
        {
        //    int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalAdd);
        //    Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
        //        IdSucursal,
        //        "EncuestaPoliticaSST_",
        //        "ENCUESTA SOBRE EL CONOCIMIENTO DE LA POLITICA DE SST",
        //        this);

        //    #region cuerpo

        //    string[] valores = {
        //    "¿Es de su Conocimiento la Política de Seguridad y Salud en el Trabajo de la Organización?",
        //    "¿Está publicado en Cartelera o en medios electrónicos el documento de la Política de Seguridad y Salud en el Trabajo de la Organización?",
        //    "¿Es concisa y está redactada con claridad?",
        //    "¿Está fechada y firmada por el representante legal de la Empresa?",
        //    "¿La Política es específica para la Empresa?",
        //    "¿ Es apropiada para la naturaleza de los peligros y el tamaño de la organización?",
        //    "¿Esta implícito en el Documento el compromiso de la alta dirección de la organización con la seguridad y la salud en el trabajo?",
        //    "¿La organización se compromete a Proteger la seguridad y salud de todos los trabajadores, mediante la mejora continua del SG-SST?",
        //    "¿Se compromete a cumplir la normatividad nacional vigente aplicable en materia de riesgos laborales?",
        //    "¿Se Compromete a mantener el bienestar físico y mental de todos los trabajadores?",
        //    "¿Se Compromete a establecer una cultura de prevención de Riesgos Laborales?",
        //    "¿La Polìtica contempla  las normas y responsabilidades a todos los niveles de la organización?",
        //    "¿Usted comprende las directrices descritas en la Política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted acata los lineamientos establecidos en la Política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted participa en la ejecución de la política de Seguridad y Salud en el Trabajo?",
        //    "¿Usted Considera que la Política de Seguridad y Salud en el Trabajo complementa el logro de los objetivos de Seguridad y Salud en el Trabajo?",
        //    "¿Se realizan grupos de trabajo para escuchar las opiniones de los trabajadores y las necesidades en materia de seguridad y salud en el trabajo? para posibles actualizaciones de la Política de Seguridad y Salud en el Trabajo",
        //    "¿Es revisada como mínimo una vez al año y de ser necesario, actualizada con los cambios en materia de normatividad o por los requerimientos que surjan ?"
        //};

        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "N°"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "PREGUNTAS"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "SI"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "NO"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "OBSERVACIONES"));

        //    for (int i = 0; i < 18; i++)
        //    {
        //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "", string.Empty + (i + 1)));
        //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", valores[i]));
        //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "", " "));
        //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "", " "));
        //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 5, 1, "", " "));
        //    }

        //    #region firma
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "TRABAJADOR AL QUE FUE COMUNICADO"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 5, 1, "azul", "FIRMA"));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 5, 1, "", string.Empty + ddlTrabajadorEsp.SelectedItem));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|0|1", 5, 1, "", " "));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 5, 1, "", " "));
        //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "0|1|1|1", 5, 1, "", " "));
        //    #endregion

        //    #endregion

        //    ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
        }

        protected void btnSubirArchivo(object sender, EventArgs e)
        {
            int IdEmpresa = ObjUsuario.Id_empresa;
            int IdSucursal = Getter.Set_IdSucursalDDl(ObjUsuario, ddlSucursalSubir);

            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + "_Encuesta_" + ddlTrabajadorSubir.SelectedValue, "~/source/archivos/encuesta_politicasst/");

            GrupoLiEntities contexto = new GrupoLiEntities();
            int idEncuesta = Convert.ToInt32(hdfIDEsc.Value);
            encuesta_politica Edit = contexto.encuesta_politica.SingleOrDefault(b => b.id_encuesta == idEncuesta);

            if (Edit != null)
            {
                Edit.ruta = _ruta;
            }

            ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario,
                HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.Validacion(this, ObjUsuario.Error, "Add");
            LlenarGridView();
        }

        protected void EliminarRegistro(object sender, EventArgs e)
        {
            encuesta_politica tabla = new encuesta_politica();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value),
                ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            Modal.Validacion(this, ObjUsuario.Error, "Delete");
            LlenarGridView();
        }

        protected void AgregarRegistro(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_EncuestaPoliticaSST.Value);
        }

        protected void btnAgregarObj_Click(object sender, EventArgs e)
        {
            Response.Redirect(Paginas.Create_Encuesta_ObjPoliticaSST.Value);
        }
        #endregion

        #region acciones grid
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Eliminar"))
            {
                hdfIDDel.Value = Utilidades.GetIdFila(GridView1, e, "id_encuesta");
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("Subir"))
            {
                hdfIDEsc.Value = Utilidades.GetIdFila(GridView1, e, "id_encuesta");
                Modal.registrarModal("EscaneadoModal", "EscaneadoModalScript", this);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        #endregion

        #region registrar modales
        protected void btnAgregarEsp_Onclick(object sender, EventArgs e)
        {
            phEspecifico.Visible = true;
            phGeneral.Visible = false;
        }
        protected void btnAgregarGral_Onclick(object sender, EventArgs e)
        {
            phGeneral.Visible = true;
            phEspecifico.Visible = false;
        }
        protected void btnSubir_Onclick(object sender, EventArgs e)
        {
            phEspecifico.Visible = false;
            phGeneral.Visible = false;
        }
        protected void btnDescargar_Onclick(object sender, EventArgs e)
        {
            Modal.registrarModal("IndexAddModal", "AddModalScript", this);
        }
        #endregion

        #region filtros
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                Listas.Trabajadores_Sucursal(ddlTrabajador, Convert.ToInt32(ddlSucursal.SelectedValue));
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
            LlenarGridView();
        }
        protected void ddlTrabajador_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTrabajador.SelectedValue != string.Empty)
            {
                ViewState["trabajador"] = ddlTrabajador.SelectedValue;
            }
            else
            {
                ViewState["trabajador"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void BuscarRegistro(object sender, EventArgs e)
        {
            if (txtSearch.Text != string.Empty)
            {
                ViewState["sWhere"] = txtSearch.Text;
            }
            else
            {
                ViewState["sWhere"] = string.Empty;
            }
            LlenarGridView();
        }
        protected void ddlSucursalAdd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalAdd.SelectedValue != string.Empty)
            {
                Listas.Trabajadores_Sucursal(ddlTrabajadorEsp, Convert.ToInt32(ddlSucursalAdd.SelectedValue));
            }
        }
        protected void ddlSucursalSubir_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursalSubir.SelectedValue != string.Empty)
            {
                Listas.Trabajadores_Sucursal(ddlTrabajadorSubir, Convert.ToInt32(ddlSucursalSubir.SelectedValue));
            }
        }
        #endregion
    }
}