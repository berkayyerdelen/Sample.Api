using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Commands.DeleteProduct.Dto;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct
{
    public class DeleteProductRequest:IRequest<BaseResponseDto<bool>>
    {
        public int Id { get; set; }
    }
}
