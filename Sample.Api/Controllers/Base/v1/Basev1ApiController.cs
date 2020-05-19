using Microsoft.AspNetCore.Mvc;

namespace Sample.Api.Controllers.Base.v1
{
    [Route("api/v{version:apiVersion}/[controller]")]
    public class Basev1ApiController : ControllerBase
    {
    }
}