function sieve(limit::Int)::Vector{Int}

    if limit < 0
        throw(ArgumentError("Limit cannot be negative."))
    end

    if limit < 2
        return Int[]
    end

    is_prime = fill(true, limit + 1)

    is_prime[1] = false

    for p in 2:isqrt(limit)

        if is_prime[p]

            for multiple in (p*p):p:limit
                is_prime[multiple] = false
            end
        end
    end

    primes = Int[]
    for i in 2:limit
        if is_prime[i]
            push!(primes, i)
        end
    end

    return primes
end

