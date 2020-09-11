using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Data.Entity;
using Challenge.Models;
using System;

namespace Challenge.Controllers
{
    public class EmpleadoController : ApiController
    {
        //GET: api/Empleado
        public List<Empleado> Get()
        {
            using (ChallengeEntities db = new ChallengeEntities())
            { 
                List<Empleado> empleados = db.Empleado.Where(e => e.FechaBaja == null).ToList();

                if(empleados.Count > 0 && empleados != null)
                {
                    Empleado empleado = new Empleado();

                    empleado.AsignarSalarioAnualEmpleados(empleados);
                }                

                return empleados;
            }
        }       

        // GET: api/Empleado?identificacion={identificacion}&dato={dato}
        public Empleado Get(int identificacion, string dato)
        {
            using (ChallengeEntities db = new ChallengeEntities())
            {
                Empleado empleado = new Empleado();

                switch (identificacion)
                {
                    case 1:

                        empleado = db.Empleado.Where(x => x.Dni == dato).FirstOrDefault();

                        if(empleado != null)
                        {
                            empleado.AsignarSalarioAnualEmpleado(empleado);
                        }                        

                        return empleado;                        
                        
                    case 2:

                        empleado = db.Empleado.Where(x => x.Legajo == dato).FirstOrDefault();

                        if (empleado != null)
                        {
                            empleado.AsignarSalarioAnualEmpleado(empleado);
                        }                           

                        return empleado;

                    default:

                        return null;
                }                
            }
        }

        // POST: api/Empleado
        [HttpPost]
        public Respuesta Post([FromBody] Empleado empleado)
        {
            Respuesta resp = new Respuesta();
            resp.Result = 0;

            try
            {
                using (ChallengeEntities db = new ChallengeEntities())
                {
                    db.Empleado.Add(empleado);
                    db.SaveChanges();

                    List<Empleado> empleados = ListaEmpleados(db);

                    resp.Data = empleados;
                    resp.Result = 1;
                }
            }
            catch (Exception ex)
            {
                resp.Msg = ex.Message;
            }

            return resp;
        }

        [HttpPut]
        public Respuesta Put([FromBody] Empleado empleado)
        {
            Respuesta resp = new Respuesta();
            resp.Result = 0;

            try
            {
                using (ChallengeEntities db = new ChallengeEntities())
                {
                    Empleado emp = db.Empleado.Find(empleado.IdEmpleado);
                    emp.Legajo = empleado.Legajo;
                    emp.Dni = empleado.Dni;
                    emp.Nombre = empleado.Nombre;
                    emp.Apellido = empleado.Apellido;
                    emp.Salario = empleado.Salario;

                    db.Entry(emp).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();

                    List<Empleado> empleados = ListaEmpleados(db);

                    resp.Data = empleados;
                    resp.Result = 1;
                }
            }
            catch (Exception ex)
            {
                resp.Msg = ex.Message;
            }

            return resp;
        }

        [HttpDelete]
        public Respuesta Delete([FromBody] Empleado empleado)
        {
            Respuesta resp = new Respuesta();
            resp.Result = 0;

            try
            {
                using (ChallengeEntities db = new ChallengeEntities())
                {
                    Empleado emp = db.Empleado.Find(empleado.IdEmpleado);
                    DateTime date = DateTime.Today;

                    emp.FechaBaja = date;
                    

                    db.Entry(emp).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();

                    List<Empleado> empleados = ListaEmpleados(db);

                    resp.Data = empleados;
                    resp.Result = 1;
                }
            }
            catch (Exception ex)
            {
                resp.Msg = ex.Message;
            }

            return resp;
        }        

        private List<Empleado> ListaEmpleados(ChallengeEntities db)
        {
            List<Empleado> empleados = db.Empleado.ToList();

            if (empleados.Count > 0 && empleados != null)
            {
                Empleado empleado = new Empleado();

                empleado.AsignarSalarioAnualEmpleados(empleados);
            }

            return empleados;
        }
    }
}
