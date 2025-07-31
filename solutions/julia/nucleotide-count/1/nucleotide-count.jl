"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand:: String)::Dict{Char, Int}
    counts = Dict{Char, Int}(
        'A' => 0,
        'C' => 0,
        'G' => 0,
        'T' => 0
    )
    
    validNucleotides = Set(['A', 'C', 'G', 'T'])

    for nucleotide in strand
        if nucleotide in validNucleotides
            counts[nucleotide] += 1
        else
            throw(DomainError(nucleotide, "Invalid DNA sequence. Character '$(nucleotide)' is not a valid nucleotide (A, C, G, or T)."))
        end
    end
    return counts
end
