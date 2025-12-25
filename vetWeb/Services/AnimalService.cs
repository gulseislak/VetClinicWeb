using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class AnimalService
    {
        // READ - ALL
        public List<Animal> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Animals.ToList();
            }
        }

        // READ - BY ID
        public Animal GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Animals.Find(id);
            }
        }

        // CREATE
        public void Add(Animal animal)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Animals.Add(animal);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Animal animal)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(animal).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var animal = db.Animals.Find(id);
                if (animal != null)
                {
                    db.Animals.Remove(animal);
                    db.SaveChanges();
                }
            }
        }
    }
}
