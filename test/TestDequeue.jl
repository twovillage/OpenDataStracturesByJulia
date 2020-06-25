@show a = ArrayQueue{Char}(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', '\0', '\0', '\0', '\0'], 0, 8)

@debuglog remove!(a, 3) a
testArray(a, 1, 7, ['a', 'b', 'd', 'e', 'f', 'g', 'h'])

@debuglog add!(a, 5, 'x') a
testArray(a, 1, 8, ['a', 'b', 'd', 'e', 'x', 'f', 'g', 'h'])

@debuglog add!(a, 4, 'y') a
testArray(a, 0, 9, ['a', 'b', 'd', 'y', 'e', 'x', 'f', 'g', 'h'])

@debuglog add!(a, 4, 'z') a
testArray(a, 11, 10, ['a', 'b', 'd', 'z', 'y', 'e', 'x', 'f', 'g', 'h'])

