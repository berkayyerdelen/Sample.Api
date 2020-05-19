using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Sample.Api.Controllers.Base.v1
{
    [Route("api/v{version:apiVersion}/[controller]")]
    
    public class Basev1ApiController : ControllerBase
    {
    }
}