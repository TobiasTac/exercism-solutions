function acronym(phrase::AbstractString)::String
    phrase_with_spaces = replace(phrase, "-" => " ")

    cleaned_phrase = replace(phrase_with_spaces, r"[^\p{L}\p{N}\s]" => "")

    words = split(cleaned_phrase)

    if isempty(words)
        return ""
    else

        return join(uppercase(first(word)) for word in words)
    end
end
