package isbn

import (
	"strconv"
	"strings"
)

func IsValidISBN(isbn string) bool {
	sanitizedISBN := strings.ReplaceAll(isbn, "-", "")

	if len(sanitizedISBN) != 10 {
		return false
	}

	sum := 0
	for i, char := range sanitizedISBN {
		if i < 9 {
			if char >= '0' && char <= '9' {
				digit, _ := strconv.Atoi(string(char))
				sum += digit * (10 - i)
			} else {
				return false
			}
		} else { // Last character (index 9)
			if char >= '0' && char <= '9' {
				digit, _ := strconv.Atoi(string(char))
				sum += digit * (10 - i)
			} else if char == 'X' {
				sum += 10 * (10 - i)
			} else {
				return false
			}
		}
	}

	return sum%11 == 0
}