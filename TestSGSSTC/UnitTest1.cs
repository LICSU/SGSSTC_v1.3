using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TestSGSSTC
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            const string login = "AdminGrupoLi";
            const string clave = "GrupoLi_1234";
            const string resultado_Esperado = "1|1";

            string resultado_Prueba = Capa_Datos.Getter.ValidarUsuario(login, clave);

            Assert.AreEqual(resultado_Esperado, resultado_Prueba);


        }
    }
}
