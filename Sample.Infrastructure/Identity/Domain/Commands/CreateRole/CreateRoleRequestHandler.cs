using System;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.CreateRole
{
    public class CreateRoleRequestHandler : IRequestHandler<CreateRoleRequest, BaseResponseDto<bool>>
    {
        private readonly RoleManager<Role> _roleManager;

        public CreateRoleRequestHandler(RoleManager<Role> roleManager)
        {
            _roleManager = roleManager;
        }
        public async Task<BaseResponseDto<bool>> Handle(CreateRoleRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<bool>();
            if (string.IsNullOrEmpty(request.RoleName))
            {
                throw new Exception("Role can not be null or empty");
            }
            var newRole = new Role()
            {
                Name = request.RoleName
            };
            try
            {
                var roleResult = await _roleManager.CreateAsync(newRole);
                if (roleResult.Succeeded)
                    result.Data = true;
            }
            catch (Exception e)
            {
                result.Data = false;
                result.Errors.Add(e.Message);
            }
          
            return result;

        }
    }
}