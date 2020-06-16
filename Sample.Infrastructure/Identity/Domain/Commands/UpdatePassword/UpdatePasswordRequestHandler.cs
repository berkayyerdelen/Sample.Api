using System.Threading;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.UpdatePassword
{
    public class UpdatePasswordRequestHandler : IRequestHandler<UpdatePasswordRequest, BaseResponseDto<bool>>
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        public UpdatePasswordRequestHandler(UserManager<User> userManager, SignInManager<User> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }
        public async Task<BaseResponseDto<bool>> Handle(UpdatePasswordRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<bool>();
            var user = await _userManager.FindByEmailAsync(request.Email);
            var resultOfChangePassword = await _userManager.ChangePasswordAsync(user, request.CurrentPassword, request.NewPassword);
            if (resultOfChangePassword.Succeeded == true)
            {
                result.Data = true;
                await _userManager.UpdateSecurityStampAsync(user);
                await _signInManager.RefreshSignInAsync(user);
            }

            return result;
        }
    }
}