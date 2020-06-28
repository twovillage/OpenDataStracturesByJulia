@show a = DualArrayDeque{Char}(['a', 'b', 'c', 'd'])

@debuglog add!(a, 4, 'x') a

@debuglog add!(a, 5, 'y') a

@debuglog remove!(a, 1) a