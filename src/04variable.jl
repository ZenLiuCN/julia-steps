#=
04variable:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-21
=#
const a = 1
try
global a = 2
catch e
    println(e)
    local x = 1 - 1
    "so local $x is a local" |> println
finally
    "so const is a const" |> println
    try
     "so local $x is a local" |> println
    catch e
      println("so local is not exits: $e")
    end
end