using MediatR;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.CreateRole
{
    public class CreateRoleRequest:IRequest<BaseResponseDto<bool>>
    {
        public string RoleName { get; set; }
    }
}