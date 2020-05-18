using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Api.Controllers
{
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    [ApiVersion("1.0", Deprecated = false)]
    public class ProductController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ProductController(IMediator mediator)
        {
            _mediator = mediator;
        }
        // GET: api/Product
        [HttpGet]
        public async Task<BaseResponseDto<List<ProductDto>>> GetProducts(CancellationToken ct)
        {
            return await _mediator.Send(new GetProductsRequest(), ct);
        }

        // GET: api/Product/5
        [HttpDelete]
        public async Task<BaseResponseDto<bool>> DeleteProduct(DeleteProductRequest request, CancellationToken ct)
        {
            return await _mediator.Send(request, ct);
        }

        // POST: api/Product
        [HttpPost]
        public async Task<BaseResponseDto<bool>> UpsertProduct(UpsertProductRequest request, CancellationToken ct)
        {
            return await _mediator.Send(request, ct);
        }

        // PUT: api/Product/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpGet]
        [Route("findbyname/{productName}")]
        public async Task<BaseResponseDto<Sample.Core.Domain.Product.Queries.GetProductByName.Dto.ProductDto>> GetProductByName(string productName)
        {
            return await _mediator.Send(new GetProductByNameRequest(productName));
        }
    }
}
