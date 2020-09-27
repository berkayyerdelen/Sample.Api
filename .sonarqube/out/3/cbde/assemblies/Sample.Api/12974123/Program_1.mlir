func @_Sample.Api.Program.Main$string$$$(none) -> () loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :9 :8) {
^entry (%_args : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :9 :32)
cbde.store %_args, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :9 :32)
br ^0

^0: // SimpleBlock
// Entity from another assembly: NLogBuilder
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :11 :51) // "nlog.config" (StringLiteralExpression)
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :11 :25) // NLogBuilder.ConfigureNLog("nlog.config") (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :11 :25) // NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger() (InvocationExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: CreateHostBuilder
%5 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :12 :30) // Not a variable of known type: args
%6 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :12 :12) // CreateHostBuilder(args) (InvocationExpression)
%7 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :12 :12) // CreateHostBuilder(args).Build() (InvocationExpression)
%8 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Program.cs" :12 :12) // CreateHostBuilder(args).Build().Run() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
// Skipping function CreateHostBuilder(none), it contains poisonous unsupported syntaxes

