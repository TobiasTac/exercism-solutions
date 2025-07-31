// Package complexnumbers provides a type and methods for working with complex numbers.
package complexnumbers

import "math"

// Number represents a complex number with a real and an imaginary part.
type Number struct {
	real float64
	imag float64
}

// Real returns the real part of the complex number.
func (n Number) Real() float64 {
	return n.real
}

// Imaginary returns the imaginary part of the complex number.
func (n Number) Imaginary() float64 {
	return n.imag
}

// Add returns the sum of two complex numbers.
// (a + ib) + (c + id) = (a + c) + i(b + d)
func (n1 Number) Add(n2 Number) Number {
	return Number{
		real: n1.real + n2.real,
		imag: n1.imag + n2.imag,
	}
}

// Subtract returns the difference of two complex numbers.
// (a + ib) - (c + id) = (a - c) + i(b - d)
func (n1 Number) Subtract(n2 Number) Number {
	return Number{
		real: n1.real - n2.real,
		imag: n1.imag - n2.imag,
	}
}

// Multiply returns the product of two complex numbers.
// (a + ib) * (c + id) = (ac - bd) + i(bc + ad)
func (n1 Number) Multiply(n2 Number) Number {
	a, b := n1.real, n1.imag
	c, d := n2.real, n2.imag
	return Number{
		real: a*c - b*d,
		imag: b*c + a*d,
	}
}

// Times returns the product of a complex number and a real number (scalar).
func (n Number) Times(factor float64) Number {
	return Number{
		real: n.real * factor,
		imag: n.imag * factor,
	}
}

// Divide returns the result of dividing one complex number by another.
// (a + ib) / (c + id) = (ac + bd)/(c² + d²) + i(bc - ad)/(c² + d²)
func (n1 Number) Divide(n2 Number) Number {
	a, b := n1.real, n1.imag
	c, d := n2.real, n2.imag
	denominator := c*c + d*d
	return Number{
		real: (a*c + b*d) / denominator,
		imag: (b*c - a*d) / denominator,
	}
}

// Conjugate returns the complex conjugate of a number.
// conjugate(a + ib) = a - ib
func (n Number) Conjugate() Number {
	return Number{
		real: n.real,
		imag: -n.imag,
	}
}

// Abs returns the absolute value (or modulus) of a complex number.
// |a + ib| = sqrt(a² + b²)
func (n Number) Abs() float64 {
	return math.Sqrt(n.real*n.real + n.imag*n.imag)
}

// Exp returns the exponential of a complex number.
// e^(a + ib) = e^a * (cos(b) + i * sin(b))
func (n Number) Exp() Number {
	factor := math.Exp(n.real)
	return Number{
		real: factor * math.Cos(n.imag),
		imag: factor * math.Sin(n.imag),
	}
}
