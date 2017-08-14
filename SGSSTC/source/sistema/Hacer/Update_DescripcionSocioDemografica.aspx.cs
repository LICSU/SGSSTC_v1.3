using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class Update_DescripcionSocioDemografica : System.Web.UI.Page
    {
        Utilidades objUtilidades = new Utilidades();
        protected static Model_UsuarioSistema ObjUsuario;
        protected static int idPerfil;

        #region string campos
        string TrabajadorID = string.Empty;
        string LugarNacimiento = string.Empty;
        string NivelEscolaridad = string.Empty;
        string AñosAprobados = string.Empty;
        string CabezaFamilia = string.Empty;
        string Hijos = string.Empty;
        string Responsabilidad = string.Empty;
        string Menores = string.Empty;
        string Social = string.Empty;
        string MotivoDes = string.Empty;
        string Vivienda = string.Empty;
        string Servicios = string.Empty;
        string SeguridadSocial = string.Empty;
        string Regimen = string.Empty;
        string NivelSisBen = string.Empty;
        string EPS = string.Empty;
        string Pensiones = string.Empty;
        string Fondo = string.Empty;
        string Riesgos = string.Empty;
        string ARP = string.Empty;
        string Empresa1 = string.Empty;
        string Empresa2 = string.Empty;
        string Empresa3 = string.Empty;
        string Area1 = string.Empty;
        string Area2 = string.Empty;
        string Area3 = string.Empty;
        string Cargo1 = string.Empty;
        string Cargo2 = string.Empty;
        string Cargo3 = string.Empty;
        string Años1 = string.Empty;
        string Años2 = string.Empty;
        string Años3 = string.Empty;
        string Estrato = string.Empty;
        string Meses1 = string.Empty;
        string Meses2 = string.Empty;
        string Meses3 = string.Empty;
        string Enfermedad1 = string.Empty;
        string Enfermedad2 = string.Empty;
        string Enfermedad3 = string.Empty;
        string TipoVivienda = string.Empty;
        string Industria = string.Empty;
        string Ruido = string.Empty;
        string Contaminacion = string.Empty;
        string Descripcion = string.Empty;
        #endregion

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            idPerfil = objUtilidades.descifrarCadena(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                Listas.EPS(ddlEps);
                Listas.AFP(ddlFondo);
                CargarUsuario();
            }
        }
        protected void CargarUsuario()
        {
            List<desc_socio> ListaDescSocio = new List<desc_socio>();
            ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(idPerfil));

            foreach (var item in ListaDescSocio)
            {
                #region bloque 1
                ddlTrabajador.Text = item.trabajador.primer_nombre + " " + item.trabajador.primer_apellido;
                txtLugar.Text = item.lugar_nac;
                string nivel_escolar = item.nivel_escolaridad;

                if (nivel_escolar != "Ninguno" && nivel_escolar != "Primaria Incompleta" && nivel_escolar != "Primaria Completa"
                    && nivel_escolar != "Secundaria Incompleta" && nivel_escolar != "Secundaria Completa" && nivel_escolar != "Tecnica"
                    && nivel_escolar != "Universitario" && nivel_escolar != "Diplomado" && nivel_escolar != "Especializacion"
                    && nivel_escolar != "Maestria" && nivel_escolar != "Doctorado" && nivel_escolar != "Otro")
                {
                    txtNivel.Text = nivel_escolar;
                    txtNivel.Visible = true;
                    txtAnhosApro.Enabled = true;
                }
                else if (nivel_escolar == "Ninguno")
                {
                    txtAnhosApro.Enabled = false;
                    txtNivel.Visible = false;
                    rblNivel.SelectedValue = nivel_escolar;
                }
                else
                {
                    rblNivel.SelectedValue = nivel_escolar;
                    txtNivel.Visible = false;
                    txtAnhosApro.Enabled = true;
                }

                txtAnhosApro.Text = item.años_aprob;
                rdlCabeza.SelectedValue = item.cabeza_fam;

                ddlHijos.SelectedValue = Convert.ToInt32(item.num_hijos).ToString();

                rblResponsabilidad.SelectedValue = item.repart_resp;

                ddlMenores.SelectedValue = Convert.ToInt32(item.menores_dep).ToString(); ;

                string condicion = item.cond_social;
                rblCondicion.SelectedValue = condicion;
                if (condicion == "Desplazado")
                {
                    phDesplazado.Visible = true;
                    rblMotivo.SelectedValue = item.mot_despl;
                }

                dblVivienda.SelectedValue = item.tipo_vivienda;

                string servicios = item.serv_pub;
                string[] vecServicios = servicios.Split(',');
                for (int i = 0; i < cblServicios.Items.Count; i++)
                {
                    for (int j = 0; j < vecServicios.Length; j++)
                    {
                        if (cblServicios.Items[i].Text == vecServicios[j])
                        {
                            cblServicios.Items[i].Selected = true;
                        }
                    }
                }
                dblTipoVivienda.SelectedValue = item.vivienda.Trim();
                rblIndustria.SelectedValue = item.industria.Trim();
                rblRuido.SelectedValue = item.ruido.Trim();
                rblContaminacion.SelectedValue = item.contaminacion.Trim();
                txtDescripcion.Text = item.descripcion.Trim();
                string seg_social = item.sist_seg_soc;
                dblSeguridad.SelectedValue = seg_social;
                if (seg_social == "Si")
                {
                    phRegimen.Visible = true;
                    string regimen = item.reg_afiliacion;
                    rblRegimen.SelectedValue = regimen;
                    if (regimen == "Subsidiado")
                    {
                        phRegimen2.Visible = true;
                    }
                    phRegimen3.Visible = true;
                    //txtEps.Text = ListaDescSocio.eps.nombre;
                }
                string pensiones = item.afi_sssp;
                rblPensiones.SelectedValue = pensiones;
                if (pensiones == "Si")
                {
                    phPensiones1.Visible = true;
                    //txtFondo.Text = ListaDescSocio.fondo;
                }
                rblEstrato.SelectedValue = item.estrato.Trim();
                #endregion

                #region bloque2
                int contador = 0;
                foreach (var item1 in item.empleo_anterior)
                {
                    contador++;
                    string empresa = item1.empresa;
                    if (empresa != string.Empty)
                    {
                        if (contador == 1)
                        {
                            txtEmpresa1.Text = empresa;
                            txtArea1.Text = item1.area;
                            txtCargo1.Text = item1.cargo;
                            txtAños1.Text = item1.años;
                            txtMeses1.Text = item1.meses;
                            txtEnfermadades1.Text = item1.enfermedades;
                        }
                        else if (contador == 2)
                        {
                            txtEmpresa2.Text = empresa;
                            txtArea2.Text = item1.area;
                            txtCargo2.Text = item1.cargo;
                            txtAños2.Text = item1.años;
                            txtMeses2.Text = item1.meses;
                            txtEnfermadades2.Text = item1.enfermedades;
                        }
                        else if (contador == 3)
                        {
                            txtEmpresa3.Text = empresa;
                            txtArea3.Text = item1.area;
                            txtCargo3.Text = item1.cargo;
                            txtAños3.Text = item1.años;
                            txtMeses3.Text = item1.meses;
                            txtEnfermadades3.Text = item1.enfermedades;
                        }
                    }
                }
                #endregion
            }

        }

        protected bool validarCampos()
        {
            bool resultado = true;

            LugarNacimiento = txtLugar.Text;
            NivelEscolaridad = string.Empty;
            AñosAprobados = string.Empty;

            if (rblNivel.SelectedValue == "Otro")
            {
                NivelEscolaridad = txtNivel.Text;
                AñosAprobados = txtAnhosApro.Text;
                if (NivelEscolaridad == string.Empty || AñosAprobados == string.Empty)
                {
                    resultado = false;
                }
            }
            else if (rblNivel.SelectedValue == "Ninguno")
            {
                NivelEscolaridad = "Ninguno";
            }
            else
            {
                NivelEscolaridad = rblNivel.SelectedValue;
                AñosAprobados = txtAnhosApro.Text;
                if (NivelEscolaridad == string.Empty || AñosAprobados == string.Empty)
                {
                    resultado = false;
                }
            }

            CabezaFamilia = rdlCabeza.SelectedValue;
            Hijos = ddlHijos.SelectedValue;
            Responsabilidad = rblResponsabilidad.SelectedValue;
            Menores = ddlMenores.SelectedValue;
            Social = rblCondicion.SelectedValue;

            if (Social == "Desplazado")
            {
                if (rblMotivo.SelectedValue != "Otro")
                {
                    MotivoDes = rblMotivo.SelectedValue;
                }
                else
                {
                    MotivoDes = txtOtroMotivo.Text;
                    if (MotivoDes == string.Empty)
                    {
                        resultado = false;
                    }
                }
            }

            if (dblVivienda.SelectedValue != "Otro")
            {
                Vivienda = dblVivienda.SelectedValue;
            }
            else
            {
                Vivienda = txtOtroVivienda.Text;
                if (Vivienda == string.Empty)
                {
                    resultado = true;
                }
            }
            for (int i = 0; i < cblServicios.Items.Count; i++)
            {
                if (cblServicios.Items[i].Selected)
                {
                    Servicios += cblServicios.Items[i].Text + ",";
                }
            }
            SeguridadSocial = dblSeguridad.SelectedValue;

            if (SeguridadSocial == "Si")
            {
                Regimen = rblRegimen.SelectedValue;
                if (Regimen == "Subsidiado")
                {
                    NivelSisBen = rblNivelSisben.SelectedValue;
                }
                EPS = ddlEps.SelectedValue;
                if (EPS == string.Empty)
                {
                    resultado = false;
                }
            }
            Pensiones = rblPensiones.SelectedValue;

            if (Pensiones == "Si")
            {
                Fondo = ddlFondo.SelectedValue;
            }

            Estrato = rblEstrato.SelectedValue;
            Empresa1 = txtEmpresa1.Text;
            Empresa2 = txtEmpresa2.Text;
            Empresa3 = txtEmpresa3.Text;
            Area1 = txtArea1.Text;
            Area2 = txtArea2.Text;
            Area3 = txtArea3.Text;
            Cargo1 = txtCargo1.Text;
            Cargo2 = txtCargo2.Text;
            Cargo3 = txtCargo3.Text;
            Años1 = txtAños1.Text;
            Años2 = txtAños2.Text;
            Años3 = txtAños3.Text;
            Meses1 = txtMeses1.Text;
            Meses2 = txtMeses2.Text;
            Meses3 = txtMeses3.Text;
            Enfermedad1 = txtEnfermadades1.Text;
            Enfermedad2 = txtEnfermadades2.Text;
            Enfermedad3 = txtEnfermadades3.Text;
            TipoVivienda = dblTipoVivienda.SelectedValue;

            if (TipoVivienda == "Otro")
            {
                TipoVivienda = txtTipoVivienda.Text;
                if (TipoVivienda == string.Empty)
                {
                    resultado = false;
                }
            }
            Industria = rblIndustria.SelectedValue;
            Ruido = rblRuido.SelectedValue;
            Contaminacion = rblContaminacion.SelectedValue;
            Descripcion = txtDescripcion.Text;

            return resultado;
        }
        protected void EditarRegistro(object sender, EventArgs e)
        {
            if (validarCampos())
            {
                int id_fondo = 0, id_eps = 0;
                if (Fondo != string.Empty)
                {
                    id_fondo = Convert.ToInt32(Fondo);
                }
                if (EPS != string.Empty)
                {
                    id_eps = Convert.ToInt32(EPS);
                }

                GrupoLiEntities contexto = new GrupoLiEntities();

                desc_socio Edit = contexto.desc_socio.SingleOrDefault(b => b.id_desc_socio == idPerfil);
                if (Edit != null)
                {
                    Edit.lugar_nac = LugarNacimiento;
                    Edit.nivel_escolaridad = NivelEscolaridad;
                    Edit.años_aprob = AñosAprobados;
                    Edit.cabeza_fam = CabezaFamilia;
                    Edit.num_hijos = Hijos;
                    Edit.repart_resp = Responsabilidad;
                    Edit.menores_dep = Menores;
                    Edit.cond_social = Social;
                    Edit.mot_despl = MotivoDes;
                    Edit.tipo_vivienda = Vivienda;
                    Edit.serv_pub = Servicios;
                    Edit.sist_seg_soc = SeguridadSocial;
                    Edit.reg_afiliacion = Regimen;
                    Edit.nivel_sisben = NivelSisBen;
                    Edit.id_eps = id_eps;
                    Edit.afi_sssp = Pensiones;
                    Edit.id_afp = id_fondo;
                    Edit.afi_riesgo = Riesgos;
                    Edit.estrato = Estrato;
                    Edit.vivienda = TipoVivienda;
                    Edit.industria = Industria;
                    Edit.ruido = Ruido;
                    Edit.contaminacion = Contaminacion;
                    Edit.descripcion = Descripcion;
                }

                ObjUsuario.Error = CRUD.Edit_Fila(contexto, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);

                Modal.Validacion(this, ObjUsuario.Error, "Edit");

                if (ObjUsuario.Error)
                {
                    #region  GUARDAR EMPLEOS ANTERIORES...

                    limpiarCampos();

                    List<desc_socio> ListaDescSocio = new List<desc_socio>();
                    ListaDescSocio = Getter.DescripcionSociodemografica(Convert.ToInt32(ViewState["DescID"]));

                    foreach (var itemDesc in ListaDescSocio)
                    {
                        int contador = 0;
                        foreach (var item in itemDesc.empleo_anterior)
                        {
                            contador++;
                            string empresa = item.empresa;
                            if (contador == 1)
                            {
                                #region empresa1
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo1 = new empleo_anterior()
                                    {
                                        empresa = Empresa1,
                                        area = Area1,
                                        cargo = Cargo1,
                                        años = Años1,
                                        meses = Meses1,
                                        enfermedades = Enfermedad1,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo1, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = Empresa1;
                                        Edit1.area = Area1;
                                        Edit1.cargo = Cargo1;
                                        Edit1.años = Años1;
                                        Edit1.meses = Meses1;
                                        Edit1.enfermedades = Enfermedad1;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                #endregion
                            }
                            else if (contador == 2)
                            {
                                #region empresa2
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo2 = new empleo_anterior()
                                    {
                                        empresa = Empresa2,
                                        area = Area2,
                                        cargo = Cargo2,
                                        años = Años2,
                                        meses = Meses2,
                                        enfermedades = Enfermedad2,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo2, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = Empresa2;
                                        Edit1.area = Area2;
                                        Edit1.cargo = Cargo2;
                                        Edit1.años = Años2;
                                        Edit1.meses = Meses2;
                                        Edit1.enfermedades = Enfermedad2;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                #endregion

                            }
                            else if (contador == 3)
                            {
                                #region empresa3
                                if (empresa == string.Empty)
                                {
                                    empleo_anterior nuevo3 = new empleo_anterior()
                                    {
                                        empresa = Empresa3,
                                        area = Area3,
                                        cargo = Cargo3,
                                        años = Años3,
                                        meses = Meses3,
                                        enfermedades = Enfermedad3,
                                        id_desc_socio = Convert.ToInt32(ViewState["DescID"])
                                    };
                                    ObjUsuario.Error = CRUD.Add_Fila(nuevo3, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                else
                                {
                                    GrupoLiEntities contexto1 = new GrupoLiEntities();
                                    int idEmpleoAnt = item.id_empleos_ant;
                                    empleo_anterior Edit1 = contexto.empleo_anterior.SingleOrDefault(b => b.id_empleos_ant == idEmpleoAnt);
                                    if (Edit != null)
                                    {
                                        Edit1.empresa = Empresa3;
                                        Edit1.area = Area3;
                                        Edit1.cargo = Cargo3;
                                        Edit1.años = Años3;
                                        Edit1.meses = Meses3;
                                        Edit1.enfermedades = Enfermedad3;
                                    }
                                    ObjUsuario.Error = CRUD.Edit_Fila(contexto1, ObjUsuario.Id_usuario, HttpContext.Current.Request.Url.AbsoluteUri);
                                }
                                #endregion
                            }
                        }
                    }

                    Modal.Validacion(this, ObjUsuario.Error, "Edit");
                    limpiarCampos();

                    Response.Redirect(Paginas.index_DescripcionSocioDemografica.Value); 
                    #endregion
                }
            }
        }
        private void limpiarCampos()
        {
            txtLugar.Text = string.Empty;
            txtNivel.Text = string.Empty;
            txtAnhosApro.Text = string.Empty;
        }
        #endregion

        #region eventos
        protected void rblNivel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblNivel.SelectedValue == "Otro")
                txtNivel.Visible = true;
            else
                txtNivel.Visible = false;

            if (rblNivel.SelectedValue != "Ninguno")
                txtAnhosApro.Enabled = true;
            else
                txtAnhosApro.Enabled = false;
        }
        protected void rblCondicion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblCondicion.SelectedValue == "Desplazado")
                phDesplazado.Visible = true;
            else
                phDesplazado.Visible = false;
        }
        protected void rblMotivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblMotivo.SelectedValue == "Otro")
                txtOtroMotivo.Visible = true;
            else
                txtOtroMotivo.Visible = false;
        }
        protected void dblVivienda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblVivienda.SelectedValue == "Otro")
                txtOtroVivienda.Visible = true;
            else
                txtOtroVivienda.Visible = false;
        }
        protected void dblSeguridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblSeguridad.SelectedValue != "Si")
            {
                phRegimen.Visible = false;
            }
            else
            {
                phRegimen.Visible = true;
            }
        }
        protected void rblRegimen_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblRegimen.SelectedValue == "Contributivo")
            {
                phRegimen2.Visible = false;
                phRegimen3.Visible = true;
            }
            else
            {
                phRegimen2.Visible = true;
                phRegimen3.Visible = true;
            }
        }
        protected void rblPensiones_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblPensiones.SelectedValue != "Si")
            {
                phPensiones1.Visible = false;
            }
            else
            {
                phPensiones1.Visible = true;
            }
        }
        protected void dblTipoVivienda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dblTipoVivienda.SelectedValue == "Otro")
            {
                txtTipoVivienda.Visible = true;
            }
            else
            {
                txtTipoVivienda.Visible = false;
            }
        }
        #endregion
    }
}