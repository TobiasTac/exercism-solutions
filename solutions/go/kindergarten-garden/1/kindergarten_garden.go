
package kindergarten

import (
	"errors"
	"sort"
	"strings"
)


var plantNames = map[rune]string{
	'V': "violets",
	'R': "radishes",
	'C': "clover",
	'G': "grass",
}


type Garden struct {
	
	childPositions map[string]int
	
	row1 string
	row2 string
}



func NewGarden(diagram string, children []string) (*Garden, error) {
	

	
	if !strings.HasPrefix(diagram, "\n") {
		return nil, errors.New("bad diagram format: must start with a newline")
	}

	
	rows := strings.Split(strings.TrimPrefix(diagram, "\n"), "\n")
	if len(rows) != 2 {
		return nil, errors.New("diagram must have two rows")
	}
	row1, row2 := rows[0], rows[1]

	
	if len(row1) != len(row2) {
		return nil, errors.New("diagram rows must have the same length")
	}

	
	if len(row1)%2 != 0 {
		return nil, errors.New("diagram rows must have an even number of cups")
	}

	
	for _, r := range row1 + row2 {
		if _, ok := plantNames[r]; !ok {
			return nil, errors.New("invalid plant code in diagram")
		}
	}

	

	
	sortedChildren := make([]string, len(children))
	copy(sortedChildren, children)
	sort.Strings(sortedChildren)

	
	for i := 0; i < len(sortedChildren)-1; i++ {
		if sortedChildren[i] == sortedChildren[i+1] {
			return nil, errors.New("duplicate child name provided")
		}
	}

	
	positions := make(map[string]int)
	for i, name := range sortedChildren {
		positions[name] = i
	}

	
	garden := &Garden{
		childPositions: positions,
		row1:           row1,
		row2:           row2,
	}
	return garden, nil
}



func (g *Garden) Plants(child string) ([]string, bool) {
	
	childIndex, ok := g.childPositions[child]
	if !ok {
		return nil, false
	}

	
	startIndex := childIndex * 2

	
	plantCodes := []rune{
		rune(g.row1[startIndex]),
		rune(g.row1[startIndex+1]),
		rune(g.row2[startIndex]),
		rune(g.row2[startIndex+1]),
	}

	
	result := make([]string, 4)
	for i, code := range plantCodes {
		result[i] = plantNames[code]
	}

	return result, true
}
