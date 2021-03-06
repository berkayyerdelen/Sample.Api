﻿using System;

namespace Sample.Core.Domain.Product.Queries.GetProducts.Dto
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
    }
}