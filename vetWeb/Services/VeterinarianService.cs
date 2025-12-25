using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class VeterinarianService
    {
        // READ - ALL
        public List<Veterinarian> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Veterinarians.ToList();
            }
        }

        // READ - BY ID
        public Veterinarian GetById(int vetId)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Veterinarians.Find(vetId);
            }
        }

        // CREATE
        public void Add(Veterinarian vet)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Veterinarians.Add(vet);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Veterinarian vet)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(vet).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int vetId)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var vet = db.Veterinarians.Find(vetId);
                if (vet != null)
                {
                    db.Veterinarians.Remove(vet);
                    db.SaveChanges();
                }
            }
        }
    }
}
