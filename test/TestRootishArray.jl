@show a = RootishArray{Char}(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'])

@debuglog add!(a, 3, 'x') a
testArray(a, ['a', 'b', 'x', 'c', 'd', 'e', 'f', 'g', 'h'])

@debuglog remove!(a, 2) a
testArray(a, ['a', 'x', 'c', 'd', 'e', 'f', 'g', 'h'])

@debuglog remove!(a, 8) a
testArray(a, ['a', 'x', 'c', 'd', 'e', 'f', 'g'])

@debuglog remove!(a, 7) a
testArray(a, ['a', 'x', 'c', 'd', 'e', 'f'])