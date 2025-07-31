
package summultiples



func SumMultiples(limit int, divisors ...int) int {
	
	
	multiples := make(map[int]bool)

	
	for _, divisor := range divisors {
		
		
		if divisor == 0 {
			continue
		}

		
		for i := divisor; i < limit; i += divisor {
			
			multiples[i] = true
		}
	}

	
	sum := 0
	
	for m := range multiples {
		sum += m
	}

	return sum
}
