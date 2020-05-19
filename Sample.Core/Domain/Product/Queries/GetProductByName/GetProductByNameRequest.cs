using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Queries.GetProductByName.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProductByName
{
    public class GetProductByNameRequest : IRequest<BaseResponseDto<ProductDto>>
    {
        public GetProductByNameRequest(string productName)
        {
            ProductName = productName;
        }

        public string ProductName { get; set; }
    }
}