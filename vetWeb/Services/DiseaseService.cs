using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class DiseaseService
    {
        // READ - ALL
        public List<Disease> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Diseases.ToList();
            }
        }

        // READ - BY ID
        public Disease GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Diseases.Find(id);
            }
        }

        // CREATE
        public void Add(Disease disease)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Diseases.Add(disease);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Disease disease)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(disease).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var disease = db.Diseases.Find(id);
                if (disease != null)
                {
                    db.Diseases.Remove(disease);
                    db.SaveChanges();
                }
            }
        }
    }
}
