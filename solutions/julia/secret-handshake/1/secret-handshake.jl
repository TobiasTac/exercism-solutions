function secret_handshake(code::Int)::Vector{String}
    actions = String[] 

    # Ensure the binary string is 5 digits long, padded with leading zeros.
    binary_code_str = lpad(string(code, base=2), 5, '0')
    binary_digits = collect(binary_code_str) # ['0', '0', '0', '1', '1'] for code=3

    reverse_order = false

    # Iterate from the rightmost digit (index 5) to the leftmost digit (index 1).
    # This ensures actions are added to the 'actions' vector in the correct order
    # (e.g., "wink" then "double blink").
    for i in 5:-1:1 # Loop from 5 down to 1
        digit = binary_digits[i] # binary_digits[5] is the rightmost, binary_digits[1] is the leftmost

        if digit == '1'
            if i == 5 # This is the 1st bit from the right (00001)
                push!(actions, "wink")
            elseif i == 4 # This is the 2nd bit from the right (00010)
                push!(actions, "double blink")
            elseif i == 3 # This is the 3rd bit from the right (00100)
                push!(actions, "close your eyes")
            elseif i == 2 # This is the 4th bit from the right (01000)
                push!(actions, "jump")
            elseif i == 1 # This is the 5th bit from the right (10000 - Reverse order)
                reverse_order = true
            end
        end
    end

    # Apply the final reversal if the 5th bit was set.
    if reverse_order
        reverse!(actions)
    end

    return actions
end