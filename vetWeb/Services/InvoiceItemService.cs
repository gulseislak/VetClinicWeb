using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class InvoiceItemService
    {
        // READ - ALL
        public List<InvoiceItem> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.InvoiceItems.ToList();
            }
        }

        // READ - BY ID
        public InvoiceItem GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.InvoiceItems.Find(id);
            }
        }

        // CREATE
        public void Add(InvoiceItem item)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.InvoiceItems.Add(item);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(InvoiceItem item)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(item).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var item = db.InvoiceItems.Find(id);
                if (item != null)
                {
                    db.InvoiceItems.Remove(item);
                    db.SaveChanges();
                }
            }
        }
    }
}
