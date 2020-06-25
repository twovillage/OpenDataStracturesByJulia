using Test
include("../src/ArrayStack.jl")
include("../src/Utils.jl")
using .ArrayStack

function testArray(a, j, n, b)
    @test toArray(a) == b
    @test a.j == j
    @test a.baseArray.n == n
end

function testArray(a, n, b)
    @test toArray(a) == b
    @test a.baseArray.n == n
end

function testArray(a, b)
    @test toArray(a) == b
end

println("======start TestArray======")
include("TestArray.jl")
println("======end TestArray======")
println("======start TestQueue======")
include("TestQueue.jl")
println("======end TestQueue======")
println("======start TestDeque======")
include("TestDeque.jl")
println("======end TestDeque======")

