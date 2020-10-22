#=
primitive:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-21
=#
# integer
Int(1) |> typeof |> println
UInt8(2) |> typeof |> println
# float
Float16(2) |> typeof |> println
2.0 |> typeof |> println
# bigint
big"123" |> typeof |> println
big"1.23" |> typeof |> println
# ∞
Inf |> typeof |> println
(Inf == Inf) |> typeof |> println
#rational
(1//3) |> typeof |> println
(1//3) |> numerator |> typeof |> println
#broadcast
(1//3) .|> (numerator,denominator) |> println
# string
'a' |> typeof |> println
"a" |> typeof |> println
"index start 1"
"a"[1] |> typeof |> println
"a,b,c"[1:3] |> println
"a,b,c"[1:end] |> println
"index is base on Unicode Code Point"
try "a,中,c"[1:4] |> println catch x;"error index $(x)" |> println end
"convert to a tuple"
Tuple("a,b,c") .|>(Char,Char,Char,Char,Char) |> println
"link two or more string"
"a"*"a"|>println

"""
    xa
""" |> println
r"\x" |> println
raw"\x" |> println
b"\x232" |> println
# component
0x0.4p-1 |>typeof|>println
0x0.4p-1 |>println