using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProducts;
using Sample.Infrastructure;
using SampleApi.IntegrationTests.Common;
using Xunit;

namespace SampleApi.IntegrationTests.Domains.Product
{
    [Collection("QueryCollection")]
    public class GetProductListRequestHandlerTest
    {

        public readonly ApplicationContext _context;
        private readonly IMapper _mapper;
        public GetProductListRequestHandlerTest(QueryTextFixture fixture)
        {
            _context = fixture.Context;
            _mapper = fixture.Mapper;
        }

        [Fact]
        public async Task Get_Product_List_Count_Test()
        {
            var handler = new GetProductsRequestHandler(_context, _mapper);
            var source = await handler.Handle(new GetProductsRequest(),
                CancellationToken.None);
            
            Assert.Equal(3, source.Data.Count);
        }

        [Fact]
        public async Task Upsert_Product_Test()
        {
            var handler = new UpsertProductRequestHandler(_mapper, _context);
            var newProduct = new UpsertProductRequest()
            {
                CreatedDate = DateTime.Now.AddDays(3),
                Name = "MSI2"
            };
            var updateProduct = new UpsertProductRequest()
            { 
                Id = 4,
                Name = "MSI2",
                CreatedDate = DateTime.Now
            };
            
            var insertQuery = await handler.Handle(newProduct, cancellationToken: CancellationToken.None);
            Assert.True(insertQuery.Data);

            var updateQuery = await handler.Handle(updateProduct, cancellationToken: CancellationToken.None);
            Assert.True(updateQuery.Data);

            var queryHandler = new GetProductByNameRequestHandler(_mapper, _context);

            var product = queryHandler.Handle(new GetProductByNameRequest("MSI2")
                , CancellationToken.None);
            Assert.Equal(4, product.Result.Data.Id);

        }


    }
}