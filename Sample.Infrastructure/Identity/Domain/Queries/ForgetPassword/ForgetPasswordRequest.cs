using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Infrastructure.Identity.Domain.Queries.ForgetPassword.Dto;

namespace Sample.Infrastructure.Identity.Domain.Queries.ForgetPassword
{
    public class ForgetPasswordRequest:IRequest<BaseResponseDto<ForgetPasswordDto>>
    {
        public string Email { get; set; }
    }
}