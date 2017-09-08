﻿using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    public class Modal
    {
        public Modal()
        {

        }

        public static void MostrarMsjModal(string msj, string tipo, Page _page)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("function MostrarMsjModal(message, title, ccsclass) {" +
                "var vIcoModal = document.getElementById('icoModal');" +
                "vIcoModal.className = ccsclass;" +
                "$('#lblMsjTitle').html(title);" +
                "$('#lblMsjModal').html(message);" +
                "$('#Msjmodal').modal('show');" +
                "}");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(_page, typeof(Page), "myScriptModal", sb.ToString(), false);


            string sTitulo = "Información";
            string sCcsClase = "fa fa-check fa-2x text-info";
            switch (tipo)
            {
                case "ERR":
                    sTitulo = "ERROR";
                    sCcsClase = "fa fa-times fa-2x text-danger";
                    break;
                case "ADV":
                    sTitulo = "ADVERTENCIA";
                    sCcsClase = "fa fa-exclamation-triangle fa-2x text-warning";
                    break;
                case "EXI":
                    sTitulo = "ÉXITO";
                    sCcsClase = "fa fa-check fa-2x text-success";
                    break;
            }

            ScriptManager.RegisterStartupScript(_page, typeof(Page), "MostrarMsjModal", "MostrarMsjModal('" + msj.Replace("'", "").Replace("\r\n", " ") + "','" + sTitulo + "','" + sCcsClase + "');", true);
        }

        public static void registrarModal(string nombreModal, string nombreScript, Page _page)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#" + nombreModal + "').modal({ show: true });");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(_page, typeof(Page), nombreScript, sb.ToString(), false);
        }
        public static void CerrarModal(string nombreModal, string nombreScript, Page _page)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#" + nombreModal + "').click();");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(_page, typeof(Page), nombreScript, sb.ToString(), false);
        }
        
        public static void Redireccionar(string URL, Page _page)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#btnRedirect').click(function() {" +
                "window.location.replace('"+ URL + "');" +
                "});");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(_page, typeof(Page), "ScriptRedirect", sb.ToString(), false);
        }

        public static void ModalAddRegistroExito(Page _page)
        {
            MostrarMsjModal("Registro agregado con Éxito", "EXI", _page);
        }
        public static void ModalEditRegistroExito(Page _page)
        {
            MostrarMsjModal("Registro actualizado con Éxito", "EXI", _page);
        }
        public static void ModalDeleteRegistroExito(Page _page)
        {
            MostrarMsjModal("Registro eliminado con Éxito", "EXI", _page);
        }

        public static void ModalAddRegistroFallo(Page _page)
        {
            MostrarMsjModal("Error al insertar el registro", "ERR", _page);
        }
        public static void ModalEditRegistroFallo(Page _page)
        {
            MostrarMsjModal("Error al actualizar el registro", "ERR", _page);
        }
        public static void ModalDeleteRegistroFallo(Page _page)
        {
            MostrarMsjModal("Error al eliminar el registro", "ERR", _page);
        }

        public static void Validacion(Page _page, bool bError, string tipo)
        {
            if (tipo == "Add")
            {
                if (bError == true)
                {
                    ModalAddRegistroExito(_page);
                }
                else
                {
                    ModalAddRegistroFallo(_page);
                }
            }
            else if (tipo == "Edit")
            {
                if (bError == true)
                {
                    ModalEditRegistroExito(_page);
                }
                else
                {
                    ModalEditRegistroFallo(_page);
                }
            }
            else if (tipo == "Delete")
            {
                if (bError == true)
                {
                    ModalDeleteRegistroExito(_page);
                }
                else
                {
                    ModalDeleteRegistroFallo(_page);
                }
            }

        }



        public static void MostrarAlertaEdit(PlaceHolder phAlerta, HtmlGenericControl divAlerta, Label lbAlerta,bool bError)
        {
            phAlerta.Visible = true;

            if (bError)
            {
                divAlerta.Attributes.Add("class", "alert alert-dismissable alert-success fade in");
                lbAlerta.Text = "Se actualizó el registro exitosamente";
            }
            else
            {
                divAlerta.Attributes.Add("class", "alert alert-dismissable alert-danger fade in");
                lbAlerta.Text = "No Se actualizó el registro";
            }
        }
    }
}
