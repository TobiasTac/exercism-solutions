function distance(strand1::String, strand2::String)
    if length(strand1) != length(strand2)
        throw(ArgumentError("DNA strands must be of equal length."))
    end

    hamming_dist = 0

    for i in 1:length(strand1)
        if strand1[i] != strand2[i]
            hamming_dist += 1
        end
    end

    return hamming_dist
end
