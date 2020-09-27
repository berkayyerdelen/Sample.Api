// Skipping function AddAuth(none, none), it contains poisonous unsupported syntaxes

func @_Sample.Api.Infrastructure.Jwt.AuthExtensions.UseAuth$Microsoft.AspNetCore.Builder.IApplicationBuilder$(none) -> none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :41 :8) {
^entry (%_app : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :41 :50)
cbde.store %_app, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :41 :50)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :43 :12) // Not a variable of known type: app
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :43 :12) // app.UseAuthentication() (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :45 :12) // Not a variable of known type: app
%4 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :45 :12) // app.UseAuthorization() (InvocationExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :47 :19) // Not a variable of known type: app
return %5 : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Jwt\\AuthExtensions.cs" :47 :12)

^1: // ExitBlock
cbde.unreachable

}
