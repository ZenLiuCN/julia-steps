# Julia CheatSheet

[TOC]



## document
1. `"inline document"`
2. `""" markdown block document"""`
## comment
1. `# inline comment`
2. `#= block comment =#`
## primitive type
### Integer
1. `Int`,`Uint` 32/64bit by platform;
2. `Int8|16|32|64|128`,`UInt8|16|32|64|128` Integer in bit
3. `Bool` `true` or `false` 8 bit
### float
1. `Float16|32|64` Float in bit
### literal
+ `0x` Hexadecimals
+ `0b` Binary
+ `0o` Octal
+ `_` digit separator
+ `.5f0` float32 literal
+ `.5` float64 literal
+ `1.5e2` float64 literal
+ `±Inf<16|32|>` float64 infinity
+ `NaN<16|32|>` not a number
## operator
### Arithmetic
+ `+` unary|binary;
+ `-` unary|binary;
+ `*` can be ignore;
+ `/` divide (float);
+ `\` inverse divide (float);
+ `\u00F7` divide (trunc to integer);
+ `^` power;
+ `%` remainder;
+ `!` Boolean not ;
### Bitwise
+ `~` unary not;
+ `&` and;
+ `|` or;
+ `⊻` xor;
+ `>>` shift right;
+ `>>>` logic shift right;
+ `<<` shift left;
### Numeric Comparison
+ `==` 
+ `!=` or `\u2260` `÷`
+ `<=` or `\u2264` `≥`
+ `<` 
+ `>` 
+ `>=` or `\u2265` `≤`
+ `isequal`
+ `isfinite`
+ `isinf`
+ `isnan`

### Special
+ `=` assign
+ `?=` apply assign(`?` is a binary operator)
+ `.?` broadcast or elementary (`?` is a binary operator)
+ `?.()`   broadcast or elementary (`?` is a function)
+ `:` range
## Strings
### literal
+ `'c'` Char (not byte, but unicode scalar value)
+ `"\"$(interprolation)"` 
+ `""""block string"""`

### macro

they are short for `@name_str`

+ `r"\x"` regex string
+ `raw"\x"` raw string
+ `b"\x1"` byte array
+ `v"1.3.2"` Version
+ `big"[\d]+[.]{0,1}[\d+]"` big Integer or big float
+ `ip"127.0.0.1"`
+ `doc""" some doc"""`
+ `html"<div></div>"`
+ `MIME"text/plan"`
### functions
+ `graphemes(String)` extract as Unicode Char
+ `String[idx]` index  (by scalar)
+ `String[idxindx]` slice  (by scalar)
+ `*` concatenation
+ `in` iterate (with `for` ) or contains
+ `string(xString...)` concatenation
+ `<,>,==,!=` compare

## Tuple

- `a,`
- `a, b`
- `a, b = xs`
- `()`
- `(a,)`
- `(a, b)`
- `(a, b...)`
- `Tuple{T, U, V}`
- `NTuple{N, T}`
- `Tuple{T, U, Vararg{V}}`

## Dictionary

+ `Dict("A"=>1,"B"=>2)`
+ `dict["A"]`

## Flow

- `for i in iter; ...; end`

- `for i in iter,j in iter2; ...; end`

- `while cond; ...; end`

- `break`

- `continue`

- `@parallel (op) for i in iter; ...; end`

- `@parallel for i in iter; ...; end`

- `@goto label`

- `@label label`

- `if cond; body; end`

- `if cond; body; else; body; end`

- `if cond; body; elseif cond; body; else; end`

- `if cond; body; elseif cond; body; end`

- `cond ? iftrue : iffalse`

- `cond && iftrue`

- `cond || iffalse`

- `ifelse(cond, iftrue, iffalse)`

  a simple fab is like this

  ```julia
  fab = x::BigInt->(x < 0&&error("must zero or positve");x == 0 ? 1 : x*fab(x - 1))
  @time for x in 1:100;fab(big(101)); end
  ```

  

## Enum

+ `@enum TYPE value=0 value value`
+ `Int(EnumValue)`
+ `Symbol("X")`
+ `:SYM`



## Functions

- `f(n) = ...`
- `function f(n) ... end`
- `n::Type`
- `x -> ...`
- `f(n) do ... end`

## Error and Exception

+ `try ... catch e;... end`
+ `try ... catch e;... finally ... ;end`
+ `throw()`
+ `error()`

## Shell Command

+ `` `commands` ``
+ ``run(`command with $x`)``