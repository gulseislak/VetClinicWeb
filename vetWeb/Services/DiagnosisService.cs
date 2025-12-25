using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class DiagnosisService
    {
        // READ - ALL
        public List<Diagnosis> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Diagnosis.ToList();
            }
        }

        // READ - BY ID
        public Diagnosis GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Diagnosis.Find(id);
            }
        }

        // CREATE
        public void Add(Diagnosis diagnosis)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Diagnosis.Add(diagnosis);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Diagnosis diagnosis)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(diagnosis).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var diagnosis = db.Diagnosis.Find(id);
                if (diagnosis != null)
                {
                    db.Diagnosis.Remove(diagnosis);
                    db.SaveChanges();
                }
            }
        }
    }
}
