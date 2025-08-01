function luhn(number_string::AbstractString)::Bool
    # 1. Preprocessing
    # Remove spaces
    cleaned_number = replace(number_string, " " => "")

    # Check for non-digit characters
    # Note: `all(isdigit, cleaned_number)` correctly handles empty string as true,
    # so we need to explicitly check `length(cleaned_number) <= 1` first.
    if length(cleaned_number) <= 1 || !all(isdigit, cleaned_number)
        return false
    end

    # Convert to a list of integers
    # Use `parse(Int, c)` for each character `c`
    digits = [parse(Int, c) for c in cleaned_number]

    # 2. Luhn Algorithm Application
    total_sum = 0
    # Iterate from right to left (end to beginning)
    # The `enumerate(reverse(digits))` approach is robust
    for (i, digit) in enumerate(reverse(digits))
        # `i` is 1-indexed, so `isodd(i)` means the 1st, 3rd, 5th... digit from the right
        # These are the digits that are *not* doubled.
        if isodd(i)
            total_sum += digit
        else
            # These are the 2nd, 4th, 6th... digit from the right (which get doubled)
            doubled_digit = digit * 2
            if doubled_digit > 9
                total_sum += (doubled_digit - 9)
            else
                total_sum += doubled_digit
            end
        end
    end

    # 3. Summation and Validation
    return total_sum % 10 == 0
end