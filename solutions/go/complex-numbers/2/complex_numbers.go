
package complexnumbers

import "math"


type Number struct {
	real float64
	imag float64
}


func (n Number) Real() float64 {
	return n.real
}


func (n Number) Imaginary() float64 {
	return n.imag
}



func (n1 Number) Add(n2 Number) Number {
	return Number{
		real: n1.real + n2.real,
		imag: n1.imag + n2.imag,
	}
}



func (n1 Number) Subtract(n2 Number) Number {
	return Number{
		real: n1.real - n2.real,
		imag: n1.imag - n2.imag,
	}
}



func (n1 Number) Multiply(n2 Number) Number {
	a, b := n1.real, n1.imag
	c, d := n2.real, n2.imag
	return Number{
		real: a*c - b*d,
		imag: b*c + a*d,
	}
}


func (n Number) Times(factor float64) Number {
	return Number{
		real: n.real * factor,
		imag: n.imag * factor,
	}
}



func (n1 Number) Divide(n2 Number) Number {
	a, b := n1.real, n1.imag
	c, d := n2.real, n2.imag
	denominator := c*c + d*d
	return Number{
		real: (a*c + b*d) / denominator,
		imag: (b*c - a*d) / denominator,
	}
}



func (n Number) Conjugate() Number {
	return Number{
		real: n.real,
		imag: -n.imag,
	}
}



func (n Number) Abs() float64 {
	return math.Sqrt(n.real*n.real + n.imag*n.imag)
}



func (n Number) Exp() Number {
	factor := math.Exp(n.real)
	return Number{
		real: factor * math.Cos(n.imag),
		imag: factor * math.Sin(n.imag),
	}
}
