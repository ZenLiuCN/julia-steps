"""
# module 07module

- Julia version: 
- Author: Zen.Liu
- Date: 2020-10-22

# Examples

```jldoctest
julia>
```
"""
module Modular
    using Base64
    import Base64: base64encode

    export SomeInt,my_hash,my_show # export a type and functions
    struct SomeInt int::Int;SomeInt(x::Int) = new(x) end
    my_show(x::SomeInt) = println(x);nothing
    my_hash(x::SomeInt) = base64encode(x.int)
end
module Y
    import  Main.Modular
    using Main.Modular: my_show
    # if not specifiacted, will import all exported elements into current scope
    doit() = (
     my_show(Main.Modular.SomeInt(2));
     Main.Modular.my_hash(Main.Modular.SomeInt(204446)) |> println
    )
end
Y.doit()
# baremodule only with Core imported.otherwise Base Core will be both imported
baremodule Bare
  using Base: println
  __init__()=println("init function");nothing
  oho()=  println(1)
end
Bare.oho()