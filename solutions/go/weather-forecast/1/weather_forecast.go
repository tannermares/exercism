// Package weather provides a forcast using current location and conditions.
package weather

// CurrentCondition stores the current condition string.
var CurrentCondition string
// CurrentLocation stores the current location as a string.
var CurrentLocation string


// Forecast returns a forecast string using a city and a condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
