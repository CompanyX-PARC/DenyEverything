using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Concordia42.api
{
    public class CalendarController : ApiController
    {
        // GET api/<controller>
        [Authorize(Roles="admin")]
        //public IEnumerable<string> Get()
        public object Get()
        {
            //return new string[] { "value1", "value2" };
            List<object> events = new List<object>();

            for (int i = 0; i < 17; i++) {

                TimeSpan add = new TimeSpan(0, i, 0);
                DateTime now = DateTime.Now;
                TimeSpan addHour = new TimeSpan(0, 1, 0);

                events.Add(new
                  {
                      title = "Event",
                      id = i,
                      start = now.Add(add).ToString("o"),
                      end = now.Add(addHour).ToString("o"),
                      allDay = false,
                  });
            }

          return events;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}