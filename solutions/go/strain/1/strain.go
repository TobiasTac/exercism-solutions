package strain

// Keep returns a new collection containing those elements from the input slice
// where the provided predicate function returns true.
// It uses generics [T any] to work with any type of slice.
func Keep[T any](collection []T, predicate func(T) bool) []T {
	// Initialize an empty slice to store the results.
	// We make it with a capacity equal to the input collection's length
	// to potentially reduce reallocations, though it's not strictly necessary.
	result := make([]T, 0, len(collection))

	// Iterate over each element in the input collection.
	for _, element := range collection {
		// If the predicate function returns true for the current element,
		// append it to our result slice.
		if predicate(element) {
			result = append(result, element)
		}
	}

	// Return the new slice containing the kept elements.
	return result
}

// Discard returns a new collection containing those elements from the input slice
// where the provided predicate function returns false.
// It is the inverse of the Keep operation.
// It uses generics [T any] to work with any type of slice.
func Discard[T any](collection []T, predicate func(T) bool) []T {
	// Initialize an empty slice to store the results, similar to Keep.
	result := make([]T, 0, len(collection))

	// Iterate over each element in the input collection.
	for _, element := range collection {
		// If the predicate function returns false for the current element,
		// append it to our result slice.
		if !predicate(element) { // The key difference: check for !predicate(element)
			result = append(result, element)
		}
	}

	// Return the new slice containing the discarded elements.
	return result
}