using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Sample.Api.Controllers.Base.v1;
using Sample.Infrastructure.Identity;
using Sample.Infrastructure.Identity.Domain.Commands.AddUserToRole;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;
using Sample.Infrastructure.Identity.Domain.Commands.UpdatePassword;
using Sample.Infrastructure.Identity.Domain.Queries.ForgetPassword;
using Sample.Infrastructure.Identity.Domain.Queries.SignIn;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Sample.Api.Controllers
{
    [ApiVersion("1.0")]
    [ApiController]
    public class AuthController : Basev1ApiController<AuthController>
    {

        [HttpPost("SignUp")]
        public async Task<IActionResult> SignUp(SignUpRequest request,CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }
        [HttpPost("SignIn")]
        public async Task<IActionResult> SignIn(SignInRequest request, CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }
        [HttpPost("User/Role")]
        public async Task<IActionResult> AddUserToRole(AddUserToRoleRequest request ,CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }

        [HttpPost("User/ForgetPassword")]
        public async Task<IActionResult> ResetPassword(ForgetPasswordRequest request, CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }

        [HttpPost("User/ChangePassword")]
        public async Task<IActionResult> ChangePassword(UpdatePasswordRequest request, CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }
    }
}
