function isarmstrong(number::Int)::Bool
    num_str = string(number)
    num_digits = length(num_str)
    sum_of_powers = 0

    for char_digit in num_str
        digit = parse(Int, char_digit)
        sum_of_powers += digit^num_digits
    end

    return sum_of_powers == number
end
