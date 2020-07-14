using Base
using IncludeGuards

@includeonce "RootishArrayStructure.jl"

function Base.get(a::RootishArray, i::Int)
    b = _i2b(i)
    j = i - Int(b * (b + 1) / 2) + 1
    y = a.blocks[b][j]
    return a.blocks[b][j]
end

function set!(a::RootishArray, i::Int, x)
    b = _i2b(i)
    j = i - Int(b * (b + 1) / 2) + 1
    y = a.blocks[b][j]
    a.blocks[b][j] = x
    return y
end

