using DataAccess;
using System.Collections.Generic;
using System.Linq;

namespace vetWeb.Services
{
    public class InvoiceService
    {
        // READ - ALL
        public List<Invoice> GetAll()
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Invoices.ToList();
            }
        }

        // READ - BY ID
        public Invoice GetById(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                return db.Invoices.Find(id);
            }
        }

        // CREATE
        public void Add(Invoice invoice)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Invoices.Add(invoice);
                db.SaveChanges();
            }
        }

        // UPDATE
        public void Update(Invoice invoice)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                db.Entry(invoice).State =
                    System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        // DELETE
        public void Delete(int id)
        {
            using (var db = new VetClinic_Group6Entities())
            {
                var invoice = db.Invoices.Find(id);
                if (invoice != null)
                {
                    db.Invoices.Remove(invoice);
                    db.SaveChanges();
                }
            }
        }
    }
}
