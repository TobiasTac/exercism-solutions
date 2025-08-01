function to_roman(number::Int)::String
    if !(1 <= number <= 3999)
        throw(ErrorException("Number must be between 1 and 3999 for traditional Roman numerals."))
    end

    roman_map = [
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
    ]

    result = ""
    remaining_number = number

    for (value, symbol) in roman_map
        while remaining_number >= value
            result *= symbol
            remaining_number -= value
        end
    end

    return result
end
