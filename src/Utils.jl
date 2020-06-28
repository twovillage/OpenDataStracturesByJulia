#= macros =#

# debug log
macro debuglog(func, a)
    quote
        println("======  start ", $(string(func)), "  ======")
        $(esc(func))
        println($(esc(a)))
        println("======  end ", $(string(func)), "  ======")
    end
end