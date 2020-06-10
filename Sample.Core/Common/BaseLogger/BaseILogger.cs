using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Sample.Core.Common.BaseLogger
{
    public abstract class BaseILogger<T>
    {
        public ServiceTool Type { get; set; }
        public IServiceCollection ServiceCollection { get; set; }
        public IServiceProvider  ServiceProvider { get; set; }

        public BaseILogger()
        {
            Type= new ServiceTool();
        }
        private ILogger<T> logger;

        protected ILogger<T> Logger =>
            Type.CreateService(serviceCollection: ServiceCollection, serviceProvider: ServiceProvider).GetService<ILogger<T>>();

    }

}