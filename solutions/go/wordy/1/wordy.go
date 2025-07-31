
package wordy

import (
	"strconv"
	"strings"
)



func Answer(question string) (int, bool) {
	
	
	if !strings.HasPrefix(question, "What is") || !strings.HasSuffix(question, "?") {
		return 0, false
	}

	
	
	coreProblem := strings.TrimPrefix(question, "What is")
	coreProblem = strings.TrimSuffix(coreProblem, "?")
	coreProblem = strings.TrimSpace(coreProblem)

	
	if coreProblem == "" {
		return 0, false
	}

	
	replacer := strings.NewReplacer("multiplied by", "multiplied", "divided by", "divided")
	coreProblem = replacer.Replace(coreProblem)

	
	tokens := strings.Fields(coreProblem)

	
	result, err := strconv.Atoi(tokens[0])
	if err != nil {
		
		return 0, false
	}

	
	
	remainingTokens := tokens[1:]
	for len(remainingTokens) > 0 {
		
		if len(remainingTokens) < 2 {
			return 0, false 
		}

		operator := remainingTokens[0]
		operandStr := remainingTokens[1]

		operand, err := strconv.Atoi(operandStr)
		if err != nil {
			
			return 0, false
		}

		
		switch operator {
		case "plus":
			result += operand
		case "minus":
			result -= operand
		case "multiplied":
			result *= operand
		case "divided":
			result /= operand
		default:
			
			return 0, false
		}

		
		remainingTokens = remainingTokens[2:]
	}

	
	return result, true
}
