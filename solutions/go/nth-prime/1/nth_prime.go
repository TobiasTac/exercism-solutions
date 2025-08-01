package prime

import (
	"errors"
)

// isPrime checks if a given integer is a prime number.
// It returns true if prime, false otherwise.
func isPrime(num int) bool {
	if num <= 1 {
		return false
	}
	if num <= 3 {
		return true
	}
	if num%2 == 0 || num%3 == 0 {
		return false
	}
	for i := 5; i*i <= num; i = i + 6 {
		if num%i == 0 || num%(i+2) == 0 {
			return false
		}
	}
	return true
}

// Nth returns the nth prime number.
// An error is returned if 'n' is less than or equal to zero.
func Nth(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("n must be a positive integer")
	}

	count := 0
	candidate := 1

	for {
		candidate++

		if isPrime(candidate) {
			count++
		}

		if count == n {
			return candidate, nil
		}
	}
}