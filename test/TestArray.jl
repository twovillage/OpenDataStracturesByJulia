array = ['b', 'r', 'e', 'd']
@show a = BaseArray{Char}(array, 6, length(array))

@debuglog add!(a, 3, 'e') a
testArray(a, ['b', 'r', 'e', 'e', 'd'])
@debuglog add!(a, 6, 'r') a
testArray(a, ['b', 'r', 'e', 'e', 'd', 'r'])
@debuglog add!(a, 6, 'e') a
testArray(a, ['b', 'r', 'e', 'e', 'd', 'e', 'r'])
@debuglog remove!(a, 5) a
testArray(a, ['b', 'r', 'e', 'e', 'e', 'r'])
@debuglog remove!(a, 5) a
testArray(a, ['b', 'r', 'e', 'e', 'r'])
@debuglog remove!(a, 5) a
testArray(a, ['b', 'r', 'e', 'e'])
@debuglog set!(a, 3, 'i') a
testArray(a, ['b', 'r', 'i', 'e'])


for i = 1:a.n
    print(a.array[i])
end
println("")