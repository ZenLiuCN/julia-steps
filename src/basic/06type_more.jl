#=
06type_more:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-22
=#
# constructor
mutable struct StructWith{T}
    some::T
    StructWith(x::Int) = new{Int}(x) # inner
    StructWith(x::Float64) = new{Float64}(x)# inner with float
end
# outer
StructWith() = StructWith(0)

StructWith(1) |> println
StructWith() |> println
StructWith(2.3) |> println

mutable struct StructWithStruct{T}
    some::StructWith{T}
    StructWithStruct(x::Float64) = new{Float64}(StructWith(x))# inner with float
end
StructWithStruct(4.5) |> println

# interface
#=
 interface is just a method
=#
Base.length(::Type{StructWith{Int}})=Int
Base.length(x::StructWith{Int})=x.some
Base.size(x::StructWith{<:Real})=(x.some,)
StructWith(2)|> length |> println
StructWith(2)|> size |> println