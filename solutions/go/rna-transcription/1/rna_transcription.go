package strand

import "strings" // Import the strings package for strings.Builder

// ToRNA transcribes a given DNA strand into its RNA complement.
// It replaces each DNA nucleotide with its corresponding RNA complement:
// G -> C
// C -> G
// T -> A
// A -> U
func ToRNA(dna string) string {
	// Use a strings.Builder for efficient string concatenation.
	// It avoids creating many intermediate string objects.
	var rnaBuilder strings.Builder

	// Iterate over each character (rune) in the input DNA string.
	// Using 'rune' is safer for character handling, especially with Unicode,
	// though for 'A', 'C', 'G', 'T', 'U', it behaves like byte iteration.
	for _, nucleotide := range dna {
		// Use a switch statement to determine the RNA complement for each DNA nucleotide.
		switch nucleotide {
		case 'G':
			rnaBuilder.WriteRune('C') // DNA Guanine (G) becomes RNA Cytosine (C)
		case 'C':
			rnaBuilder.WriteRune('G') // DNA Cytosine (C) becomes RNA Guanine (G)
		case 'T':
			rnaBuilder.WriteRune('A') // DNA Thymine (T) becomes RNA Adenine (A)
		case 'A':
			rnaBuilder.WriteRune('U') // DNA Adenine (A) becomes RNA Uracil (U)
		// No default case is needed if we assume valid input containing only A, C, G, T.
		// If invalid characters could be present and should be handled (e.g., return an error, skip),
		// a default case would be added here.
		}
	}

	// Return the final RNA string from the builder.
	return rnaBuilder.String()
}