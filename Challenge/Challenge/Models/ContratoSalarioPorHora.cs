﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Challenge.Models
{
    public class ContratoSalarioPorHora : Contrato
    {    
      
        public ContratoSalarioPorHora(decimal salario)
        {
            this.Salario = salario;
        }

        public override decimal Calcular(decimal salario)
        {
            this.Salario = salario;

            this.SalarioAnual = 120 * salario * 12;

            return SalarioAnual;
        }
    }
}