function on_square(square::Int)::UInt64
    # Changed to throw DomainError to match test expectations
    if !(1 <= square <= 64)
        throw(DomainError(square, "Square must be between 1 and 64."))
    end
    return UInt64(1) << (square - 1)
end

function total_after(square::Int)::UInt64
    # Changed to throw DomainError to match test expectations
    if !(1 <= square <= 64)
        throw(DomainError(square, "Square must be between 1 and 64."))
    end
    return (UInt64(1) << square) - UInt64(1)
end
