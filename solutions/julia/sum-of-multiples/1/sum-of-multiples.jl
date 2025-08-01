function sum_of_multiples(limit::Int, factors::Vector{Int})::Int
    unique_multiples = Set{Int}()

    for factor in factors
        if factor == 0
            continue
        end

        for multiple = factor:factor:(limit - 1)
            push!(unique_multiples, multiple)
        end
    end

    return sum(unique_multiples)
end