using AutoMapper;
using Sample.Core.Common;

namespace SampleApi.IntegrationTests.Common
{
    public class AutoMapperFactory
    {
        public static IMapper Create()
        {
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MapperProfile());
            });
            return mappingConfig.CreateMapper();
        }
    }
}