function keep(values, predicate)
    
    T = eltype(values)
    
    kept_values = T[]

    
    for element in values
        
        if predicate(element)
            
            push!(kept_values, element)
        end
    end

    return kept_values
end

function discard(values, predicate)
    
    T = eltype(values)
    
    discarded_values = T[]

    
    for element in values
        
        if !predicate(element)
            
            push!(discarded_values, element)
        end
    end

    return discarded_values
end
