using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class OwnerService
    {
        // READ - ALL
        public List<Owner> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Owners.ToList();
            }
        }

        // READ - BY ID
        public Owner GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Owners.Find(id);
            }
        }

        // CREATE
        public void Add(Owner owner)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Owners.Add(owner);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Owner owner)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(owner).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var owner = db.Owners.Find(id);
                if (owner != null)
                {
                    db.Owners.Remove(owner);
                    db.SaveChanges();
                }
            }
        }
    }
}
