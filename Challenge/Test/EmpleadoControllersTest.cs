using System;
using System.Collections.Generic;
using Challenge.Controllers;
using DAL;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test
{
    [TestClass]
    public class EmpleadoControllersTest
    {
        [TestMethod]
        public void TestListEmpleadosGet()
        {
            EmpleadoController ControllerEmp = new EmpleadoController();

            List<Empleado> empleados = ControllerEmp.Get();

            Assert.IsNotNull(empleados);
        }

        [TestMethod]
        public void TestUnEmpleadoGet()
        { 
            EmpleadoController ControllerEmp = new EmpleadoController();

            Empleado empleado = ControllerEmp.Get(1,"40694512");

            Assert.IsNotNull(empleado);

        }


    }
}
