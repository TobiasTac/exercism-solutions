function square_root(n::Integer)
    
    
    if n < 0
        throw(DomainError(n, "Input must be a non-negative number."))
    end

    
    
    
    low = 0
    high = n

    
    
    while low <= high
        
        mid = low + (high - low) ÷ 2
        
        
        
        if mid > 0 && mid > n ÷ mid
            square = n + 1 
        else
            square = mid * mid
        end

        if square == n
            
            return mid
        elseif square < n
            
            low = mid + 1
        else 
            
            high = mid - 1
        end
    end
    
    
    return -1
end
