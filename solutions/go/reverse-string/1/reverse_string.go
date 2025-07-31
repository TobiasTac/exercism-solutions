package reverse

// Reverse takes a string as input and returns its reversed version.
// It handles multi-byte Unicode characters correctly.
func Reverse(input string) string {
	// 1. Convert the input string to a slice of runes.
	// This is crucial for correctly handling Unicode characters,
	// as a string in Go is a read-only slice of bytes, not characters.
	runes := []rune(input)

	// 2. Implement the reversal using a two-pointer approach.
	// 'i' starts at the beginning, 'j' starts at the end.
	// The loop continues as long as 'i' is less than 'j'.
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		// Swap the characters at positions 'i' and 'j'.
		runes[i], runes[j] = runes[j], runes[i]
	}

	// 3. Convert the reversed slice of runes back into a string.
	return string(runes)
}