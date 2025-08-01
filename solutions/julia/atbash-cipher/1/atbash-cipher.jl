function _atbash_char_map(char::Char)::Char
    if 'a' <= char <= 'z'
        return 'a' + ('z' - char)
    elseif '0' <= char <= '9'
        return char
    else
        return '\0' 
    end
end

function encode(input::AbstractString)::String
    encoded_chars = Char[]
    chars_processed_for_grouping = 0

    for char in lowercase(input)
        if 'a' <= char <= 'z' || '0' <= char <= '9'
            mapped_char = _atbash_char_map(char)
            push!(encoded_chars, mapped_char)
            chars_processed_for_grouping += 1

            if chars_processed_for_grouping % 5 == 0 && chars_processed_for_grouping != 0
                push!(encoded_chars, ' ')
            end
        end
    end

    if !isempty(encoded_chars) && encoded_chars[end] == ' '
        pop!(encoded_chars)
    end

    return String(encoded_chars)
end

function decode(input::AbstractString)::String
    decoded_chars = Char[]

    for char in lowercase(input)
        if 'a' <= char <= 'z' || '0' <= char <= '9'
            mapped_char = _atbash_char_map(char)
            push!(decoded_chars, mapped_char)
        end
    end

    return String(decoded_chars)
end

