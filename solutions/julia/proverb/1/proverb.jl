function recite(pieces::Vector)
    
    if isempty(pieces)
        return ""
    end

    
    if !all(x -> isa(x, AbstractString), pieces)
        throw(ArgumentError("Input collection must contain only strings"))
    end

    
    lines = String[]

    
    
    for i in 1:(length(pieces) - 1)
        want = pieces[i]
        lost = pieces[i+1]
        push!(lines, "For want of a $want the $lost was lost.")
    end

    
    first_item = pieces[1]
    push!(lines, "And all for the want of a $first_item.")

    
    return join(lines, "\n")
end
