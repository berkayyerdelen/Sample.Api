// Skipping function Configure(none), it contains poisonous unsupported syntaxes

func @_Sample.Api.Infrastructure.Swagger.ConfigureSwaggerOptions.CreateInfoForApiVersion$Microsoft.AspNetCore.Mvc.ApiExplorer.ApiVersionDescription$(none) -> none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :23 :8) {
^entry (%_description : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :23 :51)
cbde.store %_description, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :23 :51)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :25 :23) // new OpenApiInfo()              {                  Title = "Sample API",                  Version = description.ApiVersion.ToString(),                  Contact = new OpenApiContact() { Name = "Oguz Berkay Yerdelen", Email = "berkayyerdelen@gmail.com" },                  License = new OpenApiLicense() { Name = "MIT", Url = new Uri("https://opensource.org/licenses/MIT") }              } (ObjectCreationExpression)
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :27 :24) // "Sample API" (StringLiteralExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :28 :26) // Not a variable of known type: description
%4 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :28 :26) // description.ApiVersion (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :28 :26) // description.ApiVersion.ToString() (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :29 :26) // new OpenApiContact() { Name = "Oguz Berkay Yerdelen", Email = "berkayyerdelen@gmail.com" } (ObjectCreationExpression)
%7 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :29 :56) // "Oguz Berkay Yerdelen" (StringLiteralExpression)
%8 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :29 :88) // "berkayyerdelen@gmail.com" (StringLiteralExpression)
%9 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :30 :26) // new OpenApiLicense() { Name = "MIT", Url = new Uri("https://opensource.org/licenses/MIT") } (ObjectCreationExpression)
%10 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :30 :56) // "MIT" (StringLiteralExpression)
%11 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :30 :77) // "https://opensource.org/licenses/MIT" (StringLiteralExpression)
%12 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :30 :69) // new Uri("https://opensource.org/licenses/MIT") (ObjectCreationExpression)
%14 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :33 :16) // Not a variable of known type: description
%15 = cbde.unknown : i1 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :33 :16) // description.IsDeprecated (SimpleMemberAccessExpression)
cond_br %15, ^1, ^2 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :33 :16)

^1: // SimpleBlock
%16 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :35 :16) // Not a variable of known type: info
%17 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :35 :16) // info.Description (SimpleMemberAccessExpression)
%18 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :35 :36) // " This API version has been deprecated." (StringLiteralExpression)
%19 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :35 :16) // Binary expression on unsupported types info.Description += " This API version has been deprecated."
// No identifier name for binary assignment expression
br ^2

^2: // JumpBlock
%20 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :38 :19) // Not a variable of known type: info
return %20 : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Infrastructure\\Swagger\\ConfigureSwaggerOptions.cs" :38 :12)

^3: // ExitBlock
cbde.unreachable

}
