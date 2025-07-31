// Package weather package provides information about the climate.
package weather

// CurrentCondition represents your condiction actual.
var CurrentCondition string
// CurrentLocation represent your location actual.
var CurrentLocation string

// Forecast return an struing value .
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
