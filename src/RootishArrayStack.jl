using Base
using IncludeGuards

@includeonce "RootishArrayStructure.jl"

# get for RootishArray
function Base.get(a::RootishArray, i::Int)
    b = _i2b(i)
    j = i - Int((b - 1) * b / 2)
    return get(a.blocks, b)[j]
end


# set! for RootishArray
function set!(a::RootishArray, i::Int, x)
    b = _i2b(i)
    j = i - Int((b - 1) * b/ 2)
    c = get(a.blocks, b)
    y = c[j]
    c[j] = x
    set!(a.blocks, b, c)
    return y
end


function grow!(a::RootishArray{T}) where T
    add!(a.blocks, count(a.blocks) + 1, Vector{T}(undef, count(a.blocks) + 1))
end

# add! for RootishArray
function add!(a::RootishArray, i::Int, x)
    r = count(a.blocks)
    if div(r * (r + 1) , 2) < count(a) + 1
        grow!(a)
    end
    a.n += 1
    for j = count(a):-1:i + 1
        set!(a, j, get(a, j - 1))
    end
    set!(a, i, x)
    
end

function shrink!(a::RootishArray)
    r = count(a.blocks)
    remove!(a.blocks, r)
end

# remove! for RootishArray
function remove!(a::RootishArray, i::Int)
    x = get(a, i)
    for j = i:count(a) - 1
        set!(a, j, get(a, j + 1))
    end
    a.n -=1
    r = count(a.blocks)
    println(div((r - 1) * r, 2), " ", count(a))
    if div((r - 1) * r, 2) >= count(a)
        shrink!(a)
    end
    return x
end


