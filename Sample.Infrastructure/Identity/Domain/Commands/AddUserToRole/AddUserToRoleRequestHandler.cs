using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.AddUserToRole
{
    public class AddUserToRoleRequestHandler:IRequestHandler<AddUserToRoleRequest,BaseResponseDto<bool>>
    {
        private readonly UserManager<User> _userManager;

        public AddUserToRoleRequestHandler(UserManager<User> userManager)
        {
            _userManager = userManager;
        }
        public async Task<BaseResponseDto<bool>> Handle(AddUserToRoleRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<bool>();
            try
            {
                var user = _userManager.Users.SingleOrDefault(x => x.UserName == request.UserMail);
                var resultRoleInsertion = await _userManager.AddToRoleAsync(user, request.RoleName);
                if (resultRoleInsertion.Succeeded)
                {
                    result.Data = true;
                }
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