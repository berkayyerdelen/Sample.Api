using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Sample.Core.Common.BaseDto;

namespace Sample.Core.Domain.Product.Commands.UpsertProduct
{
    public class UpsertProductRequest: IRequest<BaseResponseDto<bool>>
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedDate { get; set; } 
    }
}
