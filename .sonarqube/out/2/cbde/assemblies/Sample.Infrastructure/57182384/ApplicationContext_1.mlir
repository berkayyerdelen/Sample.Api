func @_Sample.Infrastructure.ApplicationContext.OnModelCreating$Microsoft.EntityFrameworkCore.ModelBuilder$(none) -> () loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :18 :8) {
^entry (%_modelBuilder : none):
%0 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :18 :48)
cbde.store %_modelBuilder, %0 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :18 :48)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :20 :12) // base (BaseExpression)
%2 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :20 :41) // Not a variable of known type: modelBuilder
%3 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :20 :12) // base.OnModelCreating(builder:modelBuilder) (InvocationExpression)
%4 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :21 :12) // Not a variable of known type: modelBuilder
%5 = cbde.unknown : none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Infrastructure\\ApplicationContext.cs" :21 :12) // modelBuilder.Seed() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
