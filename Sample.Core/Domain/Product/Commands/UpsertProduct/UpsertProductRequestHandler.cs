using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;


namespace Sample.Core.Domain.Product.Commands.UpsertProduct
{
    public class UpsertProductRequestHandler:IRequestHandler<UpsertProductRequest,BaseResponseDto<bool>>
    {
        private  readonly IMapper _mapper;
        private  readonly IApplicationDbContext _context;
        private  readonly ILogger<UpsertProductRequestHandler> _logger;

        public UpsertProductRequestHandler(IMapper mapper, IApplicationDbContext context, ILogger<UpsertProductRequestHandler> logger)
        {
            _mapper = mapper;
            _context = context;
            _logger = logger;
        }
        public async Task<BaseResponseDto<bool>> Handle(UpsertProductRequest request, CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<bool>();
            var product = _mapper.Map<Sample.Domain.Product>(request);
            try
            {
                if (!product.Id.Equals(0))
                    _context.Set<Sample.Domain.Product>().Update(product);
                else
                    await _context.Set<Sample.Domain.Product>().AddAsync(product, cancellationToken);

                response.Data = true;
                await _context.SaveChangesAsync(cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex,ex.Message);
                response.Data = false;
            }

            return response;
        }
    }
}