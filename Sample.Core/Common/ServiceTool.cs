using System;
using Microsoft.Extensions.DependencyInjection;

namespace Sample.Core.Common
{
    public  class ServiceTool
    {
        public  IServiceProvider ServiceProvider { get; set; }

        public IServiceProvider CreateService(IServiceCollection serviceCollection, IServiceProvider serviceProvider)
        {
            ServiceProvider = serviceProvider;
            ServiceProvider = serviceCollection.BuildServiceProvider();
            return ServiceProvider;
        }
    }
}