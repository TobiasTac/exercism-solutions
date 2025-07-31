package sublist

func areEqual(l1, l2 []int) bool {
	if len(l1) != len(l2) {
		return false
	}
	for i := range l1 {
		if l1[i] != l2[i] {
			return false
		}
	}
	return true
}

 
func isSubsequence(main, sub []int) bool {
	if len(sub) == 0 {
		return true
	}
	if len(main) < len(sub) {
		return false
	}
	for i := 0; i <= len(main)-len(sub); i++ {
		if areEqual(main[i:i+len(sub)], sub) {
			return true
		}
	}
	return false
}

 
func Sublist(l1, l2 []int) Relation {
	isL1Super := isSubsequence(l1, l2)
	isL2Super := isSubsequence(l2, l1)

	 
	if isL1Super && isL2Super {
		return RelationEqual
	}
	 
	if isL1Super {
		return RelationSuperlist
	}
	 
	if isL2Super {
		return RelationSublist
	}

	 
	return RelationUnequal
}