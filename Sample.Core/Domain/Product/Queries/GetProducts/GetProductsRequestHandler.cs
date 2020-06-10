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
using Sample.Core.Common.BaseLogger;
using Sample.Core.Domain.Product.Queries.GetProducts.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProducts
{
    public class GetProductsRequestHandler : BaseILogger<GetProductsRequestHandler>,IRequestHandler<GetProductsRequest, BaseResponseDto<List<ProductDto>>>
    {
        private readonly IApplicationDbContext _context;
        private readonly IMapper _mapper;
        public GetProductsRequestHandler(IApplicationDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;

        }
        public async Task<BaseResponseDto<List<ProductDto>>> Handle(GetProductsRequest request,
            CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<List<ProductDto>>();
            Logger.LogInformation("Hey hey hey");
            try
            {
                var source = await _context.Set<Sample.Domain.Product>().Select(x => _mapper.Map<ProductDto>(x))
                    .AsNoTracking().ToListAsync(cancellationToken).ConfigureAwait(false);
                response.Data = source;
                response.Total = source.Count();
                
            }
            catch (Exception e)
            {
                response.Errors.Add("An error occurred while processing your request");
            }

            return response;
        }
    }
}