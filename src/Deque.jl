
using IncludeGuards
@includeonce "QueueStructure.jl"
@includeonce "ArrayQueue.jl"

# add for Deque 
function add!(a::QueueArray, i::Int, x)
    if count(a) >= _length(a)
        _resize!(a)
    end

    if i - 1 < div(count(a), 2)
        a.j = (a.j == 0) ? _length(a) - 1 : a.j - 1

        for k = 1:i - 1
            set!(a, k, get(a, k + 1))
        end
    else
        for k = count(a) + 1:-1:i + 1
            set!(a, k, get(a, k - 1))
        end 
    end
    set!(a, i, x)
    a.baseArray.n += 1
end

# remove for Deque
function remove!(a::QueueArray, i::Int)
    x = get(a, i)
    if i -1 < div(count(a), 2)
        for k = i:-1:2
            set!(a, k, get(a, k - 1))
        end
        a.j = (a.j + 1) % _length(a)
    else
        for k = i:count(a)
            set!(a, k, get(a, k + 1))
        end  
    end
    a.baseArray.n -= 1

    if 3 * count(a) < _length(a)
        _resize!(a)
    end
    return x
end