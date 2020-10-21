#=
func:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-21
=#
fact(n::Int) = (
    n >= 0||error("");
    n == 0 && return 1 ;
    n*fact(n - 1)
 )

println("fact1:$(fact(10))")
 fact2(n::Int) = (
    n >= 0||error("");
    n == 0 ? 1 :    n*fact(n - 1)
 )
"fact2:$(fact2(11))" |> println
function fact3(n::Int)::Int
    if n < 0;
       error("")
    elseif n == 0;
      1
    else
      n*fact3(n - 1)
    end
end
"fact3:$(fact3(11))" |> println

fact4(n::Int)::Int =
    n < 0 ? error("") :
    n == 0 ? 1 :
    n*fact(n - 1);
"fact2:$(fact2(11))" |> println

func(x, y) = x + y,x*y
"func with tuple:$(func(1,2))" |> println

func((x, y)) = x + y,x*y
"func accept tuple:$(func((1,2)))" |> println

"func as lambda:$(((x)->x + x)(2))" |> println

fun(x, y) = x + y
fun3(x) = x + x
fun2(x) = x*x
"func composition:$((fun2 ∘ fun )(1,2))" |> println
"func pip:$( 2 |> fun3 |> fun2 )" |> println