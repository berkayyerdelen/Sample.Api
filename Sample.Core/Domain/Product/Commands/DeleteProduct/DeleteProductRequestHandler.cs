using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.Extensions.Logging;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct
{
    public class DeleteProductRequestHandler : IRequestHandler<DeleteProductRequest, BaseResponseDto<bool>>
    {
        private readonly IApplicationDbContext _context;
        private readonly ILogger<DeleteProductRequestHandler> _logger;

        public DeleteProductRequestHandler(IApplicationDbContext context, ILogger<DeleteProductRequestHandler> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<BaseResponseDto<bool>> Handle(DeleteProductRequest request,
            CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<bool>();
            try
            {
                var source = await _context.Set<Sample.Domain.Product>().FindAsync(request.Id);
                _context.Set<Sample.Domain.Product>().Remove(source);
                await _context.SaveChangesAsync(cancellationToken);
                response.Data = true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                response.Data = false;
            }

            return response;
        }
    }
}