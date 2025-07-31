function trinary_to_decimal(str::AbstractString)
    decimal_value = 0

    
    for char in str
        
        if char == '0'
            digit = 0
        elseif char == '1'
            digit = 1
        elseif char == '2'
            digit = 2
        else
            
            return 0
        end

        
        
        decimal_value = decimal_value * 3 + digit
    end

    return decimal_value
end
