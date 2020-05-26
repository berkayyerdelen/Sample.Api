using System;
using AutoMapper;
using Sample.Infrastructure;
using Xunit;

namespace SampleApi.IntegrationTests.Common
{
    public class QueryTextFixture:IDisposable
    {
        public ApplicationContext Context { get; set; }
        public IMapper Mapper { get; set; }

        public QueryTextFixture()
        {
            Context = ApplicationContextFactory.Create();
            Mapper = AutoMapperFactory.Create();
        }
        public void Dispose()
        {
            ApplicationContextFactory.Destroy(Context);
        }
    }
    [CollectionDefinition("QueryCollection")]
    public class QueryCollection : ICollectionFixture<QueryTextFixture> { }

}