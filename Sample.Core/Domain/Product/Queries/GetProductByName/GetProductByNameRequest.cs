using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Queries.GetProductByName.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProductByName
{
    public class GetProductByNameRequest: IRequest<BaseResponseDto<ProductDto>>
    {
        public string ProductName { get; set; }
        public GetProductByNameRequest(string productName)
        {
            ProductName = productName;
        }
    }
}
