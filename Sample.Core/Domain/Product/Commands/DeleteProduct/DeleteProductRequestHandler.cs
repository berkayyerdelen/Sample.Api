using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct
{
    public class DeleteProductRequestHandler:IRequestHandler<DeleteProductRequest,BaseResponseDto<bool>>
    {
        private readonly IApplicationDbContext _context;

        public DeleteProductRequestHandler(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<BaseResponseDto<bool>> Handle(DeleteProductRequest request, CancellationToken cancellationToken)
        {
            BaseResponseDto<bool> response = new BaseResponseDto<bool>();
            try
            {
                var source =await _context.Set<Sample.Domain.Product>().FindAsync(request.Id);
                _context.Set<Sample.Domain.Product>().Remove(source);
                await _context.SaveChangesAsync(cancellationToken);
                response.Data = true;
            }
            catch (Exception e)
            {
                response.Data = false;
                Console.WriteLine(e);
                throw;
            }

            return response;
        }
    }
}
