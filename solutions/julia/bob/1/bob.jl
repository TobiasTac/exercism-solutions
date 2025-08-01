"""
    bob(stimulus::AbstractString)::String

Determines Bob's reply to a given `stimulus` string based on specific rules.
"""
function bob(stimulus::AbstractString)::String
    # Trim whitespace from both ends of the stimulus to simplify checks.
    trimmed_stimulus = strip(stimulus)

    # Check for specific characteristics of the stimulus
    # A stimulus is considered a question if it ends with a question mark.
    is_question = endswith(trimmed_stimulus, '?')
    
    # A stimulus is considered yelling if it contains at least one letter and all letters are uppercase.
    # We iterate over runes to correctly handle Unicode characters.
    is_yelling = false
    has_letters = false
    for char in trimmed_stimulus
        if isletter(char)
            has_letters = true
            if islowercase(char)
                is_yelling = false # Found a lowercase letter, so it's not yelling.
                break
            end
            is_yelling = true # If it's a letter and not lowercase, it's uppercase so far.
        end
    end
    # Ensure it only counts as yelling if it actually contains letters
    is_yelling = is_yelling && has_letters

    # A stimulus is considered silence if it's empty after trimming whitespace.
    is_silence = isempty(trimmed_stimulus)

    # Apply Bob's rules in order of precedence (most specific first).
    if is_yelling && is_question
        return "Calm down, I know what I'm doing!"
    elseif is_yelling
        return "Whoa, chill out!"
    elseif is_question
        return "Sure."
    elseif is_silence
        return "Fine. Be that way!"
    else
        # If none of the above conditions are met, this is the default response.
        return "Whatever."
    end
end