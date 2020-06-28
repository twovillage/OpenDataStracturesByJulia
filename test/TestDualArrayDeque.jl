@show a = DualArrayDeque{Char}(['a', 'b', 'c', 'd'])
@show b = QueueArray{Char}(['a', 'b', 'c', 'd'])

@debuglog add!(a, 4, 'x') a
@debuglog add!(b, 4, 'x') b

@test toArray(a) == toArray(b)

@debuglog add!(a, 5, 'y') a
@debuglog add!(b, 5, 'y') b

@test toArray(a) == toArray(b)

@debuglog remove!(a, 1) a
@debuglog remove!(b, 1) b

@test toArray(a) == toArray(b)

@debuglog remove!(a, 1) a
@debuglog remove!(b, 1) b

@test toArray(a) == toArray(b)

@debuglog add!(a, 3, 'z') a
@debuglog add!(b, 3, 'z') b

@test toArray(a) == toArray(b)

@debuglog remove!(a, count(a)) a
@debuglog remove!(b, count(b)) b

@test toArray(a) == toArray(b)

@show toArray(a)
@show toArray(b)
