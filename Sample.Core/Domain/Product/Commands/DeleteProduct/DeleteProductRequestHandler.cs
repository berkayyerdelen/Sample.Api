using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Sample.Core.Common;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct
{
    public class DeleteProductRequestHandler:IRequestHandler<DeleteProductRequest,Unit>
    {
        private readonly IApplicationDbContext _context;

        public DeleteProductRequestHandler(IApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<Unit> Handle(DeleteProductRequest request, CancellationToken cancellationToken)
        {
            try
            {
                var source = await _context.Set<Sample.Domain.Product>().FindAsync(request.Id);
                _context.Set<Sample.Domain.Product>().Remove(source);
                await _context.SaveChangesAsync(cancellationToken);
                return Unit.Value;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
           
        }
    }
}
