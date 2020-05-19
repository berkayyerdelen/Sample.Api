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

            CreateMap<Product, Domain.Product.Queries.GetProductByName.Dto.ProductDto>();
        }
    }
}