
package bookstore

import (
	"fmt"
	"sort"
	"strings"
)


var memo map[string]int


var discountPrices = map[int]int{
	0: 0,    
	1: 800,  
	2: 1520, 
	3: 2160, 
	4: 2560, 
	5: 3000, 
}


func Cost(books []int) int {
	
	memo = make(map[string]int)

	
	countsMap := make(map[int]int)
	for _, book := range books {
		countsMap[book]++
	}

	
	var initialCounts []int
	for _, count := range countsMap {
		initialCounts = append(initialCounts, count)
	}

	
	return solve(initialCounts)
}



func solve(counts []int) int {
	
	if len(counts) == 0 {
		return 0
	}

	
	
	
	sort.Sort(sort.Reverse(sort.IntSlice(counts)))

	
	keyBuilder := strings.Builder{}
	for i, c := range counts {
		if i > 0 {
			keyBuilder.WriteString(",")
		}
		keyBuilder.WriteString(fmt.Sprintf("%d", c))
	}
	key := keyBuilder.String()

	
	if cost, found := memo[key]; found {
		return cost
	}

	
	minCost := -1

	
	
	for i := 1; i <= len(counts); i++ {
		
		newCounts := make([]int, len(counts))
		copy(newCounts, counts)
		for j := 0; j < i; j++ {
			newCounts[j]--
		}

		
		var filteredCounts []int
		for _, c := range newCounts {
			if c > 0 {
				filteredCounts = append(filteredCounts, c)
			}
		}

		
		currentCost := discountPrices[i] + solve(filteredCounts)

		
		if minCost == -1 || currentCost < minCost {
			minCost = currentCost
		}
	}

	
	memo[key] = minCost
	return minCost
}
