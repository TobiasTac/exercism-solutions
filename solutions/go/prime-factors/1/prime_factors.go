package prime

// Factors computes the prime factors of a given natural number n.
func Factors(n int64) []int64 {
	var factors []int64 // Initialize an empty slice to store the prime factors.
	var divisor int64 = 2 // Start with the smallest prime number.

	// Continue the loop as long as the number n is greater than 1.
	// Once n becomes 1, all its prime factors have been found.
	for n > 1 {
		// If n is divisible by the current divisor, then divisor is a prime factor.
		if n%divisor == 0 {
			factors = append(factors, divisor) // Add the divisor to our list of factors.
			n /= divisor                       // Divide n by this factor. This ensures we find all occurrences
			                                   // of this prime factor (e.g., 2 in 60, then 2 in 30 again).
		} else {
			// If n is not divisible by the current divisor, move to the next potential divisor.
			// We increment by 1. The algorithm implicitly handles composite divisors
			// because their prime factors would have already divided n out.
			divisor++
		}
	}

	return factors // Return the slice containing all prime factors.
}