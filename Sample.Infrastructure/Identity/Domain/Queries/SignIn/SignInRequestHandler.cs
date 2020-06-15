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

        public SignInRequestHandler(UserManager<User> userManager, ITokenGenerator tokenGenerator)
        {
            _userManager = userManager;
            _tokenGenerator = tokenGenerator;
        }
        public async Task<BaseResponseDto<SignInDto>> Handle(SignInRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<SignInDto>();
            var user = _userManager.Users.SingleOrDefault(x => x.Email == request.Email);
            if (user is null)
                throw new Exception("User does not exist");
            var userSignInResult = await _userManager.CheckPasswordAsync(user, request.Password);
            if (userSignInResult)
            {
                var roles = await _userManager.GetRolesAsync(user);
                result.Data.Jwt = _tokenGenerator.GenerateJwt(user, roles);

            }

            return result;

        }
    }
}