package thefarm

import (
	"errors"
	"fmt"
)

func DivideFood(fc FodderCalculator, numCows int) (float64, error) {
	totalFodder, err := fc.FodderAmount(numCows)
	if err != nil {
		return 0, err
	}
	fatteningFactor, err := fc.FatteningFactor()
	if err != nil {
		return 0, err
	}
	fodderPerCow := (totalFodder * fatteningFactor) / float64(numCows)

	return fodderPerCow, nil
}

func ValidateInputAndDivideFood(fc FodderCalculator, numCows int) (float64, error) {
	if numCows <= 0 {
		return 0, errors.New("invalid number of cows")
	}
	return DivideFood(fc, numCows)
}
type InvalidCowsError struct {
	numberOfCows  int
	customMessage string
}

func (e InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.numberOfCows, e.customMessage)
}

func ValidateNumberOfCows(numCows int) error {
	if numCows < 0 {
		return &InvalidCowsError{
			numberOfCows:  numCows,
			customMessage: "there are no negative cows",
		}
	} else if numCows == 0 {
		return &InvalidCowsError{
			numberOfCows:  numCows,
			customMessage: "no cows don't need food",
		}
	}
	return nil
}
