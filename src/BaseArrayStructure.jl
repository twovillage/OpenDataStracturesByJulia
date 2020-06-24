#= define DataStructure
    データ構造の定義
=#

# Array
mutable struct BaseArray{T}
    array::Vector{T}
    n::Int
end

export BaseArray
# constructors
function BaseArray{T}(size::Int) where T
    a = Vector{T}(undef,2size)
    n = size
    return BaseArray(a, n)
end

function BaseArray{T}(array::Vector{T}) where T
    n = length(array)
    resize!(array, 2length(array))
    return BaseArray(array, n)
end

# Queue and Dequeue
mutable struct ArrayQueue{T}
    baseArray::BaseArray{T}
    j::Int
end

export ArrayQueue
# constructors
function ArrayQueue{T}(size::Int) where T 
    return ArrayQueue(BaseArray{T}(size), 0)
end

function ArrayQueue{T}(array::Vector{T}) where T
    return ArrayQueue(BaseArray{T}(array), 0)
end

function ArrayQueue{T}(array::Vector{T}, j::Int, n::Int) where T
    b = BaseArray(array, n)
    return ArrayQueue(b, j)
end

# inner function _length
function _length(a::BaseArray)
    length(a.array)
end

function _length(a::ArrayQueue)
    length(a.baseArray.array)
end

# inner function _resize!
function _resize!(a::BaseArray)
    b = resize!(a.array, max(2 * a.n, 1))
    a.array = b
end

function _resize!(a::ArrayQueue)
    if length(a.baseArray.array) != 0
        a.baseArray.array = circshift(a.baseArray.array, -a.j)
    end
    _resize!(a.baseArray)
    a.j = 0
end

# count functions
export count
function Base.count(a::BaseArray)
    return a.n
end

function Base.count(a::ArrayQueue)
    return a.baseArray.n
end

# toArray function
export toArray
function toArray(a::BaseArray)
    return resize!(a.array, a.n)
end

function toArray(a::ArrayQueue{T}) where T
    n = a.baseArray.n
    b = Vector{T}(undef, n)
    for i = 1:n
        b[i] = get(a, i)
    end
    return b
end
