const CODON_TO_AMINO_ACID = Dict(
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine",       "UUG" => "Leucine",
    "UCU" => "Serine",        "UCC" => "Serine",
    "UCA" => "Serine",        "UCG" => "Serine",
    "UAU" => "Tyrosine",      "UAC" => "Tyrosine",
    "UGU" => "Cysteine",      "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",          "UAG" => "STOP",
    "UGA" => "STOP"
)

function proteins(strand::AbstractString)
    amino_acids = String[]
    
    i = 1
    
    while i + 2 <= length(strand)
        codon = strand[i:i+2]
        
        if !haskey(CODON_TO_AMINO_ACID, codon)
            throw(DomainError(codon, "is not a valid codon"))
        end
        
        amino_acid = CODON_TO_AMINO_ACID[codon]

        
        
        if amino_acid == "STOP"
            return amino_acids
        end

        push!(amino_acids, amino_acid)
        i += 3
    end

    
    
    
    if i <= length(strand)
        throw(DomainError(strand, "is not a valid RNA strand (incomplete codon at the end)"))
    end

    return amino_acids
end
