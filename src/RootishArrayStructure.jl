using Base
using IncludeGuards

@includeonce "ArrayStack.jl"
mutable struct RootishArray{T}
    blocks::BaseArray{Vector{T}}
    n::Int
end

# inner function
# _i2b
function _i2b(n)
    Int(ceil((sqrt(1 + 8n) - 1) / 2)) 
end

function _sum(b)
    div(b * (b + 1) , 2)
end

# constructor
function RootishArray{T}(array::Vector{T}) where T
    n = length(array)
    r = _i2b(n)
    blocks = BaseArray{Vector{T}}(r)
    for i=1:r
        endIndex = _sum(i)
        if endIndex > n
            block = array[_sum(i - 1) + 1:end]
            resize!(block, i)
        else
            block = array[_sum(i - 1) + 1:endIndex]
        end
        set!(blocks, i, block)
    end

    return RootishArray{T}(blocks, n)
end

function Base.count(a::RootishArray)
    return a.n
end

# toArray function
function toArray(a::RootishArray)
    b = []
    for block in a.blocks
        b = vcat(b, block)
    end
    resize!(b, a.n)
    return b
end