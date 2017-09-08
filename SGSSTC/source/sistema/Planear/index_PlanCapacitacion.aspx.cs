using System;
using Capa_Datos;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_PlanCapacitacion : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
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

        }
        #endregion

        #region filtro
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
                ViewState["sucursal"] = "0";
            }
            else
            {
                ViewState["empresa"] = "0";
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                ViewState["sucursal"] = ddlSucursal.SelectedValue;
                phInformacion.Visible = true;
            }
            else
            {
                ViewState["sucursal"] = "0";
            }
        }
        #endregion

        #region Imprimir
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            genereDocumento();
        }
        protected void genereDocumento()
        {
            //int IdSucursal = ObjUsuario.Id_sucursal;
            //Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //  IdSucursal,
            //  "PlanCapacitacion_",
            //  "PLAN DE CAPACITACION",
            //  this);

            //#region cuerpo

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "N°"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "TIPO DE RIESGO DE ACUERDO CON LAS CARACTERISTICAS DE LA EMPRESA"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "TEMA DE CAPACITACIÓN"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "DURACIÓN"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "POBLACIÓN OBJETO"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "PONENTE O INSTRUCTOR"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "DOCUMENTO DE  SOPORTE"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "FECHA PROGRAMADA"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 2, 1, "azul", "ESTATUS DE CUMPLIMIENTO"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "LUGAR O SITIO"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 2, "azul", "OBSERVACIONES"));

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "SI"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 1, 1, "azul", "NO"));


            //TableCell _cell;
            //TextBox _textbox;
            //RadioButton _radio;
            //string _valor = string.Empty;
            //bool band = true;
            //#region Mecanicos (1 al 13)
            //for (int pregunta = 1; pregunta <= 13; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 13, "", "Mecánicos"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Físicos (14 al 18)
            //for (int pregunta = 14; pregunta <= 18; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 5, "", "Físicos"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Disergonómicos (19 al 32)
            //for (int pregunta = 19; pregunta <= 32; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 14, "", "Disergonómicos"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Químicos (33 al 43)
            //for (int pregunta = 33; pregunta <= 43; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 11, "", "Químicos"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Eléctricos (44 al 47)
            //for (int pregunta = 44; pregunta <= 47; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 4, "", "Eléctricos"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Psicosocial Desarrollo Conductual (48 al 98)
            //for (int pregunta = 48; pregunta <= 98; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 51, "", "Psicosocial Desarrollo Conductual"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Prevención de Emergencias (99 al 124)
            //for (int pregunta = 99; pregunta <= 124; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 26, "", "Prevención de Emergencias"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion

            //band = true;
            //#region Generales (125 al 150)
            //for (int pregunta = 125; pregunta <= 150; pregunta++)
            //{
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + pregunta));
            //    if (band)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 26, "", "Generales"));
            //        band = false;
            //    }
            //    _cell = (TableCell)pnDatos.FindControl("preg" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _cell.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("durP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("pobP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ponP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("docP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("fecP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _radio = (RadioButton)pnDatos.FindControl("siP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _radio = (RadioButton)pnDatos.FindControl("noP" + pregunta);
            //    if (_radio.Checked) { _valor = "X"; } else { _valor = string.Empty; }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _valor));
            //    _textbox = (TextBox)pnDatos.FindControl("lugP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //    _textbox = (TextBox)pnDatos.FindControl("ObsP" + pregunta);
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 0, "H4", "C", "1|1|1|1", 1, 1, "", "" + _textbox.Text));
            //}
            //#endregion
            //#endregion

            //ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
        }
		
        #endregion
    }
}