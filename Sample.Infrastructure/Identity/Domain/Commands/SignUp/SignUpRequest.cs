using MediatR;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.SignUp
{
    public class SignUpRequest:IRequest<BaseResponseDto<bool>>
    {
        public string Email { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
    }
}