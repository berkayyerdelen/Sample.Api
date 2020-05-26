using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sample.Api.Controllers.Base.v1;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProducts;

namespace Sample.Api.Controllers
{
    [ApiVersion("1.0")]
    [ApiController]
    public class ProductController : Basev1ApiController
    {
        private readonly ILogger<ProductController> _logger;
        private readonly IMediator _mediator;

        public ProductController(IMediator mediator, ILogger<ProductController> logger)
        {
            _mediator = mediator;
            _logger = logger;
        }

        /// <summary>
        /// GET: api/v1.0/product
        /// </summary>
        /// Get product list
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(typeof(BaseResponseDto<Core.Domain.Product.Queries.GetProductByName.Dto.ProductDto>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> Get(CancellationToken ct)
        {
            var query = await _mediator.Send(new GetProductsRequest(), ct).ConfigureAwait(false);
            return Ok(query);
        }

        /// <summary>
        /// Delete: api/v1.0/product
        /// </summary>
        /// Delete product by id
        /// <param name="request"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpDelete]
        [ProducesResponseType(typeof(BaseResponseDto<bool>),
            (StatusCodes.Status204NoContent))]
        public async Task<IActionResult> DeleteProduct(DeleteProductRequest request, CancellationToken ct)
        {
            var query = await _mediator.Send(request, ct).ConfigureAwait(false);
            return Ok(query);
        }

        /// <summary>
        /// POST: api/v1.0/product
        /// </summary>
        /// Create or Update the product
        /// <param name="request"></param>
        /// <param name="ct"></param>
        /// <returns></returns>
        [HttpPost]
        [ProducesResponseType(typeof(BaseResponseDto<bool>),
            (StatusCodes.Status201Created))]
        [ProducesResponseType(typeof(BaseResponseDto<bool>),
            (StatusCodes.Status200OK))]
        public async Task<IActionResult> UpsertProduct(UpsertProductRequest request, CancellationToken ct)
        {
            var query = await _mediator.Send(request, ct).ConfigureAwait(false);
            return Ok(query);
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
        [ProducesResponseType(typeof(BaseResponseDto<Core.Domain.Product.Queries.GetProductByName.Dto.ProductDto>),
            StatusCodes.Status200OK)]
        public async Task<IActionResult> GetProductByName(string productName)
        {
            var query = await _mediator.Send(new GetProductByNameRequest(productName)).ConfigureAwait(false);
            return Ok(query);
        }
    }
}