using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Sample.Api.Controllers.Base.v1;
using Sample.Infrastructure.Identity.Domain.Commands.CreateRole;

namespace Sample.Api.Controllers
{
    [ApiVersion("1.0")]
    [ApiController]
    public class RoleController : Basev1ApiController<AuthController>
    {
        [HttpPost("CreateRole")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateRole(CreateRoleRequest request, CancellationToken ct)
        {
            return Ok(await Mediator.Send(request, ct).ConfigureAwait(false));
        }
    }
}
