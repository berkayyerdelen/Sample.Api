using System;
using System.Linq;
using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Infrastructure.Identity.Domain.Queries.SignIn.Dto;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Sample.Infrastructure.Identity.Jwt;

namespace Sample.Infrastructure.Identity.Domain.Queries.SignIn
{
    public class SignInRequestHandler : IRequestHandler<SignInRequest, BaseResponseDto<SignInDto>>
    {
        private readonly UserManager<User> _userManager;
        private readonly ITokenGenerator _tokenGenerator;
        private readonly SignInManager<User> _signInManager;

        public SignInRequestHandler(UserManager<User> userManager, ITokenGenerator tokenGenerator, SignInManager<User> signInManager)
        {
            _userManager = userManager;
            _tokenGenerator = tokenGenerator;
            _signInManager = signInManager;
        }
        public async Task<BaseResponseDto<SignInDto>> Handle(SignInRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<SignInDto>();
            try
            {

                var user = await _userManager.FindByEmailAsync(request.Email);
                if (user is null)
                    throw new Exception("User does not exist");
                var userSignInResult = await _userManager.CheckPasswordAsync(user, request.Password);
                if (userSignInResult)
                {
                    await _userManager.ResetAccessFailedCountAsync(user);
                    var roles = await _userManager.GetRolesAsync(user);
                    result.Data.Jwt = _tokenGenerator.GenerateJwt(user, roles);

                }
                else
                {
                    await _userManager.AccessFailedAsync(user);
                    int failcount = await _userManager.GetAccessFailedCountAsync(user);
                    if (failcount == 3)
                    {
                        await _userManager.SetLockoutEndDateAsync(user, new DateTimeOffset(DateTime.Now.AddMinutes(2)));
                    }
                }
            }
            catch (Exception e)
            {
                result.Errors.Add(e.Message);
            }
            return result;

        }
    }
}