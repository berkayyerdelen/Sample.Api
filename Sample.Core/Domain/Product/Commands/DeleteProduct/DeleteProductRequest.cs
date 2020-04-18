using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Sample.Core.Domain.Product.Commands.DeleteProduct.Dto;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct
{
    public class DeleteProductRequest:IRequest
    {
        public int Id { get; set; }
    }
}
