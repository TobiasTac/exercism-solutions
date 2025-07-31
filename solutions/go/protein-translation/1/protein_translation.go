package protein

import "errors" // Import the errors package to create custom error values.

// Declare the error variables that the test suite expects.
// These should be global variables within the package.
var (
	ErrStop        = errors.New("stop codon encountered")    // Returned when a STOP codon is found.
	ErrInvalidBase = errors.New("invalid base")             // Returned when an unknown/invalid codon is found.
)

// codonToAminoAcid maps known codons to their corresponding amino acid names.
var codonToAminoAcid = map[string]string{
	"AUG": "Methionine",
	"UUU": "Phenylalanine",
	"UUC": "Phenylalanine",
	"UUA": "Leucine",
	"UUG": "Leucine",
	"UCU": "Serine",
	"UCC": "Serine",
	"UCA": "Serine",
	"UCG": "Serine",
	"UAU": "Tyrosine",
	"UAC": "Tyrosine",
	"UGU": "Cysteine",
	"UGC": "Cysteine",
	"UGG": "Tryptophan",
}

// stopCodons lists the specific codons that signal the termination of translation.
var stopCodons = map[string]bool{
	"UAA": true,
	"UAG": true,
	"UGA": true,
}

// FromCodon translates a single 3-nucleotide codon into its corresponding protein.
// It returns a specific error (ErrStop or ErrInvalidBase) for stop codons or unknown codons.
func FromCodon(codon string) (string, error) {
	// Check if the codon is one of the known STOP codons.
	if stopCodons[codon] {
		return "", ErrStop // If it's a STOP codon, return an empty string and the ErrStop error.
	}

	// Look up the codon in the map of amino acids.
	protein, exists := codonToAminoAcid[codon]
	if !exists {
		// If the codon is not a STOP codon and not in the amino acid map, it's an invalid base.
		return "", ErrInvalidBase // Return an empty string and the ErrInvalidBase error.
	}

	// If the codon is valid and maps to an amino acid, return the protein name and no error.
	return protein, nil
}

// FromRNA translates an entire RNA sequence into a slice of protein names.
// It processes the RNA in 3-nucleotide (codon) chunks.
// Translation stops upon encountering a STOP codon or if an invalid codon is found.
// It returns an error for invalid codons or incomplete sequences.
func FromRNA(rna string) ([]string, error) {
	var proteins []string // Initialize an empty slice to store the translated proteins.

	// Iterate through the RNA string, taking 3 characters at a time to form codons.
	for i := 0; i < len(rna); i += 3 {
		// Check if there are enough characters left to form a full 3-nucleotide codon.
		if i+3 > len(rna) {
			// If not enough characters, it's an incomplete sequence, which is considered an invalid base.
			return nil, ErrInvalidBase 
		}

		codon := rna[i : i+3] // Extract the current 3-nucleotide codon.

		// Attempt to translate the current codon.
		protein, err := FromCodon(codon)

		// Handle the errors returned by FromCodon.
		if err == ErrStop {
			// If FromCodon signals ErrStop, translation ends successfully at this point.
			// Return the proteins collected so far with no error.
			return proteins, nil 
		} else if err == ErrInvalidBase {
			// If FromCodon signals ErrInvalidBase, propagate this error.
			// Translation cannot continue due to an unrecognized/invalid codon.
			return nil, ErrInvalidBase 
		} else if err != nil {
			// This catches any other unexpected errors that FromCodon might theoretically return.
			return nil, err 
		}

		// If translation was successful (no error and not a STOP codon), add the protein to the list.
		proteins = append(proteins, protein)
	}

	// If the loop completes without encountering a STOP codon or an error,
	// return all collected proteins.
	return proteins, nil
}