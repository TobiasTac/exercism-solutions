function isisogram(phrase::AbstractString)
    lower_phrase = lowercase(phrase)
    seen_letters = Set{Char}()
    for char in lower_phrase
        if 'a' <= char <= 'z'
            if char in seen_letters
                return false
            end
            push!(seen_letters, char)
        end
    end
    return true
end
