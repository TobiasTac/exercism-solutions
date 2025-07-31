function transform(input::AbstractDict)::Dict{Char, Int}
    transformed_data = Dict{Char, Int}()
    for (score, letters) in input
        for letter_str in letters

            char_key = only(lowercase(letter_str))
            transformed_data[char_key] = score
        end
    end
    return transformed_data
end