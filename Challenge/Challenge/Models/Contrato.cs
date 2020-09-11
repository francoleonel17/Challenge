using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Challenge.Models
{
    public abstract class Contrato
    {       

        public decimal Salario { get; set; }

        public decimal SalarioAnual { get; set; }

        public abstract decimal Calcular(decimal salario);
    }
}