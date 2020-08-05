#= define DataStructure
    データ構造の定義
=#

# Array
mutable struct BaseArray{T}
    array::Vector{T}
    n::Int
end

# constructors
function BaseArray{T}(n::Int) where T
    a = Vector{T}(undef, max(2n, 1))
    return BaseArray(a, n)
end

function BaseArray{T}(array::Vector{T}) where T
    n = length(array)
    resize!(array, 2length(array))
    return BaseArray(array, n)
end

function BaseArray{T}(array::Vector{T}, len::Int, n::Int) where T
    resize!(array, len)
    return BaseArray(array, n)
end

# iterator
function Base.iterate(a::BaseArray, i::Int = 1)
    i == a.n + 1 && return nothing
    return (a.array[i], i + 1)
end

# inner function _length
function _length(a::BaseArray)
    length(a.array)
end

# inner function _resize!
function _resize!(a::BaseArray)
    b = resize!(a.array, max(2 * a.n, 1))
    a.array = b
end

# count function
function Base.count(a::BaseArray)
    return a.n
end

# toArray function
function toArray(a::BaseArray)
    b = deepcopy(a.array)
    return resize!(b, a.n)
end


