module OpenDataStractures

include("ArrayStack.jl")
using .ArrayStack

a = BaseArray{Int}(0)
for i = 1:10
    add!(a, i, i)
end

remove!(a, 5)

for i = 1:a.n
    println(a.array[i])
end

end # module
