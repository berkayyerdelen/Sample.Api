using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Infrastructure.Identity.Domain.Queries.SignIn.Dto;

namespace Sample.Infrastructure.Identity.Domain.Queries.SignIn
{
    public class SignInRequest:IRequest<BaseResponseDto<SignInDto>>
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}