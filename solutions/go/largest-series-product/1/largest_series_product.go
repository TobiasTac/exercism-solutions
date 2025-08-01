package lsproduct

import (
	"errors"
	// Removed: "strconv" imported and not used
)

func LargestSeriesProduct(digits string, span int) (int64, error) {
	if span < 0 {
		return 0, errors.New("span must not be negative")
	}
	if span > len(digits) {
		return 0, errors.New("span must not be greater than length of digits string")
	}
	if span == 0 {
		return 1, nil
	}

	for _, char := range digits {
		if char < '0' || char > '9' {
			return 0, errors.New("digits string must contain only digits")
		}
	}

	var maxProduct int64 = 0

	for i := 0; i <= len(digits)-span; i++ {
		currentProduct := int64(1)
		series := digits[i : i+span]

		for _, char := range series {
			digit := int64(char - '0')
			currentProduct *= digit
		}

		if currentProduct > maxProduct {
			maxProduct = currentProduct
		}
	}

	return maxProduct, nil
}