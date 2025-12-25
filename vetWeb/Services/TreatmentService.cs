using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class TreatmentService
    {
        // READ - ALL
        public List<Treatment> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Treatments.ToList();
            }
        }

        // READ - BY ID
        public Treatment GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Treatments.Find(id);
            }
        }

        // CREATE
        public void Add(Treatment treatment)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Treatments.Add(treatment);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Treatment treatment)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(treatment).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var treatment = db.Treatments.Find(id);
                if (treatment != null)
                {
                    db.Treatments.Remove(treatment);
                    db.SaveChanges();
                }
            }
        }
    }
}
