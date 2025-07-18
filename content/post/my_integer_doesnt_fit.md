+++
title = "My Integer Doesn't fit"
date = 2025-07-18T13:22:45+09:00
tags = ["math", "programming"]
+++

I was playing on my computer and accidentally tried this expression to see what the computer would output:

```julia
julia> 9007199254740992.0 + 1.0 == 9007199254740992.0
```

The REPL output was:

```julia
julia> 9007199254740992.0 + 1.0 == 9007199254740992.0
true
```

This is obviously incorrect mathematically. However, this arbitrary number is the maximum integer that a 64-bit float can store. In Julia, this number can be found using the `maxintfloat` function with the `Float64` type:

```julia
julia> maxintfloat(Float64) + 1 == maxintfloat(Float64)
true
```

Interestingly enough, adding two "fixes" the comparison:

```julia
julia> maxintfloat(Float64) + 2 == maxintfloat(Float64)
false
```

Other float types also have their own largest integer values that they can represent:

```julia
julia> maxintfloat(Float64)
9.007199254740992e15

julia> maxintfloat(Float32)
1.6777216f7

julia> maxintfloat(BigFloat)
1.15792089237316195423570985008687907853269984665640564039457584007913129639936e+77
```

I guess the takeaway is that using something like `Float32` for variables that store amounts of money is not advisable, as you run the risk of losing valuable information for large amounts. `Float64` might suffice, but it also has its limitations. On the other hand, integer types can store much larger integer values:

```julia
julia> typemax(Int64)
9223372036854775807

julia> typemax(Int32)
2147483647
```

The maximum value for a 64-bit integer is three orders of magnitude larger than its float counterpart:

```julia
julia> typemax(Int64) / maxintfloat(Float64)
1024.0

julia> typemax(Int32) / maxintfloat(Float32)
128.0f0
```
