package sorting

import (
	"fmt"
	"strconv"
)

func DescribeNumber(f float64) string {
	return fmt.Sprintf("This is the number %.1f", f)
}

type NumberBox interface {
	Number() int
}

func DescribeNumberBox(nb NumberBox) string {
	return fmt.Sprintf("This is a box containing the number %.1f", float64(nb.Number()))
}

type FancyNumber struct {
	n string
}

func (i FancyNumber) Value() string {
	return i.n
}

type FancyNumberBox interface {
	Value() string
}


func ExtractFancyNumber(fnb FancyNumberBox) int {

	if fn, ok := fnb.(FancyNumber); ok {

		val, _ := strconv.Atoi(fn.Value())
		return val
	}

	return 0
}

func DescribeFancyNumberBox(fnb FancyNumberBox) string {

	extractedNum := ExtractFancyNumber(fnb)
	return fmt.Sprintf("This is a fancy box containing the number %.1f", float64(extractedNum))
}

func DescribeAnything(i interface{}) string {
	switch v := i.(type) {
	case int:

		return DescribeNumber(float64(v))
	case float64:
		return DescribeNumber(v)
	case NumberBox:
		return DescribeNumberBox(v)
	case FancyNumberBox:
		return DescribeFancyNumberBox(v)
	default:
		return "Return to sender"
	}
}
