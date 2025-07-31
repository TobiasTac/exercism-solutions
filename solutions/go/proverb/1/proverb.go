package proverb

import "fmt"

// Proverb generates the "For want of a..." rhyme based on the given list of inputs.
// It returns a slice of strings, where each string is a line of the proverb.
func Proverb(rhyme []string) []string {
	// If the input rhyme slice is empty, there's no proverb to generate.
	if len(rhyme) == 0 {
		return []string{}
	}

	// Initialize a slice to hold the lines of our proverb.
	// We know there will be `n` main lines (where `n` is the number of inputs minus 1)
	// plus one final concluding line. So, total `len(rhyme)` lines.
	proverbLines := make([]string, 0, len(rhyme))

	// Generate the main linking lines of the proverb.
	// This loop goes up to the second-to-last element.
	// For each pair (rhyme[i], rhyme[i+1]), it forms a line.
	for i := 0; i < len(rhyme)-1; i++ {
		line := fmt.Sprintf("For want of a %s the %s was lost.", rhyme[i], rhyme[i+1])
		proverbLines = append(proverbLines, line)
	}

	// Add the final concluding line.
	// This line always refers back to the very first item in the input list.
	finalLine := fmt.Sprintf("And all for the want of a %s.", rhyme[0])
	proverbLines = append(proverbLines, finalLine)

	return proverbLines
}