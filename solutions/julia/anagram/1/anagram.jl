function detect_anagrams(subject::String, candidates::Vector{String})::Vector{String}
    normalized_subject = sort(collect(lowercase(subject)))

    # 2. Initialize an empty vector to store the anagrams found.
    found_anagrams = String[]

    # 3. Iterate through each candidate word in the order they are provided.
    for candidate_word in candidates
        # 4. Exclude the word itself (case-insensitive check).
        # Anagrams cannot be the word itself.
        if lowercase(candidate_word) == lowercase(subject)
            continue # Skip this candidate and move to the next.
        end

        # 5. Normalize the candidate word for comparison (lowercase and sorted letters).
        normalized_candidate = sort(collect(lowercase(candidate_word)))

        # 6. Compare the normalized versions.
        # If their "fingerprints" match, they are anagrams.
        if normalized_candidate == normalized_subject
            # If they are anagrams, add the original-cased candidate word
            # to our list of found anagrams.
            push!(found_anagrams, candidate_word)
        end
    end

    # 7. Return the list of anagrams found, maintaining their original order.
    return found_anagrams
end