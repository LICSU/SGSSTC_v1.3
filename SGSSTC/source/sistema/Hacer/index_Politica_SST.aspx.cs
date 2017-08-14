﻿using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Politica_SST : System.Web.UI.Page
    {
        protected static Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                ddlYear = ListaAnho(ddlYear);
                cargarPolitica();
            }

        }
        public DropDownList ListaAnho(DropDownList DropDownList1)
        {
            DateTime anho = DateTime.Now;
            int anhoActual = Convert.ToInt32(anho.Year);

            ViewState["anho"] = string.Empty + anhoActual;

            for (int i = anhoActual; i >= 1950; i--)
            {
                DropDownList1.Items.Add(new System.Web.UI.WebControls.ListItem(string.Empty + i, string.Empty + i));
            }

            return DropDownList1;
        }
        public void cargarPolitica()
        {
            int idPolitica = GetterMax.PoliticaSST(ObjUsuario.Id_empresa);

            List<politica_sst> ListaPolitica = new List<politica_sst>();
            ListaPolitica = Getter.PoliticaSST(idPolitica);

            if (ListaPolitica.Count == 0)
            {
                txtCompromiso.Text = "No existen compromisos agregados";
                txtObjetivos.Text = "No existen objetivos agregados";
                txtAlcance.Text = "No existe alcance agregado";
            }
            else
            {
                foreach (var item in ListaPolitica)
                {
                    if (item.compromiso != null) { txtCompromiso.Text = item.compromiso; }
                    else { txtCompromiso.Text = "No existen compromisos agregados"; }

                    if (item.objetivos != null) { txtObjetivos.Text = item.objetivos; }
                    else { txtObjetivos.Text = "No existen objetivos agregados"; }

                    if (item.alcance != null) { txtAlcance.Text = item.alcance; }
                    else { txtAlcance.Text = "No existe alcance agregado"; }
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            politica_sst nuevo = new politica_sst()
            {
                id_empresa = ObjUsuario.Id_empresa,
                compromiso = txtCompromiso.Text,
                anho = Convert.ToInt32(ddlYear.SelectedValue),
                objetivos = txtObjetivos.Text,
                alcance = txtAlcance.Text
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

            if (ObjUsuario.Error)
            {
                Response.Redirect(Paginas.index_Politica_SST.Value);
            }
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            //int IdSucursal = ObjUsuario.Id_sucursal;
            //Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //  IdSucursal,
            //  "PoliticaSST_",
            //  "POLITICA DE SST",
            //  this);

            //#region cuerpo

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "AÑO"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "", "" + ddlYear.SelectedValue));

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "COMPROMISO DE LA EMPRESA"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, "1|1|1|1", 12, 1, txtCompromiso.Text));

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "EN TAL SENTIDO AL EMPRESA SE COMPROMETE A"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, "1|1|1|1", 12, 1, txtObjetivos.Text));

            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "ALCANCE DEL SST"));
            //DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCeldaHTML(DocumentoPDF.Item2, "1|1|1|1", 12, 1, txtAlcance.Text));
            //#endregion

            //ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, IdSucursal, this);
        }
    }
}