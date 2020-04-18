using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Sample.Core.Common;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProducts
{
    public class GetProductsRequestHandler : IRequestHandler<GetProductsRequest, List<ProductDto>>
    {
        private readonly IApplicationDbContext _context;
        private readonly IMapper _mapper;

        public GetProductsRequestHandler(IApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task<List<ProductDto>> Handle(GetProductsRequest request, CancellationToken cancellationToken)
        {
            return await _context.Set<Sample.Domain.Product>().Select(x => _mapper.Map<ProductDto>(x))
                .ToListAsync(cancellationToken);
        }
    }
}