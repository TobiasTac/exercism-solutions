function clean(phone_number::String)::String
    digits_only = replace(phone_number, r"[^\d]" => "")

    if length(digits_only) == 11
        if digits_only[1] == '1'
            digits_only = digits_only[2:end]
        else

            throw(ArgumentError("Invalid country code: $(phone_number)"))
        end
    elseif length(digits_only) != 10
        throw(ArgumentError("Incorrect number of digits: $(phone_number)"))
    end

    area_code_first_digit = parse(Int, digits_only[1])
    if area_code_first_digit < 2 || area_code_first_digit > 9
        throw(ArgumentError("Area code cannot start with 0 or 1: $(phone_number)"))
    end

    exchange_code_first_digit = parse(Int, digits_only[4])
    if exchange_code_first_digit < 2 || exchange_code_first_digit > 9
        throw(ArgumentError("Exchange code cannot start with 0 or 1: $(phone_number)"))
    end

    return digits_only
end