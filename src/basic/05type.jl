#=
type:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-21
=#
#=
primitive type LongLong <: Signed 128 end

Longlong(128) |> typeof |> println=#
struct A
    bar::Int
end
A(8) |> println ∘ typeof
A(8) |> println
# immutable
try
    x = A(9)
    x.bar = 1
catch e
    e |> println
end
mutable struct MutA
    bar::Int
end
try
    x = MutA(9)
    fieldnames(MutA) .|> println
    x |> println
    x.bar = 1
    x |> println
catch e
    e |> println
end
# union
IntOrStringOrA = Union{Int,String,A}
A(1)::IntOrStringOrA |> println
1::IntOrStringOrA |> println
"1c"::IntOrStringOrA |> println
# Generic or parameter type
struct Point{T}
           x::T
           y::T
end
Point(1.2,3.4) |> println ∘ typeof
Point(1.2,3.4)::Point |> println
try Point(1.2,3.4)::Point{Int} |> println catch e; "a error $e" |> println end

# multiple dispatch coming
function norm(p::Point{Int})
         println("int $(p.x) $(p.y)");nothing
end
function norm(p::Point{<: Float64})
      println("float $(p.x) $(p.y)");nothing
end
function norm(p::Point{<: Real})
     println("real $(p.x) $(p.y)");nothing
end

Point(1,2) |> norm

Point(1.2,2.2) |> norm

Point(1//2,2//2) |> norm

# type alias
const Identity = UInt64
Identity(123) |> println ∘ typeof
UInt64(123)::Identity |> println ∘ typeof

# type op
isa(UInt64(123) , Identity) |> println

# abstract and inherit
abstract type Person end
struct Male <: Person end
struct Female <: Person end

isa(Female(),Person) |> println
isa(Male(),Person) |> println
supertype(Male) |> println
# enums
@enum WeekDays 周一=1 周二 周三 周四 周五 周六 周日
周一|>typeof|>println
Int(周日)|>println
# Symbol
const star=Set([:★,:☆])
:★|>typeof|>println
:★|>println
isequal(:★,:☆)|>println