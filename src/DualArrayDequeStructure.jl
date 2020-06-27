# DualArrayDeque
mutable struct DualArrayDeque{T}
    front::BaseArray{T}
    back::BaseArray{T}
end

export DualArrayDeque
# constructors
function DualArrayDeque{T}(n::Int) where T
    if n <= 1
        front = BaseArray{T}(n)
        back = BaseArray{T}(0)
    else
        harf_n = div(n, 2)
        front = BaseArray{T}(n - harf_n)
        back = BaseArray{T}(harf_n)
    end
    return DualArrayDeque{T}(front, back)
end

function DualArrayDeque{T}(array::Vector{T}) where T
    len = length(array)
    harf_len = div(len, 2)
    len_front = len - harf_len
    front = BaseArray(len_front)
    back = BaseArray(harf_len)

    # insert front array
    for  i = 1:len_front
        set!(front, i, array[len_front + 1 -i])
    end

    # insert back array
    if harf_len > 0
        for i = 1:harf_len
            set!(back, i, array[len_front + i])
        end
    end

    return DualArrayDeque(front, back)
end