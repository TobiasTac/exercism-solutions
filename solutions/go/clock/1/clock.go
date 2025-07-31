package clock

import "fmt"

type Clock int

func New(h, m int) Clock {
	totalMinutes := h*60 + m
	normalizedMinutes := (totalMinutes % (24 * 60) + (24 * 60)) % (24 * 60)

	return Clock(normalizedMinutes)
}

func (c Clock) Add(m int) Clock {
	return New(0, int(c)+m)
}

func (c Clock) Subtract(m int) Clock {
	return New(0, int(c)-m)
}

func (c Clock) String() string {
	totalMinutes := int(c)
	hours := totalMinutes / 60
	minutes := totalMinutes % 60
	return fmt.Sprintf("%02d:%02d", hours, minutes)
}