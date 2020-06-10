using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Sample.Api.Controllers.Base.v1
{
    [Route("api/v{version:apiVersion}/[controller]")]
    public abstract class Basev1ApiController<T> : ControllerBase
    {
       
        private IMediator _mediator;
        private ILogger<T> logger;
        protected IMediator Mediator => _mediator ??= HttpContext.RequestServices.GetService<IMediator>();
        protected ILogger<T> Logger => logger ?? HttpContext.RequestServices.GetService<ILogger<T>>();


        //precoty precoja84
    }
}