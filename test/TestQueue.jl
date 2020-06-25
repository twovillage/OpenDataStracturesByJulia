@show a = ArrayQueue{Char}(['\0', '\0', 'a', 'b', 'c', '\0'], 2, 3)
testArray(a, 2, 3, ['a', 'b', 'c'])

@debuglog add!(a, 'd') a
testArray(a, 2, 4, ['a', 'b', 'c', 'd'])

@debuglog add!(a, 'e') a
testArray(a, 2, 5, ['a', 'b', 'c', 'd', 'e'])

@debuglog remove!(a) a
testArray(a, 3, 4, ['b', 'c', 'd', 'e'])

@debuglog add!(a, 'f') a
testArray(a, 3, 5, ['b', 'c', 'd', 'e', 'f'])

@debuglog add!(a, 'g') a
testArray(a, 3, 6, ['b', 'c', 'd', 'e', 'f', 'g'])

@debuglog add!(a, 'h') a
testArray(a, 0, 7, ['b', 'c', 'd', 'e', 'f', 'g', 'h'])
@debuglog remove!(a) a

