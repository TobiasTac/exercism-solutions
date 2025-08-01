package listops


type IntList []int


func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	acc := initial
	for _, v := range s {
		acc = fn(acc, v)
	}
	return acc
}


func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	acc := initial
	for i := len(s) - 1; i >= 0; i-- {
		acc = fn(s[i], acc)
	}
	return acc
}


func (s IntList) Filter(fn func(int) bool) IntList {
	result := IntList{}
	for _, v := range s {
		if fn(v) {
			result = append(result, v)
		}
	}
	return result
}


func (s IntList) Length() int {
	count := 0
	for range s {
		count++
	}
	return count
}


func (s IntList) Map(fn func(int) int) IntList {
	result := make(IntList, len(s))
	for i, v := range s {
		result[i] = fn(v)
	}
	return result
}


func (s IntList) Reverse() IntList {
	n := len(s)
	result := make(IntList, n)
	for i := 0; i < n; i++ {
		result[i] = s[n-1-i]
	}
	return result
}


func (s IntList) Append(lst IntList) IntList {
	totalLen := len(s) + len(lst)
	result := make(IntList, totalLen)
	for i := 0; i < len(s); i++ {
		result[i] = s[i]
	}
	for i := 0; i < len(lst); i++ {
		result[len(s)+i] = lst[i]
	}
	return result
}


func (s IntList) Concat(lists []IntList) IntList {
	totalLen := len(s)
	for _, l := range lists {
		totalLen += len(l)
	}
	result := make(IntList, totalLen)
	index := 0

	for i := 0; i < len(s); i++ {
		result[index] = s[i]
		index++
	}

	for _, l := range lists {
		for j := 0; j < len(l); j++ {
			result[index] = l[j]
			index++
		}
	}

	return result
}
