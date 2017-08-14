using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.EvaluacionInicial
{
    public partial class index_PorcentajeCapacitacion : Page
    {
        #region variable
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        Table _table;
        int nroTrabajadores = 0;
        int cantGestiones = 0;
        DateTime fechaInicial;
        DateTime fechaFinal;
        int IdEmpresa = 0;
        int IdSucursal = 0;
        Tuple<bool, bool> BoolEmpSuc;
        #endregion

        #region Index
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            fechaInicial = Convert.ToDateTime("01/01/" + DateTime.Now.Year);
            fechaFinal = Convert.ToDateTime("31/12/" + DateTime.Now.Year);

            if (!IsPostBack)
            {
                CargarListas();
            }
            else
            {
                foreach (var ctlID in Page.Request.Form.AllKeys)
                {
                    if (ctlID != null)
                    {
                        Control c = Page.FindControl(ctlID) as Control;
                        if (c is DropDownList)
                        {
                            if (c.ClientID.Contains("ddlSucursal"))
                            {
                                //Buscar cantidad de trabajadores para la empresa seleccionada.(Cantidad de filas)
                                nroTrabajadores = GetterCantidad.Trabajadores_CantidadesByCapacidad(Convert.ToInt32(ddlSucursal.SelectedValue), fechaInicial, fechaFinal);
                                //Cantidad de gestiones laborales de tipo capacitacion para el trimestre seleccionado (Cantidad de Columnas)

                                cantGestiones = GetterCantidad.GestionLaboralByFecha(fechaInicial, fechaFinal);
                                if (nroTrabajadores > 0)
                                {
                                    crearTabla(nroTrabajadores, cantGestiones);
                                    phAsistenciasLeyenda.Visible = true;
                                }
                                else
                                {
                                    phAsistenciasLeyenda.Visible = false;

                                    _table = new Table();
                                    _table.ID = "tbCapacitacion";
                                    _table.CssClass = "table";
                                    TableHeaderRow _header_fila = new TableHeaderRow();
                                    //Nro
                                    TableHeaderCell _header_celda = new TableHeaderCell();
                                    _header_celda.Text = "No Existen trabajadores asociados a ninguna gestion laboral.";
                                    _header_celda.CssClass = "text-center";
                                    _header_fila.Cells.Add(_header_celda);
                                    _table.Rows.Add(_header_fila);
                                    pnTablaCapacitacion.Controls.Add(_table);
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void CargarListas()
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
                ViewState["sucursal"] = ObjUsuario.Id_sucursal;
                cargarDatos();

                //Buscar cantidad de trabajadores para la empresa seleccionada.(Cantidad de filas)

                nroTrabajadores = GetterCantidad.Trabajadores_CantidadesByCapacidad(ObjUsuario.Id_sucursal, fechaInicial, fechaFinal);
                //Cantidad de gestiones laborales de tipo capacitacion para el trimestre seleccionado (Cantidad de Columnas)

                cantGestiones = GetterCantidad.GestionLaboralByFecha(fechaInicial, fechaFinal);
                if (nroTrabajadores > 0)
                {
                    crearTabla(nroTrabajadores, cantGestiones);
                    phAsistenciasLeyenda.Visible = true;
                }
                else
                {
                    _table = new Table();
                    _table.ID = "tbCapacitacion";
                    _table.CssClass = "table";
                    TableHeaderRow _header_fila = new TableHeaderRow();
                    //Nro
                    TableHeaderCell _header_celda = new TableHeaderCell();
                    _header_celda.Text = "No Existen trabajadores asociados a ninguna gestion laboral.";
                    _header_celda.CssClass = "text-center";
                    _header_fila.Cells.Add(_header_celda);
                    _table.Rows.Add(_header_fila);
                    pnTablaCapacitacion.Controls.Add(_table);
                }

            }
        }
        #endregion

        #region filtros
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                ViewState["empresa"] = ddlEmpresa.SelectedValue;
                Listas.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
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
                cargarDatos();
            }
        }
        #endregion

        #region CargarDatos
        protected void cargarDatos()
        {
            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            IdEmpresa = IdEmpSuc.Item1;
            IdSucursal = IdEmpSuc.Item2;

            List<empresa> empresa_list = Getter.Empresa(Convert.ToInt32(IdEmpresa));
            List<sucursal> sucursal_list = Getter.Sucursal(Convert.ToInt32(IdSucursal));

            phEncabezado.Visible = true;
        }

        protected void crearTabla(int cantTrab, int cantGest)
        {
            #region variables
            int totalAsis = 0;
            int totalClases = 0;
            _table = new Table();
            _table.ID = "tbCapacitacion";
            _table.CssClass = "table";
            TableHeaderRow _header_fila = new TableHeaderRow();
            #endregion

            #region  Nro
            TableHeaderCell _header_celda = new TableHeaderCell();
            _header_celda.Text = "Nro";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            #region Trabajador
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "NOMBRE";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            #region Cedula
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "DOCUMENTO DE IDENTIDAD";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            Tuple<int, int> IdEmpSuc = Getter.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);

            IdEmpresa = IdEmpSuc.Item1;
            IdSucursal = IdEmpSuc.Item2;

            List<gestion_laboral> gestion_lista = new List<gestion_laboral>();
            gestion_lista = Getter.GesLabCap(fechaInicial, fechaFinal, IdEmpresa, IdSucursal);

            foreach (gestion_laboral gl in gestion_lista)
            {
                #region  Temas
                _header_celda = new TableHeaderCell();
                string titulo = gl.descripcion + " <br/> " + Convert.ToDateTime(gl.fecha).ToString("dd-MM-yyy");
                _header_celda.Text = titulo.ToUpper();
                _header_celda.CssClass = "text-center";
                _header_fila.Cells.Add(_header_celda);
                _table.Rows.Add(_header_fila);
                #endregion
            }

            #region Cedula
            _header_celda = new TableHeaderCell();
            _header_celda.Text = "CANTIDAD HORAS ACUMULADAS";
            _header_celda.CssClass = "text-center";
            _header_fila.Cells.Add(_header_celda);
            _table.Rows.Add(_header_fila);
            #endregion

            TableCell _fila = new TableCell();
            TableRow _columna = new TableRow();
            int trabajador = 1, gestion = 1, sumatoria = 0;

            List<trabajador> trab_lista = Getter.TrabajadoresByCapacidad(Convert.ToInt32(IdSucursal), fechaInicial, fechaFinal);
            foreach (trabajador trab in trab_lista)
            {
                sumatoria = 0;
                _columna = new TableRow();
                _columna.ID = "columna" + trabajador;
                _fila = new TableCell();
                _fila.Text = "" + (trabajador);
                _columna.Cells.Add(_fila);
                _table.Rows.Add(_columna);

                _fila = new TableCell();
                _fila.Text = string.Empty + (trab.primer_nombre + ' ' + trab.primer_apellido);
                _fila.Attributes.Add("style", "white-space: nowrap;");
                _columna.Cells.Add(_fila);
                _table.Rows.Add(_columna);

                _fila = new TableCell();
                _fila.Text = string.Empty + (trab.cedula);
                _columna.Cells.Add(_fila);
                _table.Rows.Add(_columna);

                foreach (gestion_laboral gl in gestion_lista)
                {
                    _fila = new TableCell();
                    _fila.ID = "fila" + gestion + "_" + trabajador;
                    int id_trabajador = trab.id_trabajador;

                    List<trabajador_gestion> trab_gest_lis = Getter.TrabajadorInGestion(id_trabajador, gl.id_ges_lab);

                    foreach (var item in trab_gest_lis)
                    {
                        if (item.asistencia.Contains("SI"))
                        {
                            _fila.Text = gl.cant_horas.ToString();
                            sumatoria += Convert.ToInt32(gl.cant_horas);
                            totalAsis++;
                        }
                        else
                        {
                            if (item.asistencia.Contains("Justificada"))
                            {
                                _fila.Text = "Justificada";
                                _fila.BackColor = System.Drawing.Color.SkyBlue;
                            }
                            else if (item.asistencia.Contains("Injustificada"))
                            {
                                _fila.Text = "Injustificada";
                                _fila.BackColor = System.Drawing.Color.Tomato;
                            }

                        }
                        totalClases++;
                    }

                    _fila.CssClass = "text-center";
                    _columna.Cells.Add(_fila);
                    gestion++;
                }
                _table.Rows.Add(_columna);

                _fila = new TableCell();
                _fila.Text = sumatoria.ToString();
                _fila.CssClass = "text-center";
                _fila.BackColor = System.Drawing.Color.DarkSeaGreen;
                _columna.Cells.Add(_fila);
                _table.Rows.Add(_columna);
                trabajador++;
            }
            pnTablaCapacitacion.Controls.Add(_table);

            //Generar la grafica
            int totalIna = totalClases - totalAsis;
            lblTotalInasistencias.Text = totalIna.ToString();
            lblTotalAsistencias.Text = totalAsis.ToString();
            Double[] yAsistencias = { 0, 0 };
            yAsistencias[0] = totalIna;
            yAsistencias[1] = totalAsis;
            String[] xCadenas = { "Inasistencia", "Asistencia" };
            graficoAsistencia.Series["asistencias"].Label = "#PERCENT{P0}";
            graficoAsistencia.Series["asistencias"].Points.DataBindXY(xCadenas, yAsistencias);
        }
        #endregion
    }
}