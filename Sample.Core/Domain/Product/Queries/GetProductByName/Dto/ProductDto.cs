using System;

namespace Sample.Core.Domain.Product.Queries.GetProductByName.Dto
{
    /// <summary>
    ///     Product Dto for GetProductByName
    /// </summary>
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}