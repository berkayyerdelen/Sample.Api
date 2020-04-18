using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Sample.Core.Common;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProducts
{
    public class GetProductsRequestHandler : IRequestHandler<GetProductsRequest, List<ProductDto>>
    {
        private readonly IApplicationDbContext _context;

        public GetProductsRequestHandler(IApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<List<ProductDto>> Handle(GetProductsRequest request, CancellationToken cancellationToken)
        {
            return await _context.Set<Sample.Domain.Product>().Select(x=> new ProductDto()
            {
                CreatedDate = x.CreatedDate,
                Id =  x.Id,
                Name = x.Name
            }).ToListAsync(cancellationToken);
        }
    }
}