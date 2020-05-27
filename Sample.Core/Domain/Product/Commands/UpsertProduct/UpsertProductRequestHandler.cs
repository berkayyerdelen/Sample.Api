using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Sample.Core.Common;
using Sample.Core.Common.BaseDto;

namespace Sample.Core.Domain.Product.Commands.UpsertProduct
{
    public class UpsertProductRequestHandler : IRequestHandler<UpsertProductRequest, BaseResponseDto<bool>>
    {
        private readonly IApplicationDbContext _context;
        private readonly IMapper _mapper;

        public UpsertProductRequestHandler(IMapper mapper, IApplicationDbContext context)
        {
            _mapper = mapper;
            _context = context;           
        }

        public async Task<BaseResponseDto<bool>> Handle(UpsertProductRequest request,
            CancellationToken cancellationToken)
        {
            var response = new BaseResponseDto<bool>();
            var product = _mapper.Map<Sample.Domain.Product>(request);
            try
            {
                if (!product.Id.Equals(0))
                    await UpdateProduct(productEntity: product,cancellationToken: cancellationToken);
                else
                    await InsertProduct(productEntity: product, cancellationToken);

                response.Data = true;
                await _context.SaveChangesAsync(cancellationToken);
            }
            catch (Exception ex)
            {
                response.Errors.Add(ex.Message);
                response.Data = false;
            }

            return response;
        }
        private async Task UpdateProduct(Sample.Domain.Product productEntity, CancellationToken cancellationToken)
        {
            var product = await _context.Set<Sample.Domain.Product>().FindAsync(productEntity.Id);
            //var customer = _mapper.Map<UpdateCustomerCommand, Entities.Customer>(request, query);
            var source = _mapper.Map(product, productEntity);
            //product.Name = productEntity.Name;
            //product.CreatedDate = productEntity.CreatedDate;
            await Task.FromResult(_context.Set<Sample.Domain.Product>().Update(source));
        }
        private async Task InsertProduct(Sample.Domain.Product productEntity, CancellationToken cancellationToken)
        {
            await _context.Set<Sample.Domain.Product>().AddAsync(productEntity, cancellationToken);
        }


    }
}