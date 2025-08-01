const VOWELS = Set(['a', 'e', 'i', 'o', 'u'])

is_vowel(c::Char) = c in VOWELS

function translate_word(word::AbstractString)::String 
    word_lc = lowercase(word)
    
    # Rule 1: Starts with vowel, "xr", or "yt"
    if is_vowel(first(word_lc)) || startswith(word_lc, "xr") || startswith(word_lc, "yt")
        return word_lc * "ay"
    end

    first_stay_idx = firstindex(word_lc)
    
    for current_idx in eachindex(word_lc)
        char = word_lc[current_idx]

        # Rule 3: Consonants followed by "qu"
        if char == 'q' && current_idx < lastindex(word_lc) && word_lc[nextind(word_lc, current_idx)] == 'u'
            first_stay_idx = nextind(word_lc, current_idx, 2)
            break
        end
        
        # Rule 4: Consonants followed by 'y'
        # IMPORTANT: 'y' is treated as a vowel *only if it's not the first letter*.
        if char == 'y' && current_idx != firstindex(word_lc) # Corrected condition here
            first_stay_idx = current_idx
            break
        end

        # Rule 2: General Consonant Start (if not 'y' special or 'qu')
        if !is_vowel(char)
            first_stay_idx = nextind(word_lc, current_idx)
        else # It's a regular vowel (not part of 'qu', not 'y' special)
            first_stay_idx = current_idx
            break
        end
    end
    
    consonant_cluster = word_lc[firstindex(word_lc):prevind(word_lc, first_stay_idx)]
    remaining_part = word_lc[first_stay_idx:lastindex(word_lc)]

    return remaining_part * consonant_cluster * "ay"
end

function translate(phrase::String)::String
    words = split(phrase, " ")
    translated_words = [translate_word(word) for word in words]
    return join(translated_words, " ")
end