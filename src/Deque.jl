using Base
using IncludeGuards
@includeonce "QueueStructure.jl"
@includeonce "ArrayQueue.jl"
@includeonce "DualArrayDequeStructure.jl"

# get for DualArrayDeque
function Base.get(a::DualArrayDeque, i::Int)
    if i <= count(a.front)
        return get(a.front, count(a.front) + 1 - i)
    else
        return get(a.back, i - count(a.front))
    end
end

# set! for DualArrayDeque
function set!(a::DualArrayDeque{T}, i::Int, x::T) where T
        if i <= count(a.front)
            return set!(a.front, count(a.front) + 1 - i, x)
        else
            return set!(a.back, i - count(a.front), x)
        end
end

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

# inner function _balance!
function _balance!(a::DualArrayDeque{T}) where T
    if 3 * count(a.front) < count(a.back) || 3 * count(a.back) < count(a.front)
        n = count(a)
        harf_n = div(n, 2)
        n_front = n - harf_n
        front = BaseArray{T}(max(n_front, 1))
        for i = 1:n_front
            set!(front, n_front + 1- i, get(a, i))
        end
        back = BaseArray{T}(max(harf_n, 1))
        for i = 1:harf_n
            set!(back, i, get(a, n_front + i))
        end

        a.front = front
        a.back = back
    end
end  

# add! for DualArrayDeque
function add!(a::DualArrayDeque, i::Int, x)
    if i <= count(a.front)
        add!(a.front, count(a.front) + 1 - i, x)
    else
        add!(a.back, i - count(a.front), x)
    end
    _balance!(a)
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

# remove for DualArrayDeque
function remove!(a::DualArrayDeque, i::Int)
    if i <= count(a.front)
        x = remove!(a.front, count(a.front) + 1 - i)
    else
        x = remove!(a.back, i - count(a.front))
    end
    _balance!(a)
end