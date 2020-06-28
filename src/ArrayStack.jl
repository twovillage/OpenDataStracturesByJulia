
using Base
using IncludeGuards

@includeonce "BaseArrayStructure.jl"

function Base.get(a::BaseArray, i::Int)
    return a.array[i]
end

function set!(a::BaseArray, i::Int, x)
    a.array[i] = x
end

# add! functions
function add!(a::BaseArray, i::Int, x)
    if count(a) >= _length(a) 
        _resize!(a)
    end
    for j = count(a):-1:i
        a.array[j + 1] = a.array[j]
    end
    a.array[i] = x
    a.n += 1
end

# remove! functions
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
