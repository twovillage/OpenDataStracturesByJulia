include("ArrayStack.jl")
using .ArrayStack

a = ArrayQueue{Int}([0, 0, 1, 2, 3])
remove!(a)
remove!(a)


println("===add===")
for i = 1:2
    add!(a, i)
    println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)
end

println("===remove===")
for i = 1:2
    println("pop = ", remove!(a))
    println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)
end
println("===add===")
for i = 1:3
    add!(a, i)
    println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)
end