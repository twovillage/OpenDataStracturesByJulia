using Base
using IncludeGuards

@includeonce "ArrayStack.jl"
@includeonce "QueueStructure.jl"

export get
function Base.get(a::QueueArray, i::Int)
    # Insert 1 and -1, Julia counts arrays from 1.
    return get(a.baseArray, (a.j + i - 1) % _length(a) + 1)
end

export set!
function set!(a::QueueArray, i::Int, x) 
    # Insert 1 and -1, Julia counts arrays from 1.
    set!(a.baseArray, (a.j + i - 1) % _length(a) + 1, x)
end

export add!
function add!(a::QueueArray, x)
    if count(a) >= _length(a)
        _resize!(a)
    end
    set!(a.baseArray, (a.j + count(a)) % _length(a) + 1, x)
    a.baseArray.n += 1
end

export remove!
function remove!(a::QueueArray)
    x = get(a, a.j + 1)
    a.j = (a.j + 1) % _length(a)
    a.baseArray.n -= 1

    if _length(a) >= 3 * count(a)
        _resize!(a)
    end
    return x
end