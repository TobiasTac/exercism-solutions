package phonenumber

import (
	"errors"
	"regexp"
	"strings"
)

// clean cleans and validates a phone number string.
// It returns a 10-digit string or an error if invalid.
func clean(phoneNumber string) (string, error) {
	re := regexp.MustCompile(`[^\d]`)
	digitsOnly := re.ReplaceAllString(phoneNumber, "")

	if len(digitsOnly) == 11 && strings.HasPrefix(digitsOnly, "1") {
		digitsOnly = digitsOnly[1:]
	}

	if len(digitsOnly) != 10 {
		return "", errors.New("invalid number of digits")
	}

	if digitsOnly[0] < '2' || digitsOnly[0] > '9' {
		return "", errors.New("area code cannot start with 0 or 1")
	}
	if digitsOnly[3] < '2' || digitsOnly[3] > '9' {
		return "", errors.New("exchange code cannot start with 0 or 1")
	}

	return digitsOnly, nil
}

// Number returns the cleaned 10-digit phone number.
func Number(phoneNumber string) (string, error) {
	cleanedNumber, err := clean(phoneNumber)
	if err != nil {
		return "", err
	}
	return cleanedNumber, nil
}

// AreaCode returns the 3-digit area code of a phone number.
func AreaCode(phoneNumber string) (string, error) {
	cleanedNumber, err := clean(phoneNumber)
	if err != nil {
		return "", err
	}
	return cleanedNumber[0:3], nil
}

// Format returns the phone number in a formatted string: "(###) ###-####".
func Format(phoneNumber string) (string, error) {
	cleanedNumber, err := clean(phoneNumber)
	if err != nil {
		return "", err
	}
	return "(" + cleanedNumber[0:3] + ") " + cleanedNumber[3:6] + "-" + cleanedNumber[6:10], nil
}