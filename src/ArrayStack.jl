
using Base

module ArrayStack

include("BaseArrayStructure.jl")

export get
function Base.get(a::BaseArray, i::Int)
    return a.array[i]
end

function Base.get(a::ArrayQueue, i::Int)
    return get(a.baseArray, i)
end

export set!
function set!(a::BaseArray, i::Int, x)
    a.array[i] = x
end

function set!(a::ArrayQueue, i::Int, x)  
    set!(a.baseArray, i, x)
end

# add! functions
export add!
function add!(a::BaseArray, i::Int, x)
    if count(a) + 1 >= _length(a) 
        _resize!(a)
    end
    for j = count(a):-1:i
        a.array[j + 1] = a.array[j]
    end
    a.array[i] = x
    a.n += 1
end

function add!(a::ArrayQueue, x)
    if count(a) + 1 >= _length(a)
        _resize!(a)
    end
    set!(a.baseArray, (a.j + count(a)) % _length(a) + 1, x)
    a.baseArray.n += 1
end

# remove! functions
export remove!
function remove!(a::BaseArray, i::Int)
    x = a.array[i]
    for j = i:count(a) - 1
        a.array[j] = a.array[j + 1]
    end
    a.n -= 1

    if _length(a) >= 3 * count(a)
        _resize!(a)
    end

    return x    
end

function remove!(a::ArrayQueue)
    x = get(a, a.j + 1)
    a.j = (a.j + 1) % _length(a)
    a.baseArray.n -= 1

    if _length(a) >= 3 * count(a)
        _resize!(a)
    end
    return x
end

end
