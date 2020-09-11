using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Challenge.Models
{
    public class FactoryMethod
    {      

        public static Contrato CrearContrato(int idTipo, decimal salario)
        {
            switch (idTipo)
            {
                case 1:

                    return new ContratoSalarioPorHora(salario);

                case 2:

                    return new ContratoSalarioMensual(salario);

                default:

                    return null;
            }
        }

    }
}