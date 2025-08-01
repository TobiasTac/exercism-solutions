
package bottlesong

import (
	"fmt"
	"strings"
)


var numberWords = map[int]string{
	10: "Ten",
	9:  "Nine",
	8:  "Eight",
	7:  "Seven",
	6:  "Six",
	5:  "Five",
	4:  "Four",
	3:  "Three",
	2:  "Two",
	1:  "One",
	0:  "no", 
}



func Recite(startBottles, takeDown int) []string {
	var lyrics []string

	
	for i := 0; i < takeDown; i++ {
		
		currentBottles := startBottles - i

		
		if i > 0 {
			lyrics = append(lyrics, "")
		}

		
		currentWord := numberWords[currentBottles]
		
		nextWord := numberWords[currentBottles-1]

		
		currentBottleForm := "bottles"
		if currentBottles == 1 {
			currentBottleForm = "bottle"
		}

		
		nextBottleForm := "bottles"
		if currentBottles-1 == 1 {
			nextBottleForm = "bottle"
		}

		

		
		lyrics = append(lyrics, fmt.Sprintf("%s green %s hanging on the wall,", currentWord, currentBottleForm))
		
		lyrics = append(lyrics, fmt.Sprintf("%s green %s hanging on the wall,", currentWord, currentBottleForm))
		
		lyrics = append(lyrics, "And if one green bottle should accidentally fall,")
		
		lyrics = append(lyrics, fmt.Sprintf("There'll be %s green %s hanging on the wall.", strings.ToLower(nextWord), nextBottleForm))
	}

	return lyrics
}
