
using Base

module ArrayStack

include("BaseArrayStructure.jl")

export get
function Base.get(a::BaseArray, i::Int)
    return a.array[i]
end

function Base.get(a::ArrayQueue, i::Int)
    # Insert 1 and -1, Julia counts arrays from 1.
    return get(a.baseArray, (a.j + i - 1) % _length(a) + 1)
end

export set!
function set!(a::BaseArray, i::Int, x)
    a.array[i] = x
end

function set!(a::ArrayQueue, i::Int, x) 
    # Insert 1 and -1, Julia counts arrays from 1.
    set!(a.baseArray, (a.j + i - 1) % _length(a) + 1, x)
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
    if count(a) >= _length(a)
        _resize!(a)
    end
    set!(a.baseArray, (a.j + count(a)) % _length(a) + 1, x)
    a.baseArray.n += 1
end

# add for Dequeue 
function add!(a::ArrayQueue, i::Int, x)
    if count(a) + 1 >= _length(a)
        _resize!(a)
    end

    if i < div(count(a), 2)
        a.j = (a.j == 0) ? _length(a) - 1 : a.j - 1
        for k = 0:i-2
            set!(a.baseArray, (a.j + k) % _length(a) + 1, get(a.baseArray, (a.j + k + 1) % _length(a) + 1))
        end
    else
        for k = count(a):-1:i + 1
            set!(a.baseArray, (a.j + k) % _length(a) + 1, get(a.baseArray, (a.j + k - 1) % _length(a) + 1))
        end 
    end
    set!(a.baseArray, (a.j + i) % _length(a) + 1, x)
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

# remove for Dequeue
function remove!(a::ArrayQueue, i::Int)
    x = get(a, i)
    if (i < div(count(a), 2))
        for k = i:-1:0
            set!(a.baseArray, (a.j + k + 1) % _length(a) + 1, get(a.baseArray, (a.j + k) % _length(a) + 1))
        end
        a.j = (a.j + 1) % _length(a)
    else
        for k = i:count(a)
            set!(a.baseArray, (a.j + k + 1) % _length(a) + 1, get(a.baseArray, (a.j + k + 2) % _length(a) + 1))
        end  
    end
    a.baseArray.n -= 1

    if 3 * count(a) < _length(a)
        _resize!(a)
    end
    return x
end

end
