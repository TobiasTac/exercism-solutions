package triangle

// Kind represents the type of a triangle.
type Kind int

// These constants define the possible classifications for a triangle.
const (
	NaT Kind = iota // Not a triangle
	Equ             // Equilateral
	Iso             // Isosceles
	Sca             // Scalene
)

func KindFromSides(a, b, c float64) Kind {
	// Rule 1: All sides must be of length > 0.
	// If any side is non-positive, it's not a valid triangle.
	if a <= 0 || b <= 0 || c <= 0 {
		return NaT
	}

	// Rule 2: Triangle Inequality Theorem
	// The sum of the lengths of any two sides must be greater than or equal to the length of the third side.
	// This ensures the sides can actually form a closed shape.
	if (a+b < c) || (b+c < a) || (a+c < b) {
		return NaT
	}

	// Now that we know it's a valid triangle, apply classification rules.
	// We check from the most specific to the least specific.

	// Equilateral: All three sides are the same length.
	if a == b && b == c {
		return Equ
	}

	// Isosceles: At least two sides are the same length.
	// This check comes after Equilateral, so if it's Equ, it won't hit this.
	if a == b || b == c || a == c {
		return Iso
	}

	// Scalene: All sides are of different lengths.
	// If it passed the above checks (meaning it's not Equ or Iso), it must be Scalene.
	return Sca
}