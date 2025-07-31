package rotationalcipher

import (
	"strings"
)

func RotationalCipher(plain string, shiftKey int) string {
	var result strings.Builder
	shiftKey = shiftKey % 26 // Ensure shiftKey is within 0-25 range

	for _, char := range plain {
		if char >= 'a' && char <= 'z' {
			// Handle lowercase letters
			shiftedChar := 'a' + (char-'a'+rune(shiftKey))%26
			result.WriteRune(shiftedChar)
		} else if char >= 'A' && char <= 'Z' {
			// Handle uppercase letters
			shiftedChar := 'A' + (char-'A'+rune(shiftKey))%26
			result.WriteRune(shiftedChar)
		} else {
			// Non-alphabetic characters remain unchanged
			result.WriteRune(char)
		}
	}

	return result.String()
}