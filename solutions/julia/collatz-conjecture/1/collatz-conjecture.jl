function collatz_steps(n::Int)
    if n <= 0
        throw(DomainError(n, "Input must be a positive integer."))
    end

    steps = 0
    current_number = n

    while current_number != 1
        if iseven(current_number)
            current_number ÷= 2
        else
            current_number = 3 * current_number + 1
        end
        steps += 1
    end

    return steps
end
