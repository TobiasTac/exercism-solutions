function rationalize(successes::Vector{<:Integer}, trials::Vector{<:Integer})::Vector{Rational{Int64}}
    return collect(s // t for (s, t) in zip(successes, trials))
end

function probabilities(successes::Vector{<:Integer}, trials::Vector{<:Integer})::Vector{Float64}
    return collect(Float64(s) / Float64(t) for (s, t) in zip(successes, trials))
end

function checkmean(successes::Vector{<:Integer}, trials::Vector{<:Integer})
    # Calculate rational probabilities.
    rational_probs = rationalize(successes, trials)
    # Calculate real (float) probabilities.
    float_probs = probabilities(successes, trials)

    # Calculate the mean of rational probabilities.
    # `sum` works directly on Rational numbers.
    mean_rational = sum(rational_probs) / length(rational_probs)

    # Calculate the mean of float probabilities.
    mean_float = sum(float_probs) / length(float_probs)

    if Float64(mean_rational) == mean_float
        return true
    else
        return mean_rational
    end
end

function checkprob(successes::Vector{<:Integer}, trials::Vector{<:Integer})
    # Calculate rational probabilities.
    rational_probs = rationalize(successes, trials)
    # Calculate real (float) probabilities.
    float_probs = probabilities(successes, trials)

    total_prob_rational = prod(rational_probs)

    total_prob_float = prod(float_probs)

    if Float64(total_prob_rational) == total_prob_float
        return true
    else
        return total_prob_rational
    end
end