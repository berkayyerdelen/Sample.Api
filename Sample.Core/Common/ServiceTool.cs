using System;
using Microsoft.Extensions.DependencyInjection;

namespace Sample.Core.Common
{
    public static class ServiceTool
    {
        public static IServiceProvider ServiceProvider { get; set; }

        public static void CreateService(IServiceCollection serviceCollection)
        {
            ServiceProvider = serviceCollection.BuildServiceProvider();
        }
    }
}