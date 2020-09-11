using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using DAL;
using Newtonsoft.Json;

namespace Aplicacion.Controllers
{
    public class HomeController : Controller
    {  
        public ActionResult Index()
        {   
            return View();
        }        

        public async Task<ActionResult> _Tabla(string ident = null, string dato = null)
        {          

            var httpClient = new HttpClient();

            if (ident == "0" && dato == null)
            {
                var json = await httpClient.GetStringAsync("https://localhost:44352/api/Empleado");

                var empleados = JsonConvert.DeserializeObject<List<Empleado>>(json);

                ViewBag.CantReg = empleados.Count;

                return PartialView(empleados);
            }
            else
            {
                var json = await httpClient.GetStringAsync("https://localhost:44352/api/Empleado?identificacion=" + ident + "&dato=" + dato);

                List<Empleado> empleados = new List<Empleado>();

                Empleado empleado = JsonConvert.DeserializeObject<Empleado>(json);

                if (empleado != null)
                {
                    empleados.Add(empleado);
                }                               

                ViewBag.CantReg = empleados.Count;

                return PartialView(empleados);
            }       

        }        
    }
}