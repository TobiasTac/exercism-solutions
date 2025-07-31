function wordcount(sentence::AbstractString)
    lower_case_sentence = lowercase(sentence)
    cleaned_sentence = replace(lower_case_sentence, r"[^a-z0-9']+" => " ")
    potential_words = split(cleaned_sentence)
    counts = Dict{String, Int}()
    
    for word in potential_words
        final_word = strip(word, ''')
        if !isempty(final_word)
            counts[final_word] = get(counts, final_word, 0) + 1
        end
    end
    
    return counts
end