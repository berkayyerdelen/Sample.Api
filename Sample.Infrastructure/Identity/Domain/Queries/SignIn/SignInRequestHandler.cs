using System;
using System.Linq;
using MediatR;
using Sample.Core.Common.BaseDto;
using Sample.Infrastructure.Identity.Domain.Queries.SignIn.Dto;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace Sample.Infrastructure.Identity.Domain.Queries.SignIn
{
    public class SignInRequestHandler : IRequestHandler<SignInRequest, BaseResponseDto<SignInDto>>
    {
        private readonly UserManager<User> _userManager;
        public SignInRequestHandler(UserManager<User> userManager)
        {
            _userManager = userManager;
        }
        public async Task<BaseResponseDto<SignInDto>> Handle(SignInRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<SignInDto>();
            var user = _userManager.Users.SingleOrDefault(x => x.UserName == request.Email);
            if(user is null)
                throw new Exception("User does not exist");
            var userSignInResult = await _userManager.CheckPasswordAsync(user, request.Password);
            return result; 

        }
    }
}