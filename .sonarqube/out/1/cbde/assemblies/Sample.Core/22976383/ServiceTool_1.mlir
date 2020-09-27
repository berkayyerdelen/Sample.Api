func @_Sample.Core.Common.ServiceTool.CreateService$Microsoft.Extensions.DependencyInjection.IServiceCollection$(none) -> () loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Core\\Common\\ServiceTool.cs" :9 :8) {
^entry (%_serviceCollection : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Core\\Common\\ServiceTool.cs" :9 :41)
cbde.store %_serviceCollection, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Core\\Common\\ServiceTool.cs" :9 :41)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Core\\Common\\ServiceTool.cs" :11 :30) // Not a variable of known type: serviceCollection
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Core\\Common\\ServiceTool.cs" :11 :30) // serviceCollection.BuildServiceProvider() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
