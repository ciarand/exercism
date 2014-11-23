package leap

// IsLeapYear returns a boolean indicating whether the provided year is a leap
// year.
func IsLeapYear(year int) bool {
	switch {
	// if the year isn't a multiple of 4, it's not a leap year
	case year%4 != 0:
		return false

	// if it's divisible by 400, it's definitely a leap year
	case year%400 == 0:
		return true

	// otherwise it's a leap year unless it's divisible by 100
	default:
		return year%100 != 0
	}
}
