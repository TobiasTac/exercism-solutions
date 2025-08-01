function aliquot_sum(n::Int)
    if n <= 0
        throw(DomainError(n, "Input must be a positive integer.")) # Changed to DomainError
    end
    if n == 1
        return 0
    end

    sum_factors = 1
    for i in 2:isqrt(n)
        if n % i == 0
            sum_factors += i
            if i * i != n
                sum_factors += n ÷ i
            end
        end
    end
    return sum_factors
end

function isperfect(n::Int)
    return aliquot_sum(n) == n
end

function isabundant(n::Int)
    return aliquot_sum(n) > n
end

function isdeficient(n::Int)
    return aliquot_sum(n) < n
end
