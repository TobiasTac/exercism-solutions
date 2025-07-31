package armstrong

import (
	"math"
	"strconv"
)

// IsNumber determines whether a number is an Armstrong number.
func IsNumber(n int) bool {
	// A number is an Armstrong number if it's the sum of its own digits,
	// each raised to the power of the number of digits.
	// For example: 153 = 1^3 + 5^3 + 3^3.

	// Step 1: Convert the integer to a string to easily get its digits.
	// A negative number cannot be an Armstrong number by definition.
	if n < 0 {
		return false
	}
	s := strconv.Itoa(n)

	// Step 2: Get the number of digits. This will be our power.
	numDigits := len(s)

	// Step 3: Iterate through each digit, raise it to the power, and sum the results.
	var sum int
	for _, char := range s {
		// Convert the digit character back to an integer.
		digit := int(char - '0')
		
		// Raise the digit to the power of the number of digits.
		// `math.Pow` works with floats, so we need to convert back to int.
		sum += int(math.Pow(float64(digit), float64(numDigits)))
	}

	// Step 4: Compare the sum with the original number.
	return sum == n
}