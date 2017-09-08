namespace Capa_Datos
{
    public class ComandosGrid
    {
        private ComandosGrid(string value) { Value = value; }

        public string Value { get; set; }
        
        public static ComandosGrid Editar { get { return new ComandosGrid("Editar"); } }
        public static ComandosGrid Eliminar { get { return new ComandosGrid("Eliminar"); } }
        public static ComandosGrid Consultar { get { return new ComandosGrid("Consultar"); } }
        public static ComandosGrid Upload { get { return new ComandosGrid("Upload"); } }
        public static ComandosGrid Download { get { return new ComandosGrid("Download"); } }



    }
}
