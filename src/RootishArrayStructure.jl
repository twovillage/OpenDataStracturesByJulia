mutable struct RootishArray{T}
    blocks::Vector{Vector{T}}
    n::Int
end

# inner function
# _i2b
function _i2b(n)
    Int(ceil((sqrt(1 + 8n) - 1) / 2)) 
end

function _sum(b)
    Int(div(b * (b + 1) , 2))
end

# constructor
function RootishArray{T}(array::Vector{T}) where T
    n = length(array)
    r = _i2b(n)
    blocks = Vector{Vector{T}}(undef, r)
    for i=1:r
        endIndex = _sum(i)
        if endIndex > n
            block = array[_sum(i - 1) + 1:end]
            resize!(block, i)
        else
            block = array[_sum(i - 1) + 1:endIndex]
        end
        blocks[i] = block
    end

    return RootishArray{T}(blocks, n)

end