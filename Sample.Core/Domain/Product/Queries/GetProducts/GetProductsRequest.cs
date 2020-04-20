using System;
using System.Collections.Generic;
using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProducts
{
    public class GetProductsRequest:IRequest<BaseResponseDto<List<ProductDto>>>
    {
     
    }
}