using System;

namespace Sample.Domain
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;

    }
}