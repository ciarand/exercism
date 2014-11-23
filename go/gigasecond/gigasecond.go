package gigasecond

import "time"

const (
	// TestVersion is apparently required for exercism.
	TestVersion = 1
)

// Birthday is my birthday.
var Birthday time.Time

func init() {
	// we can safely ignore the error because we know this parses correctly
	Birthday, _ = time.Parse("2006-01-02", "1991-02-16")
}

// AddGigasecond adds a Gigasecond (10e9 seconds) to the provide time.Time and
// returns the result.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(10e8) * time.Second)
}
