function prime_factors(n::Int)::Vector{Int}
factors = Int[]
divisor = 2

while n > 1
    if n % divisor == 0
        push!(factors, divisor)
        n = n ÷ divisor
    else
        divisor += 1
    end
end

return factors
end