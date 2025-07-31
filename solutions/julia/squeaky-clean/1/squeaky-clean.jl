function transform(ch)
    if ch == '-'
        return "_"
    end

    if isspace(ch)
        return ""
    end

    if isdigit(ch)
        return ""
    end

    if 'α' <= ch <= 'ω'
        return "?"
    end

    if isuppercase(ch)
        return string("-", lowercase(ch))
    end

    return string(ch)
end

function clean(str)
    if isempty(str)
        return ""
    end

    transformedParts = String[]
    for char in str
        push!(transformedParts, transform(char))
    end

    return join(transformedParts)
end
