package anagram

import (
	"sort"   // For sorting characters/runes
	"strings" // For converting to lowercase
)

// sortString returns a sorted lowercase version of a string.
// This creates a canonical form (a "fingerprint") for anagram comparison.
func sortString(s string) string {
	// Convert the string to a slice of runes to handle Unicode characters correctly.
	runes := []rune(strings.ToLower(s))

	// Sort the slice of runes.
	sort.Slice(runes, func(i, j int) bool {
		return runes[i] < runes[j]
	})

	// Convert the sorted runes back to a string.
	return string(runes)
}

// Detect finds anagrams of a subject word within a list of candidates.
// It returns a new slice containing only the anagrams.
func Detect(subject string, candidates []string) []string {
	// 1. Normalize the subject word for comparison.
	// This creates a unique "fingerprint" of its letter composition, case-insensitively.
	normalizedSubject := sortString(subject)

	// 2. Initialize an empty slice to store the found anagrams.
	foundAnagrams := []string{}

	// 3. Iterate through each candidate word in the provided list.
	for _, candidate := range candidates {
		// 4. Exclude the word itself (case-insensitive check).
		// Anagrams cannot be the word itself, even if they have the same letters.
		if strings.ToLower(candidate) == strings.ToLower(subject) {
			continue // Skip this candidate and move to the the next.
		}

		// 5. Normalize the candidate word for comparison, just like the subject.
		normalizedCandidate := sortString(candidate)

		// 6. Compare the normalized (sorted, lowercase) versions.
		// If their "fingerprints" match, they contain the same letters.
		if normalizedCandidate == normalizedSubject {
			// If they are anagrams, add the original-cased candidate word
			// to our list of found anagrams.
			foundAnagrams = append(foundAnagrams, candidate)
		}
	}

	// 7. Return the slice of anagrams found, maintaining their original order from candidates.
	return foundAnagrams
}