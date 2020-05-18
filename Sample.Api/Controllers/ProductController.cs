using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample.Api.Controllers.Base.v1;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Api.Controllers
{
    
    
    [ApiVersion("1.0", Deprecated = false)]
    public class ProductController : Basev1ApiController
    {
        private readonly IMediator _mediator;

        public ProductController(IMediator mediator)
        {
            _mediator = mediator;
        }
        /// <summary>
        /// GET: api/v1.0/product
        /// </summary>
        /// Get product list
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(typeof(BaseResponseDto<List<ProductDto>>), 200)]
        public async Task<IActionResult> Get(CancellationToken ct)
        {           
                var query = await _mediator.Send(new GetProductsRequest(), ct).ConfigureAwait(false);
                if (query.Data == null)               
                    return NotFound<object>("Products couldnt list", null, null);               
                return Success("Products listed.", null, query);
                               
        }

        /// <summary>
        /// Delete: api/v1.0/product
        /// </summary>
        /// Delete product by id
        /// <param name="request"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpDelete]       
        public async Task<IActionResult> DeleteProduct(DeleteProductRequest request, CancellationToken ct)
        {
            var query = await _mediator.Send(request, ct);
            if (query.Data == false)
                return Error("Product could could not deleted",null,query);
            return Success("Product is deleted", null, query);
        }
       
        /// <summary>
        /// POST: api/v1.0/product
        /// </summary>
        /// Create or Update the product
        /// <param name="request"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> UpsertProduct(UpsertProductRequest request, CancellationToken ct)
        {
            var query = await _mediator.Send(request, ct);
            if (query.Data == false)            
                return Error("Product could  not update or inserted", null, query);
            return Success("Product is update or inserted", null, query);

        }

        // PUT: api/Product/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        /// <summary>
        /// GET: api/v1.0/product/findbyname/{productName}
        /// </summary>
        /// Get product by productname
        /// <param name="productName"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("findbyname/{productName}")]
        [ProducesResponseType(typeof(BaseResponseDto<Sample.Core.Domain.Product.Queries.GetProductByName.Dto.ProductDto>), 200)]
        public async Task<IActionResult> GetProductByName(string productName)
        {
            var query = await _mediator.Send(new GetProductByNameRequest(productName));
            if (query.Data == null)
                return NotFound<object>("Products does not exist", null, null);
            return Success("Searched Product", null, query);

        }
    }
}
