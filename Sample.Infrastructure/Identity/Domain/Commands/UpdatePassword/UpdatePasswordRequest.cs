using MediatR;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.UpdatePassword
{
    public class UpdatePasswordRequest:IRequest<BaseResponseDto<bool>>
    {
        public string Email { get; set; }
        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; }
    }
}