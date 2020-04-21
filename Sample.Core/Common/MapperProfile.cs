using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;
using Sample.Domain;

namespace Sample.Core.Common
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<ProductDto, Product>();

            CreateMap<Product, ProductDto>();

            CreateMap<Product, Sample.Core.Domain.Product.Queries.GetProductByName.Dto.ProductDto>();
        }
    }
}
