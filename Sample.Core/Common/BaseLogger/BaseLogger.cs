using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Sample.Core.Common.BaseLogger
{
    public abstract class BaseLogger<T>
    {
     
        private ILogger<T> logger;
        protected ILogger<T> Logger =>
            logger ?? ServiceTool.ServiceProvider.GetService<ILogger<T>>();

    }

}