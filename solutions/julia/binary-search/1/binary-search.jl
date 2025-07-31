function binary_search_first(a, x; by, lt)
    
    by_x = by(x)

    
    
    low = 1
    high = length(a) + 1

    while low < high
        
        mid = low + (high - low) ÷ 2

        
        
        if lt(by(a[mid]), by_x)
            low = mid + 1
        else
            
            
            high = mid
        end
    end

    
    return low
end



function binary_search_last(a, x; by, lt)
    
    by_x = by(x)

    
    
    low = 0
    high = length(a)

    while low < high
        
        
        mid = low + (high - low + 1) ÷ 2

        
        
        
        if lt(by_x, by(a[mid]))
            high = mid - 1
        else
            
            
            low = mid
        end
    end

    
    return low
end


function binarysearch(a, x; by=identity, lt=isless, rev::Bool=false)
    
    
    effective_lt = rev ? (v1, v2) -> lt(v2, v1) : lt

    
    first_idx = binary_search_first(a, x, by=by, lt=effective_lt)

    
    last_idx = binary_search_last(a, x, by=by, lt=effective_lt)

    return first_idx:last_idx
end
