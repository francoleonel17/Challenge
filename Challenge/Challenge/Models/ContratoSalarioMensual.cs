using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Challenge.Models
{
    public class ContratoSalarioMensual : Contrato
    {        
        public ContratoSalarioMensual(decimal salario)
        {
            this.Salario = salario;
        }

        public override decimal Calcular(decimal salario)
        {
            this.Salario = salario;

            this.SalarioAnual = salario * 12;

            return SalarioAnual;

        }
    }
}