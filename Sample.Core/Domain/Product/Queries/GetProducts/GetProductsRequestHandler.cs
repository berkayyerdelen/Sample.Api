using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProducts
{
    public class GetProductsRequestHandler : IRequestHandler<GetProductsRequest, BaseResponseDto<List<ProductDto>>>
    {
        private readonly IApplicationDbContext _context;
        private readonly ILogger<GetProductsRequestHandler> _logger;
        private readonly IMapper _mapper;


        public GetProductsRequestHandler(IApplicationDbContext context, IMapper mapper,
            ILogger<GetProductsRequestHandler> logger)
        {
            _context = context;
            _mapper = mapper;
            _logger = logger;
        }

        public async Task<BaseResponseDto<List<ProductDto>>> Handle(GetProductsRequest request,
            CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<List<ProductDto>>();

            try
            {
                var source = await _context.Set<Sample.Domain.Product>().Select(x => _mapper.Map<ProductDto>(x))
                    .AsNoTracking().ToListAsync(cancellationToken);
                response.Data = source;
                response.Total = source.Count();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
                response.Errors.Add("An error occurred while processing your request");
            }

            return response;
        }
    }
}