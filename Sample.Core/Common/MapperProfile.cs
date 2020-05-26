using AutoMapper;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;
using Sample.Domain;

namespace Sample.Core.Common
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<ProductDto, Product>().ReverseMap();

            CreateMap<Product, Domain.Product.Queries.GetProductByName.Dto.ProductDto>().ReverseMap();
            CreateMap<UpsertProductRequest, Sample.Domain.Product>().ReverseMap();
        }
    }
}