using System;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    public class Utilidades_GridView
    {
        public static string DevolverIdRow(GridViewCommandEventArgs e, GridView GridView1)
        {
            int RowIndex = Convert.ToInt32((e.CommandArgument).ToString());
            return Utilidades.GetIdFila(GridView1, e, "id");
        }
    }
}
