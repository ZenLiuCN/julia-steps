#=
tes:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-22
=#
(1 in 5:8 ||false ) |> println
(1 in 1:8 ||false) |> println
('1' in "1234" ||false) |> println
('1' in "234" ||false) |> println
("123"[1:2]) |> println
("123"[1:end]) |> println
("123"[1:end - 1]) |> println
run(`ls`)
dict = Dict("A" => 1,:b => 2)
dict |> println
dict["A"] |> println
dict[:b] |> println
fab = x::BigInt->(x < 0&&error("must zero or positve");x == 0 ? 1 : x*fab(x - 1))
@time for x in 100:1000;fab(big(x)); end
@enum 周 周一=1 周二=2 周三=3
周一|>typeof|>println
