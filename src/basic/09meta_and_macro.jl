#=
09meta_and_micro:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-22
=#
macro  doit(name)
    :(println("hello ",$name))
end

@doit("what")
# meta
"this is a expression"
ex=:(1+1*2|>println)
typo(x)=x|>typeof|>println
"check type"
ex|>typo
"eval in current scope"
eval(ex)
"dump is useful to check a Expr"
dump(ex)
"@time is use to check eval time"
@time ex|>dump