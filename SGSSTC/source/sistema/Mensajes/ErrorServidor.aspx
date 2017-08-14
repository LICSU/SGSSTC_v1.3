<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeFile="ErrorServidor.aspx.cs" Inherits="source_sistema_Mensajes_ErrorServidor" %>

<%@ Register Src="~/source/WebUserControl/ucHeader.ascx" TagPrefix="uch" TagName="ucHeader" %>
<%@ Register Src="~/source/WebUserControl/ucFooter.ascx" TagPrefix="ucf" TagName="ucFooter" %>
<%@ Register Src="~/source/WebUserControl/ucMsjModal.ascx" TagPrefix="ucm" TagName="ucMsjModal" %>
<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>

<uch:ucHeader runat="server" id="ucHeader"/>
<form id="form1" runat="server">

    <div class="error-page">
        <h2 class="headline text-red">500</h2>
        <div class="error-content">
            <h3><i class="fa fa-warning text-red"></i>Oops! Hubo un error inesperado!.</h3>
            <p>
                Nuestro equipo trabaja en reparar este error.
                Mientras tanto , ud puede <a href="../MenuPrincipal/index.aspx">Regresar al panel principal</a>.
            </p>
        </div>
    </div>
    <!-- /.error-page -->

</form>

<ucf:ucFooter runat="server" id="ucFooter"/>
