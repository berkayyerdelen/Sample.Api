using AutoMapper;
using Sample.Infrastructure.Identity;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;
using SampleApi.UniTests.Mapper;
using Xunit;

namespace SampleApi.UniTests
{
    public class MapperTests : IClassFixture<MappingTestsFixture>
    {

        private readonly IMapper _mapper;
        private readonly IConfigurationProvider _configuration;


        public MapperTests(MappingTestsFixture fixture)
        {
            _configuration = fixture.ConfigurationProvider;
            _mapper = fixture.Mapper;
        }
        [Fact]
        public void ShouldHaveValidValidConfiguration()
        {
            _configuration.AssertConfigurationIsValid();
        }
        [Fact]
        public void ShouldMapSignUpRequestToUser()
        {
            var signupRequest = new SignUpRequest();
            var result = _mapper.Map<User>(signupRequest);
            Assert.NotNull(result);
            Assert.IsType<User>(result);
        }
    }
}