﻿using System;
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
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
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
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
