using AutoMapper;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;


namespace Sample.Infrastructure.Identity.Mapper
{
    public class IdentityMapperProfile : Profile
    {
        public IdentityMapperProfile()
        {
            CreateMap<SignUpRequest, User>().ForMember(x => x.Email, c => c.MapFrom(k => k.Email))
            .ForMember(x => x.UserName, c => c.MapFrom(k => k.UserName))
            .ForMember(x => x.FirstName, c => c.MapFrom(k => k.FirstName)).ForMember(x => x.LastName, c => c.MapFrom(k => k.LastName))
            .ForMember(x => x.PasswordHash, c => c.MapFrom(k => k.Password));


            CreateMap<SignUpRequest, User>();
        }
    }
}