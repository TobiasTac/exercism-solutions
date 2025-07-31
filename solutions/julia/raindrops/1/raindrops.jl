function raindrops(number::Int)::String
    result = ""
    count = 0
    
    if number % 3 == 0
        result *= "Pling"
        count = 1
    end
    
    if number % 5 == 0
        result *= "Plang"
        count = 1
    end
    
    if number % 7 == 0
        result *= "Plong"
        count = 1
    end

    if count == 0
        return  string(number)
    else
        return result
    end

end
