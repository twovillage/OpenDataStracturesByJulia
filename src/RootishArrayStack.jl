using Base
using IncludeGuards

@includeonce "RootishArrayStructure.jl"

function Base.get(a::RootishArray, i::Int)
    b = _i2b(i)
    j = i - Int((b - 1) * b / 2)
    println(b, " ", j)
    return get(a.blocks, b)[j]
end

function set!(a::RootishArray, i::Int, x)
    b = _i2b(i)
    j = i - Int((b - 1) * b/ 2)
    c = get(a.blocks, b)
    y = c[j]
    c[j] = x
    set!(a.blocks, b, c)
    return y
end
