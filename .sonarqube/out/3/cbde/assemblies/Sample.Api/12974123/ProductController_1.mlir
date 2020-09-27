// Skipping function Get(none), it contains poisonous unsupported syntaxes

// Skipping function DeleteProduct(none, none), it contains poisonous unsupported syntaxes

// Skipping function UpsertProduct(none, none), it contains poisonous unsupported syntaxes

func @_Sample.Api.Controllers.ProductController.Put$int.string$(i32, none) -> () loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Controllers\\ProductController.cs" :70 :8) {
^entry (%_id : i32, %_value : none):
%0 = cbde.alloca i32 loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Controllers\\ProductController.cs" :71 :24)
cbde.store %_id, %0 : memref<i32> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Controllers\\ProductController.cs" :71 :24)
%1 = cbde.alloca none loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Controllers\\ProductController.cs" :71 :32)
cbde.store %_value, %1 : memref<none> loc("C:\\Users\\Berkay Yerdelen\\source\\repos\\berkayyerdelen\\Sample.Api\\Sample.Api\\Controllers\\ProductController.cs" :71 :32)
br ^0

^0: // ExitBlock
return

}
// Skipping function GetProductByName(none), it contains poisonous unsupported syntaxes

