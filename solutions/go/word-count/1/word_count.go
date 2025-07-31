package wordcount

import (
	"regexp"
	"strings"
)

// Frequency is a mapping from a word (string) to its count (int).
type Frequency map[string]int

// WordCount counts how many times each word occurs in a given phrase.
// It handles case-insensitivity, contractions, numbers as words,
// and various punctuation/whitespace as word separators.
func WordCount(phrase string) Frequency {
	counts := make(Frequency)

	// 1. Convert the entire phrase to lowercase.
	// This ensures case-insensitivity (e.g., "You" and "you" are counted as the same word).
	lowerPhrase := strings.ToLower(phrase)

	// 2. Define a regex to replace characters that are NOT:
	//    - lowercase letters (a-z)
	//    - digits (0-9)
	//    - apostrophes (')
	// These non-matching characters will act as word separators.
	// This effectively turns most punctuation and all whitespace into simple spaces.
	reSeparator := regexp.MustCompile(`[^a-z0-9']`)
	
	// Replace all matched characters with a single space.
	// Example: "That's the password: 'PASSWORD 123'!" -> "that's the password  'password 123'  "
	cleanedPhrase := reSeparator.ReplaceAllString(lowerPhrase, " ")

	// 3. Split the cleaned phrase into individual "raw" words based on one or more spaces.
	// strings.Fields handles multiple spaces between words correctly.
	rawWords := strings.Fields(cleanedPhrase)

	// 4. Process each raw word for final cleaning (trimming stray apostrophes) and counting.
	for _, word := range rawWords {
		// Trim any leading or trailing apostrophes from the word.
		// This handles cases like "'PASSWORD'" becoming "password" and "123'" becoming "123".
		// It does NOT remove apostrophes internal to contractions (e.g., "that's" remains "that's").
		finalWord := strings.Trim(word, "'")

		// Ensure the word is not empty after trimming (e.g., if the input contained "''").
		if finalWord != "" {
			counts[finalWord]++ // Increment the count for the cleaned word.
		}
	}

	return counts
}