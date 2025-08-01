package parsinglogfiles

import (
	"fmt"
	"regexp"
	"strings"
)

func IsValidLine(text string) bool {

	validPrefixes := []string{"[TRC]", "[DBG]", "[INF]", "[WRN]", "[ERR]", "[FTL]"}


	for _, prefix := range validPrefixes {
		if strings.HasPrefix(text, prefix) {
			return true
		}
	}

	return false
}

func SplitLogLine(text string) []string {

	re := regexp.MustCompile(`<[~*=-]*>`)

	return re.Split(text, -1)
}


func CountQuotedPasswords(lines []string) int {
	count := 0

	re := regexp.MustCompile(`(?i)"[^"]*password[^"]*"`)

	for _, line := range lines {

		if re.MatchString(line) {
			count++
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {

	re := regexp.MustCompile(`end-of-line\d+`)

	return re.ReplaceAllString(text, "")
}


func TagWithUserName(lines []string) []string {

	re := regexp.MustCompile(`User\s+(\S+)`)

	taggedLines := make([]string, len(lines))

	for i, line := range lines {

		match := re.FindStringSubmatch(line)

		if len(match) > 1 {
			userName := match[1]
			taggedLines[i] = fmt.Sprintf("[USR] %s %s", userName, line)
		} else {
			taggedLines[i] = line
		}
	}
	return taggedLines
}
