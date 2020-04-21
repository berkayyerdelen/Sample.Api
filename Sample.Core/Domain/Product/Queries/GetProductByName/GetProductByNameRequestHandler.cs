using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;
using Sample.Core.Domain.Product.Queries.GetProductByName.Dto;

namespace Sample.Core.Domain.Product.Queries.GetProductByName
{
    public class GetProductByNameRequestHandler : IRequestHandler<GetProductByNameRequest, BaseResponseDto<ProductDto>>
    {
        private readonly IApplicationDbContext _context;
        private readonly IMapper _mapper;
        private readonly ILogger<GetProductByNameRequestHandler> _logger;

        public GetProductByNameRequestHandler(IMapper mapper, IApplicationDbContext context, ILogger<GetProductByNameRequestHandler> logger)
        {
            _mapper = mapper;
            _context = context;
            _logger = logger;
        }
        public async Task<BaseResponseDto<ProductDto>> Handle(GetProductByNameRequest request, CancellationToken cancellationToken)
        {
            BaseResponseDto<ProductDto> response = new BaseResponseDto<ProductDto>();
            try
            {
                var source =await _context.Set<Sample.Domain.Product>()
                    .FirstOrDefaultAsync(x => x.Name == request.ProductName,cancellationToken);
                
                var productDto = _mapper.Map<ProductDto>(source);

                response.Data = productDto;

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);

            }

            return response;
        }
    }
}