using System;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Sample.Core.Common.BaseDto;

namespace Sample.Infrastructure.Identity.Domain.Commands.SignUp
{
    public class SignUpRequestHandler : IRequestHandler<SignUpRequest, BaseResponseDto<bool>>
    {
        private readonly UserManager<User> _userManager;
        private readonly IMapper _mapper;
        public SignUpRequestHandler(IMapper mapper, UserManager<User> userManager)
        {
            _mapper = mapper;
            _userManager = userManager;
        }
        public async Task<BaseResponseDto<bool>> Handle(SignUpRequest request, CancellationToken cancellationToken)
        {
            var result =new BaseResponseDto<bool>();
            try
            {
                var user = _mapper.Map<SignUpRequest, User>(request);
                var userCreateRequest = await _userManager.CreateAsync(user, request.Password);
                result.Data = userCreateRequest.Succeeded;
            }
            catch (Exception e)
            {
                result.Errors.Add(e.StackTrace);
            }
            
            return result;

        }
    }
}