package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	var stars = strings.Repeat("*", numStarsPerLine)
    var name = stars + "\n" + welcomeMsg + "\n" + stars
	
	return name
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	clearStars := strings.ReplaceAll(oldMsg, "*", "")

    return strings.TrimSpace(clearStars)
}
