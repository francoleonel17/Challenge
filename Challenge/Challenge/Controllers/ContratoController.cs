using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Challenge.Controllers
{
    public class ContratoController : ApiController
    {
        // GET: api/Contrato      

        public IEnumerable<Contrato> Get()
        {
            using (ChallengeEntities db = new ChallengeEntities())
            {
                return db.Contrato.ToList();
            }
        }        
    }
}
