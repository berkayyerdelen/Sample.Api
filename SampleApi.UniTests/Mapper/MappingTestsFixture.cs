using AutoMapper;
using Sample.Core.Common;
using Sample.Infrastructure.Identity.Mapper;

namespace SampleApi.UniTests.Mapper
{
    public class MappingTestsFixture
    {
        public MappingTestsFixture()
        {
            ConfigurationProvider = new MapperConfiguration(cfg =>
            {
                cfg.ForAllMaps((map, exp) => exp.ForAllOtherMembers(opt => opt.Ignore()));
                cfg.AddProfile(new MapperProfile());
                cfg.AddProfile(new IdentityMapperProfile());

            });
            Mapper = ConfigurationProvider.CreateMapper();
        }
        public IConfigurationProvider ConfigurationProvider { get; }
        public IMapper Mapper { get; }
    }
}