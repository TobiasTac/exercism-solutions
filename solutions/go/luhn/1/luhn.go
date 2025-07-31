package luhn

import (
	"strconv"
	"strings"
)

func Valid(id string) bool {
	cleanedID := strings.ReplaceAll(id, " ", "")

	if len(cleanedID) <= 1 {
		return false
	}

	sum := 0
	double := false

	for i := len(cleanedID) - 1; i >= 0; i-- {
		digitChar := cleanedID[i]

		digit, err := strconv.Atoi(string(digitChar))
		if err != nil {
			return false
		}

		if double {
			doubledDigit := digit * 2
			if doubledDigit > 9 {
				doubledDigit -= 9
			}
			sum += doubledDigit
		} else {
			sum += digit
		}
		double = !double
	}

	return sum%10 == 0
}
