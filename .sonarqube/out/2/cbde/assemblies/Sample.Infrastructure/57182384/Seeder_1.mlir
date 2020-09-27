func @_Sample.Infrastructure.Seeder.Seed$Microsoft.EntityFrameworkCore.ModelBuilder$(none) -> () loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :10 :8) {
^entry (%_modelBuilder : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :10 :32)
cbde.store %_modelBuilder, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :10 :32)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :12) // Not a variable of known type: modelBuilder
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :12) // modelBuilder.Entity<Product>() (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :63) //  (OmittedArraySizeExpression)
%4 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :55) // Product[] (ArrayType)
%5 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :51) // new Product[]              {                  new Product()                  {                      Name = "MSI",                      CreatedDate =DateTime.Now,                      Id = 1                  },                  new Product()                  {                      Name = "Dell",                      CreatedDate = DateTime.Now,                      Id = 2                  },                  new Product()                  {                      Id = 3,                      Name = "HP",                      CreatedDate = DateTime.Now                  }              } (ArrayCreationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :14 :16) // new Product()                  {                      Name = "MSI",                      CreatedDate =DateTime.Now,                      Id = 1                  } (ObjectCreationExpression)
%7 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :16 :27) // "MSI" (StringLiteralExpression)
// Entity from another assembly: DateTime
%8 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :17 :33) // DateTime.Now (SimpleMemberAccessExpression)
%9 = constant 1 : i32 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :18 :25)
%10 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :20 :16) // new Product()                  {                      Name = "Dell",                      CreatedDate = DateTime.Now,                      Id = 2                  } (ObjectCreationExpression)
%11 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :22 :27) // "Dell" (StringLiteralExpression)
// Entity from another assembly: DateTime
%12 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :23 :34) // DateTime.Now (SimpleMemberAccessExpression)
%13 = constant 2 : i32 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :24 :25)
%14 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :26 :16) // new Product()                  {                      Id = 3,                      Name = "HP",                      CreatedDate = DateTime.Now                  } (ObjectCreationExpression)
%15 = constant 3 : i32 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :28 :25)
%16 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :29 :27) // "HP" (StringLiteralExpression)
// Entity from another assembly: DateTime
%17 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :30 :34) // DateTime.Now (SimpleMemberAccessExpression)
%18 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\Seeder.cs" :12 :12) // modelBuilder.Entity<Product>().HasData(new Product[]              {                  new Product()                  {                      Name = "MSI",                      CreatedDate =DateTime.Now,                      Id = 1                  },                  new Product()                  {                      Name = "Dell",                      CreatedDate = DateTime.Now,                      Id = 2                  },                  new Product()                  {                      Id = 3,                      Name = "HP",                      CreatedDate = DateTime.Now                  }              }) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
