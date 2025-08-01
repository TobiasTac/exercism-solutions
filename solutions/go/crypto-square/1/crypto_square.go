
package cryptosquare

import (
	"math"
	"strings"
	"unicode"
)


func Encode(pt string) string {
	
	
	var normalized strings.Builder
	for _, r := range pt {
		if unicode.IsLetter(r) || unicode.IsDigit(r) {
			normalized.WriteRune(unicode.ToLower(r))
		}
	}

	plaintext := normalized.String()
	length := len(plaintext)

	
	if length == 0 {
		return ""
	}

	
	
	c := int(math.Ceil(math.Sqrt(float64(length))))
	r := int(math.Ceil(float64(length) / float64(c)))

	
	

	
	chunks := make([]string, c)
	
	
	paddedPlaintext := plaintext + strings.Repeat(" ", r*c-length)

	for j := 0; j < c; j++ { 
		var colBuilder strings.Builder
		for i := 0; i < r; i++ { 
			
			colBuilder.WriteByte(paddedPlaintext[i*c+j])
		}
		chunks[j] = colBuilder.String()
	}

	
	return strings.Join(chunks, " ")
}
