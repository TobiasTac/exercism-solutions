"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    # The sum of the first n natural numbers is given by the formula: n * (n + 1) / 2
    sum_n = n * (n + 1) ÷ 2 # Use integer division since n*(n+1) will always be even
    
    # Square the calculated sum
    return sum_n^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    # The sum of the squares of the first n natural numbers is given by the formula:
    # n * (n + 1) * (2n + 1) / 6
    # Note: For integer n, n*(n+1)*(2n+1) is always divisible by 6.
    return n * (n + 1) * (2n + 1) ÷ 6
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    # Calculate the square of the sum
    sq_sum = square_of_sum(n)
    
    # Calculate the sum of the squares
    sum_sq = sum_of_squares(n)
    
    # Return the difference
    return sq_sum - sum_sq
end

