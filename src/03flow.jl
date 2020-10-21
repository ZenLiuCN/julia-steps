#=
flow:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-21
=#
#block
begin
    println("a block")
end
# for in
for x in 1:2; x |> print end

for x ∈ 1:2; x |> print end
# while
i = 0
while i < 3; global i+=1 ;i |> println end
"------" |> println
# for for
for i in 1:2,j in 3:4 ; (i,j) |> println end
"------" |> println
for i in 1:2,j in 3:4,z in 4:6 ; (i,j,z) |> println end
"------" |> println
# error & exception
try error("oho") catch x println(x) end
try
    error("oho")
catch x
  println("first error $x");
    try
        DomainError(nothing)|>throw;
    catch y;
        y|>println
    end
finally
    "final"|>println
end