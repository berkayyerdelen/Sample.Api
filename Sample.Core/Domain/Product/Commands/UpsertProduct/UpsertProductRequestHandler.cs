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
    public class UpsertProductRequestHandler : IRequestHandler<UpsertProductRequest, BaseResponseDto<bool>>
    {
        private readonly IApplicationDbContext _context;
        private readonly ILogger<UpsertProductRequestHandler> _logger;
        private readonly IMapper _mapper;

        public UpsertProductRequestHandler(IMapper mapper, IApplicationDbContext context,
            ILogger<UpsertProductRequestHandler> logger)
        {
            _mapper = mapper;
            _context = context;
            _logger = logger;
        }

        public async Task<BaseResponseDto<bool>> Handle(UpsertProductRequest request,
            CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<bool>();
            var product = _mapper.Map<Sample.Domain.Product>(request);
            try
            {
                if (!product.Id.Equals(0))
                    await UpdateProduct(product, cancellationToken);
                else
                    await InsertProduct(product, cancellationToken);

                response.Data = true;
                await _context.SaveChangesAsync(cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                response.Data = false;
            }

            return response;
        }
        private async Task UpdateProduct(Sample.Domain.Product product, CancellationToken cancellationToken)
        {
            await Task.FromResult(_context.Set<Sample.Domain.Product>().Update(product));
        }
        private async Task InsertProduct(Sample.Domain.Product product, CancellationToken cancellationToken)
        {
            await _context.Set<Sample.Domain.Product>().AddAsync(product, cancellationToken);
        }


    }
}