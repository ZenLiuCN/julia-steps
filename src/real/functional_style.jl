#=
functional_style:
- Julia version: 1.5.2
- Author: Zen.Liu
- Date: 2020-10-22
=#
using Test
"""
    currying
"""
currying(f, x) = (xs...)->f(x,xs...)
#
⋎(f, x) = (xs...)->f(x,xs...)
# try it
extendPnt = currying(println,"hello the currying of ")
1 |> extendPnt
# as sugar
1 |> (println ⋎ "a " ⋎ "c ")
"""
    common style
"""

S = f->g->z->f(z)(g(z))
K = x->y->x
I = x->x
for f in (:S, :K, :I)
    @eval Base.show(io::IO, ::typeof($f)) = print(io, $(string(f)))
    @eval Base.show(io::IO, ::MIME"text/plain", ::typeof($f)) = show(io, $f)
end
show(io::IO, s::typeof(S(I))) = print(io, "S(", s.f, ')')
show(io::IO, s::typeof(S(I)(I))) =
    print(io, "S(", s.f, ')', '(', s.g, ')')
show(io::IO, k::typeof(K(I))) = print(io, "K(", k.x, ')')
show(io::IO, ::MIME"text/plain", f::Union{
    typeof(S(I)),
    typeof(S(I)(I)),
    typeof(K(I))
}) = show(io, f)

S |> show
K |> show
I |> show