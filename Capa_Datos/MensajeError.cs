
namespace Capa_Datos
{
    public class MensajeError
    {
        private MensajeError(string value) { Value = value; }

        public string Value { get; set; }

        public static MensajeError EXito_Add_Empresa
        { get { return new MensajeError("Se Creó la Empresa correctamente"); } }
        public static MensajeError Error_Add_Empresa
        { get { return new MensajeError("Error al Crear Empresa"); } }

        public static MensajeError Error_Add_Default_Estatus
        { get { return new MensajeError("Error al Crear Estatus Default"); } }

        public static MensajeError Error_Add_Default_Categoria
        { get { return new MensajeError("Error al Crear Categorias Default"); } }

        public static MensajeError Error_Add_Default_Ciiu
        { get { return new MensajeError("Error al Crear Codigo Ciiu"); } }

        public static MensajeError Error_Add_Default_TipoEpp
        { get { return new MensajeError("Error al Crear tipo de epp Default"); } }

        public static MensajeError Error_Add_Default_Epp
        { get { return new MensajeError("Error al Crear los Epp Default"); } }

        public static MensajeError Error_Add_Default_Sucursal
        { get { return new MensajeError("Error al Crear Sucursal Default"); } }

        public static MensajeError Error_Add_Default_Area
        { get { return new MensajeError("Error al Crear Area Default"); } }

        public static MensajeError Error_Add_Default_PuestoTrabajo
        { get { return new MensajeError("Error al Crear puesto Default"); } }

        public static MensajeError Error_Add_Default_Horario
        { get { return new MensajeError("Error al Crear Horario Default"); } }

        public static MensajeError Error_Add_Default_Trabajador
        { get { return new MensajeError("Error al Crear Trabajador Default"); } }

        public static MensajeError Error_Add_Default_Usuario
        { get { return new MensajeError("Error al Crear Usuario Default"); } }

        public static MensajeError Error_Add_Default_TipoDocumento
        { get { return new MensajeError("Error al Crear Tipo de documento Default"); } }

        public static MensajeError Error_Add_Default_Riesgos
        { get { return new MensajeError("Error al Crear la matriz de riesgo default"); } }

        public static MensajeError Error_Add_Normas_Sucursal
        { get { return new MensajeError("Error al Crear las Normas de la sucursal"); } }

        public static MensajeError Error_Add_Medidas_Sucursal
        { get { return new MensajeError("Error al Crear las Medidas de la sucursal"); } }

        public static MensajeError Error_Add_Default_Lista_Actividades
        { get { return new MensajeError("Error al Crear la Lsita de Actividades de la sucursal"); } }



        public static MensajeError Exito_Add_Trabajador
        { get { return new MensajeError("Se Agregó el Trabajador Correctamente"); } }
        public static MensajeError Exito_Add_PuestoTrabajo
        { get { return new MensajeError("Se Agregó el Puesto de Trabajo Correctamente"); } }
        public static MensajeError Exito_Add_Sucursal
        { get { return new MensajeError("Se Agregó la Sucursal Correctamente"); } }

        public static MensajeError Fallo_Add_PuestoTrabajo
        { get { return new MensajeError("No se Agregó el Puesto de Trabajo Correctamente"); } }
        public static MensajeError Fallo_Add_Trabajador
        { get { return new MensajeError("No se Agregó el Trabajador Correctamente"); } }

        public static MensajeError Exito_Edit_Trabajador
        { get { return new MensajeError("Se Actualizó el trabajador Correctamente"); } }
        public static MensajeError Exito_Edit_PuestoTrabajo
        { get { return new MensajeError("Se Actualizo el puesto de trabajo correctamente"); } }
        public static MensajeError Exito_Edit_Asistencia
        { get { return new MensajeError("Se Actualizó la Asistencia Correctamente"); } }

        public static MensajeError Fallo_Edit_PuestoTrabajo
        { get { return new MensajeError("No se Actualizo el puesto de trabajo"); } }
        public static MensajeError Fallo_Edit_Incidente
        { get { return new MensajeError("No se Actualizo el Incidente Laboral"); } }
        public static MensajeError Fallo_Edit_Accidente
        { get { return new MensajeError("No se Actualizo el Accidente Laboral"); } }
        public static MensajeError Fallo_Edit_Trabajador
        { get { return new MensajeError("No se Actualizo el trabajador"); } }
        public static MensajeError Fallo_Edit_Asistencia
        { get { return new MensajeError("No se Actualizo la Asistencia"); } }

        public static MensajeError Fallo_Delete_Area_Usuario
        { get { return new MensajeError("No puede eliminar esta área porque el usuario actual pertenece a ella."); } }
        public static MensajeError Fallo_Delete_Horario_Usuario
        { get { return new MensajeError("No puede eliminar este horario porque el usuario actual pertenece al mismo."); } }
        public static MensajeError Fallo_Delete_PuestoTrabajo_Usuario
        { get { return new MensajeError("No se puede eliminar el puesto de trabajo porque el usuario actual pertenece a él"); } }
        
        public static MensajeError Error_Existe_Puesto_Nombre
        { get { return new MensajeError("Ya existe un puesto de trabajo con ese nombre para la sucursal seleccionada."); } }
        public static MensajeError Error_Existe_Sucursal
        { get { return new MensajeError("Ya existe una sucursal con ese nombre para la empresa seleccionada."); } }
        public static MensajeError Error_Existe_Trabajador_Cedula
        { get { return new MensajeError("Ya existe un trabajador registrado con ese número de cédula."); } }
        public static MensajeError Error_Existe_Area_Nombre
        { get { return new MensajeError("Ya existe un área con ese nombre para la sucursal seleccionada."); } }


        public static MensajeError Validacion_Semanas_Año
        { get { return new MensajeError("Las semanas Inicio y Fin deben pertenecer al mismo año"); } }
        public static MensajeError Validacion_SemanaIni_Menor_SemanaFin
        { get { return new MensajeError("La semana inicio debe ser menor que la semana fin"); } }
    }
}
