using MediatR;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.AddUserToRole
{
    public class AddUserToRoleRequest:IRequest<BaseResponseDto<bool>>
    {
        public string UserMail { get; set; }
        public string RoleName { get; set; }
    }
}