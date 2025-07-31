function score(dice::Vector{Int}, category::String)
    
    counts = Dict{Int, Int}()
    for d in dice
        counts[d] = get(counts, d, 0) + 1
    end

    
    if category == "ones"
        return get(counts, 1, 0) * 1
    elseif category == "twos"
        return get(counts, 2, 0) * 2
    elseif category == "threes"
        return get(counts, 3, 0) * 3
    elseif category == "fours"
        return get(counts, 4, 0) * 4
    elseif category == "fives"
        return get(counts, 5, 0) * 5
    elseif category == "sixes"
        return get(counts, 6, 0) * 6
    elseif category == "full house"
        
        
        vals = values(counts)
        if length(vals) == 2 && 3 in vals && 2 in vals
            return sum(dice)
        else
            return 0
        end
    elseif category == "four of a kind"
        
        for (die_face, count) in counts
            if count >= 4
                return die_face * 4
            end
        end
        return 0
    elseif category == "little straight"
        
        if sort(dice) == [1, 2, 3, 4, 5]
            return 30
        else
            return 0
        end
    elseif category == "big straight"
        
        if sort(dice) == [2, 3, 4, 5, 6]
            return 30
        else
            return 0
        end
    elseif category == "choice"
        
        return sum(dice)
    elseif category == "yacht"
        
        
        if length(counts) == 1
            return 50
        else
            return 0
        end
    else
        
        return 0
    end
end
