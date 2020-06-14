using AutoMapper;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;


namespace Sample.Infrastructure.Identity.Mapper
{
    public class IdentityMapperProfile : Profile
    {
        public IdentityMapperProfile()
        {
            CreateMap<SignUpRequest, User>();
        }
    }
}