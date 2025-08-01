package dna

import (
	"errors" // Import the errors package for custom error creation
)

// Histogram is a mapping from nucleotide to its count in given DNA.
// A map from rune (character) to int (count) is a suitable data type.
type Histogram map[rune]int

// DNA is a list of nucleotides.
// A string is a suitable data type to represent a sequence of characters.
type DNA string

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	// Initialize the histogram with all valid nucleotides having a count of 0.
	// This ensures that the output always includes all four nucleotides,
	// even if some are not present in the DNA sequence.
	h := Histogram{
		'A': 0,
		'C': 0,
		'G': 0,
		'T': 0,
	}

	// Iterate over each character (nucleotide) in the DNA string.
	// The range keyword over a string iterates over its runes.
	for _, nucleotide := range d {
		// Check if the current nucleotide is one of the four valid types.
		switch nucleotide {
		case 'A':
			h['A']++ // Increment count for Adenine
		case 'C':
			h['C']++ // Increment count for Cytosine
		case 'G':
			h['G']++ // Increment count for Guanine
		case 'T':
			h['T']++ // Increment count for Thymine
		default:
			// If an invalid character is found, return the current (incomplete)
			// histogram and a new error indicating the invalid nucleotide.
			return nil, errors.New("invalid nucleotide")
		}
	}

	// If the loop completes without encountering any invalid nucleotides,
	// return the populated histogram and a nil error (indicating success).
	return h, nil
}