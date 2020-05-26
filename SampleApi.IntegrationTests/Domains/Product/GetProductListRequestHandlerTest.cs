using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
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
        public async Task Get_Product_List_Count()
        {
            var handler = new GetProductsRequestHandler(_context, _mapper);
            var source = await handler.Handle(new GetProductsRequest(), CancellationToken.None)
                ;
           Assert.Equal(3,source.Data.Count);
        }

    }
}