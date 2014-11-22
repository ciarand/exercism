package leap

// IsLeapYear returns a boolean indicating whether the provided year is a leap
// year
func IsLeapYear(year int) bool {
	// if the year isn't a multiple of 4, it's not a leap year
	if year%4 != 0 {
		return false
	}

	// if it's divisible by 400, it's a leap year
	if year%400 == 0 {
		return true
	}

	// otherwise it's a leap year as long as it's not divisible by 100
	return !(year%100 == 0)
}
