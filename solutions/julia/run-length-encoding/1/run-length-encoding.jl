function encode(s::AbstractString)
    isempty(s) && return ""

    encoded_chars = Char[]
    i = 1
    while i <= length(s)
        char = s[i]
        count = 0
        j = i
        while j <= length(s) && s[j] == char
            count += 1
            j += 1
        end

        if count > 1
            append!(encoded_chars, collect(string(count)))
        end
        push!(encoded_chars, char)

        i = j
    end
    return String(encoded_chars)
end

function decode(s::AbstractString)
    isempty(s) && return ""

    decoded_chars = Char[]
    i = 1
    while i <= length(s)
        count_str = ""
        while i <= length(s) && isdigit(s[i])
            count_str *= s[i]
            i += 1
        end

        count = isempty(count_str) ? 1 : parse(Int, count_str)

        char = s[i]
        
        for _ in 1:count
            push!(decoded_chars, char)
        end
        i += 1
    end
    return String(decoded_chars)
end
