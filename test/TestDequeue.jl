a = ArrayQueue{Char}(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'])
println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)

@debuglog remove!(a, 2) a
println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)

@debuglog add!(a, 4, 'x') a
println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)

@debuglog add!(a, 3, 'y') a
println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)

@debuglog add!(a, 3, 'z') a
println("j= ", a.j, " n= ", count(a), " array= ", a.baseArray.array)
