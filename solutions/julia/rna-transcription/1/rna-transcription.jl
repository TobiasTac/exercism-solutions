function to_rna(dna::String)
    rna = ""

    for nucleotide in dna
        if nucleotide == 'G'
            rna *= 'C'
        elseif nucleotide == 'C'
            rna *= 'G'
        elseif nucleotide == 'T'
            rna *= 'A'
        elseif nucleotide == 'A'
            rna *= 'U'
        else
            # Changed to ErrorException to match test expectations
            throw(ErrorException("Invalid DNA nucleotide: $nucleotide"))
        end
    end

    return rna
end
