using IncludeGuards

@includeonce "../src/ArrayStack.jl"

# Queue and Deque
mutable struct QueueArray{T}
    baseArray::BaseArray{T}
    j::Int
end

export QueueArray
# constructors
function QueueArray{T}(size::Int) where T 
    return QueueArray(BaseArray{T}(size), 0)
end

function QueueArray{T}(array::Vector{T}) where T
    return QueueArray(BaseArray{T}(array), 0)
end

function QueueArray{T}(array::Vector{T}, j::Int, n::Int) where T
    b = BaseArray(array, n)
    return QueueArray(b, j)
end

# inner function _length
function _length(a::QueueArray)
    length(a.baseArray.array)
end

# inner function _resize!
function _resize!(a::QueueArray)
    if length(a.baseArray.array) != 0
        a.baseArray.array = circshift(a.baseArray.array, -a.j)
    end
    _resize!(a.baseArray)
    a.j = 0
end

# count functions
function Base.count(a::QueueArray)
    return a.baseArray.n
end

# toArray function
function toArray(a::QueueArray{T}) where T
    n = a.baseArray.n
    b = Vector{T}(undef, n)
    for i = 1:n
        b[i] = get(a, i)
    end
    return b
end