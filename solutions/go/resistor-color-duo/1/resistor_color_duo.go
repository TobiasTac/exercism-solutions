package resistorcolorduo

import "strings"

func Value(colors []string) int {
	colorMap := map[string]int{
		"black":  0,
		"brown":  1,
		"red":    2,
		"orange": 3,
		"yellow": 4,
		"green":  5,
		"blue":   6,
		"violet": 7,
		"grey":   8,
		"white":  9,
	}

	if len(colors) < 2 {
		return 0
	}

	firstDigit := colorMap[strings.ToLower(colors[0])]
	secondDigit := colorMap[strings.ToLower(colors[1])]

	return firstDigit*10 + secondDigit
}