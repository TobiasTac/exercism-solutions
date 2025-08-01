
package twelve

import (
	"fmt"
	"strings"
)


var days = []string{
	"first", "second", "third", "fourth", "fifth", "sixth",
	"seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
}


var gifts = []string{
	"a Partridge in a Pear Tree.",
	"two Turtle Doves",
	"three French Hens",
	"four Calling Birds",
	"five Gold Rings",
	"six Geese-a-Laying",
	"seven Swans-a-Swimming",
	"eight Maids-a-Milking",
	"nine Ladies Dancing",
	"ten Lords-a-Leaping",
	"eleven Pipers Piping",
	"twelve Drummers Drumming",
}



func Verse(i int) string {
	
	
	verse := fmt.Sprintf("On the %s day of Christmas my true love gave to me: ", days[i-1])

	
	var giftList []string
	for j := i - 1; j >= 0; j-- {
		giftList = append(giftList, gifts[j])
	}

	
	verse += strings.Join(giftList, ", ")

	
	
	if i > 1 {
		lastCommaIndex := strings.LastIndex(verse, ", ")
		verse = verse[:lastCommaIndex] + ", and " + verse[lastCommaIndex+2:]
	}

	return verse
}


func Song() string {
	var verses []string
	
	for i := 1; i <= 12; i++ {
		
		verses = append(verses, Verse(i))
	}
	
	return strings.Join(verses, "\n")
}
