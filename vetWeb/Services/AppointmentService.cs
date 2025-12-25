using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class AppointmentService
    {
        // READ - ALL
        public List<Appointment> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Appointments.ToList();
            }
        }

        // READ - BY ID
        public Appointment GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Appointments.Find(id);
            }
        }

        // CREATE
        public void Add(Appointment appointment)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Appointments.Add(appointment);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Appointment appointment)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(appointment).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var appointment = db.Appointments.Find(id);
                if (appointment != null)
                {
                    db.Appointments.Remove(appointment);
                    db.SaveChanges();
                }
            }
        }
    }
}
