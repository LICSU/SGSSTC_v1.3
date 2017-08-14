using Capa_Datos;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_EvaluacionesPuestos : System.Web.UI.Page
    {
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        Tuple<bool, bool> BoolEmpSuc;
        int id_Puesto;

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            if (!IsPostBack)
            {
                LlenarGridView();
            }
        }
        private void LlenarGridView()
        {
            id_Puesto = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            Tabla.EvaluacionPuesto(GridView1, id_Puesto);
        }

        #endregion

        #region acciones
        protected void MostrarModalImprimir(object sender, EventArgs e)
        {
            Modal.registrarModal("printModal", "printModalScript", this);
        }

        protected void btPrint_Click(object sender, EventArgs e)
        {
            //List<evaluacion_riesgo> Lista_EvaRiesgo = new List<evaluacion_riesgo>();
            //Lista_EvaRiesgo = Getter.EvaluacionRiesgo(Convert.ToInt32(ViewState["Imprimir"]));

            //foreach (var itemEvaRiesgo in Lista_EvaRiesgo)
            //{
            //    ViewState["id_Puesto"] = Convert.ToInt32(itemEvaRiesgo.identificacion_puesto.id_puesto);

            //    Tuple<Document, PdfPTable> DocumentoPDF = ManageFiles.PdfParte1(
            //    itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.id_sucursal,
            //    "EvaluacionRiesgos_",
            //    "",
            //    this);

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Puesto de Trabajo"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Area"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Descripcion del Puesto"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemEvaRiesgo.identificacion_puesto.puesto_trabajo.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.nombre));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemEvaRiesgo.identificacion_puesto.puesto_trabajo.descripcion));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "IDENTIFICACIÓN DEL PELIGRO"));
            //    foreach (var itemFactor in itemEvaRiesgo.identificacion_puesto.identificacion_peligro.factor_identificacion)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Tipo de Riesgo"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Factor de Riesgo"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemFactor.factor_riesgo.tipo_riesgo.nombre));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemFactor.factor_riesgo.nombre));

            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Posibles Consecuencias"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Tiempo de Exposición"));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemFactor.consecuencias));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", itemFactor.tiempo_exposicion));
            //    }

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "EVALUACIÓN DEL RIESGO"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Medidas en la Fuente"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Medidas en el Medio"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Medidas en el Individuo"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemEvaRiesgo.control_fuente));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemEvaRiesgo.control_medio));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 4, 1, "", itemEvaRiesgo.control_individuo));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Responsable del SGSST"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Fecha de Evaluación"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "", itemEvaRiesgo.nombre_responsable));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "", Convert.ToDateTime(itemEvaRiesgo.fecha_evaluacion).ToString("dd/MM/yyyy")));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Nivel de Deficiencia"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 8, 1, "azul", "Interpretación del Nivel de Deficiencia"));

            //    string nivel = string.Empty;
            //    string interpretacion = string.Empty;

            //    #region nivel deficiencia
            //    if (itemEvaRiesgo.nivel_deficiencia == "10")
            //    {
            //        nivel = "Muy alto";
            //        interpretacion = "Se ha(n) detectado peligro(s) que determina(n) como posible la generación de incidentes, o la eficacia del conjunto de medidas preventivas existentes respecto al riesgo es nula no existe, o ambos";
            //    }
            //    else if (itemEvaRiesgo.nivel_deficiencia == "6")
            //    {
            //        nivel = "Alto";
            //        interpretacion = "Se ha(n) detectado algún(os) peligro(s) que puede(n) dar lugar a consecuencias significativa(s) o la eficacia del conjunto de medidas preventivas existentes es baja, o ambos";
            //    }
            //    else if (itemEvaRiesgo.nivel_deficiencia == "2")
            //    {
            //        nivel = "Medio";
            //        interpretacion = "Se han detectado peligros que pueden dar lugar a consecuencias poco significativa(s) o de menor importancia, o la eficacia del conjunto de medidas preventivas existentes es moderada, o ambos.";
            //    }
            //    else if (itemEvaRiesgo.nivel_deficiencia == "0")
            //    {
            //        nivel = "Bajo";
            //        interpretacion = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado.";
            //    }

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", nivel));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 8, 1, "", interpretacion));

            //    #endregion

            //    #region nivel exposicion
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "azul", "Nivel de Exposición"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 8, 1, "azul", "Interpretacion del Nivel de Exposición"));
            //    if (itemEvaRiesgo.nivel_exposicion == "4")
            //    {
            //        nivel = "Continua";
            //        interpretacion = "La situación de exposición se presenta sin interrupción o varias veces con tiempo prolongado durante la jornada laboral.";
            //    }
            //    else if (itemEvaRiesgo.nivel_exposicion == "3")
            //    {
            //        nivel = "Frecuente";
            //        interpretacion = "La situación de exposición se presenta varias veces durante la jornada laboral por tiempos cortos.";
            //    }
            //    else if (itemEvaRiesgo.nivel_exposicion == "2")
            //    {
            //        nivel = "Ocasional";
            //        interpretacion = "La situación de exposición se presenta alguna vez durante la jornada laboral y por un periodo de tiempo corto.";
            //    }
            //    else if (itemEvaRiesgo.nivel_exposicion == "1")
            //    {
            //        nivel = "Esporádica";
            //        interpretacion = "La situación de exposición se presenta de manera eventual.";
            //    }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", nivel));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 8, 1, "", interpretacion));

            //    #endregion

            //    #region nivel probabilidad
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Nivel de Probabilidad"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "azul", "Interpretacion del Nivel de Probabilidad"));

            //    int probabilidad = Convert.ToInt32(itemEvaRiesgo.nivel_probabilidad);

            //    if (probabilidad >= 24 && probabilidad <= 40) { interpretacion = "Situación deficiente con exposición continua.Normalmente la materialización del riesgo ocurre con frecuencia"; }
            //    else if (probabilidad >= 10 && probabilidad <= 20) { interpretacion = "Situación deficiente con exposición frecuente u ocasional, o bien situación muy deficiente con exposición ocasional o esporádica.La materialización del riesgo es posible que suceda varias veces durante la vida laboral "; }
            //    else if (probabilidad >= 6 && probabilidad <= 8) { interpretacion = "Situación deficiente con exposición esporádica, o bien situación mejorable con exposición continuada o frecuente. Es posible que suceda el daño alguna vez."; }
            //    else if (probabilidad >= 2 && probabilidad <= 4) { interpretacion = "Situación mejorable con exposición ocasional o esporádica, o situación sin anomalía destacable con cualquier nivel de exposición.No es esperable que se materialice el riesgo, aunque puede ser concebible."; }
            //    else if (probabilidad == 0) { interpretacion = "No se ha destacado anomalía destacable alguna, o la eficacia del conjunto de medidas preventivas existentes es alta, o ambos. El riesgo esta controlado."; }

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "", itemEvaRiesgo.nivel_probabilidad));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "", interpretacion));

            //    #endregion

            //    #region nivel consecuencia
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Nivel de Consecuencia"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "azul", "Interpretacion del Nivel de Consecuencia"));

            //    if (itemEvaRiesgo.nivel_consecuencia == "100")
            //    {
            //        nivel = "Mortal o catastrófico(M)";
            //        interpretacion = "Muerte(s)";
            //    }
            //    else if (itemEvaRiesgo.nivel_consecuencia == "60")
            //    {
            //        nivel = "Muy grave (MG)";
            //        interpretacion = "Lesiones o enfermedades graves irreparables (incapacidad permanente, parcial o invalidez).";
            //    }
            //    else if (itemEvaRiesgo.nivel_consecuencia == "25")
            //    {
            //        nivel = "Grave (G)";
            //        interpretacion = "Lesiones o enfermedades con incapacidad laboral temporal (ILT).";
            //    }
            //    else if (itemEvaRiesgo.nivel_consecuencia == "10")
            //    {
            //        nivel = "Leve (L)";
            //        interpretacion = "Lesiones o enfermedades que no requieren incapacidad.";
            //    }
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "", itemEvaRiesgo.nivel_consecuencia));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "", interpretacion));

            //    #endregion

            //    #region nivel riesgo
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Nivel de Riesgo"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "azul", "Interpretacion del Nivel de Riesgo"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "", itemEvaRiesgo.nivel_riesgo));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 9, 1, "", itemEvaRiesgo.interpretacion_nivel_riesgo));

            //    #endregion


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "Aceptabilidad de Riesgo"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 12, 1, "", itemEvaRiesgo.aceptabilidad_riesgo));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "CRITERIOS PARA ESTABLECER CONTROLES"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Planta"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Contratista"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Visitantes"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 3, 1, "azul", "Total"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", string.Empty + itemEvaRiesgo.planta));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", string.Empty + itemEvaRiesgo.contratistas));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", string.Empty + itemEvaRiesgo.visitantes));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 3, 1, "", string.Empty + itemEvaRiesgo.total));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Peor Consecuencia"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Existencia Requisito Legal"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.peor_consecuencia));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.existencia_requisito_legal));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "MEDIDAS DE INTERVENCIÓN"));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Eliminación"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Sustitución"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.eliminación));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.sustitución));

            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Controles de Ingeniería"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Controles Administrativos"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.controles_ingenieria));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", string.Empty + itemEvaRiesgo.controles_administrativos));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 6, 1, "azul", "Fecha de Ejecucion"));
            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "L", "1|1|1|1", 6, 1, "", Convert.ToDateTime(itemEvaRiesgo.fecha_ejecucion).ToString("dd/MM/yyyy")));


            //    DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 12, 1, "azul", "EQUIPOS DE PROTECCIÓN PERSONAL DEL PUESTO DE TRABAJO"));
            //    int contadorEpp = 1;
            //    foreach (var itemEpp in itemEvaRiesgo.identificacion_puesto.puesto_trabajo.puesto_trabajo_epp)
            //    {
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", "Epp N° " + contadorEpp));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", "Nombre: " + itemEpp.epp.nombre));
            //        DocumentoPDF = Tuple.Create(DocumentoPDF.Item1, ManageFiles.AddCelda(DocumentoPDF.Item2, 1, "H4", "C", "1|1|1|1", 4, 1, "", "Tipo de Epp: " + itemEpp.epp.tipo_epp.nombre));
            //        contadorEpp++;
            //    }

            //    ManageFiles.PdfPart2(DocumentoPDF.Item1, DocumentoPDF.Item2, itemEvaRiesgo.identificacion_puesto.puesto_trabajo.area.id_sucursal, this);
            //}
        }
        protected void EliminarRegistro(object sender, EventArgs e)
        {
            evaluacion_riesgo tabla = new evaluacion_riesgo();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Convert.ToInt32(hdfIDDel.Value), ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
            LlenarGridView();
            Modal.Validacion(this, ObjUsuario.Error, "Delete");
        }
		
        #endregion

        #region acciones grid
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LlenarGridView();
        }
        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                string id_EvaRiesgo = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;

                id_EvaRiesgo = objUtilidades.cifrarCadena(id_EvaRiesgo);

                Response.Redirect(Paginas.View_EvaluacionPuesto.Value + "?id=" + id_EvaRiesgo);
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hdfIDDel.Value = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;
                Modal.registrarModal("deleteModal", "DeleteModalScript", this);
            }
            else if (e.CommandName.Equals("print"))
            {
                int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
                GridViewRow gvrow = GridView1.Rows[RowIndex];
                hImprimir.Value = (gvrow.FindControl("id_evaluacion_riesgo") as Label).Text;
                ViewState["Imprimir"] = string.Empty + hImprimir.Value;

                Modal.registrarModal("PrintListaModal", "PrintListaModalScript", this);

            }

        }
        #endregion
    }
}