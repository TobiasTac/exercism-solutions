"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).
"""
function ispangram(input)
    # Create an empty set to store the unique lowercase alphabetic characters found in the input.
    found_letters = Set{Char}()

    # Iterate over each character in the input string.
    for char in input
        # Convert the character to lowercase to handle case insensitivity.
        lower_char = lowercase(char)

        # Check if the character is an English alphabet letter (from 'a' to 'z').
        if 'a' <= lower_char <= 'z'
            # If it's an alphabet letter, add it to our set of found letters.
            # Sets automatically handle uniqueness, so duplicates won't be added.
            push!(found_letters, lower_char)
        end
    end

    # A sentence is a pangram if the number of unique alphabet letters found is 26 (the size of the English alphabet).
    return length(found_letters) == 26
end

