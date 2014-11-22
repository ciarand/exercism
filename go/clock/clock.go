package clock

import (
	"fmt"
)

const (
	// TestVersion is apparently required for this exercise?
	TestVersion = 1
	minsInDay   = 1440
)

// Clock is a representation of a Clock (minus dates)
type Clock struct {
	// time is stored in minutes
	time int
}

// New creates a new, normalized Clock
func New(hours, mins int) Clock {
	return Clock{hours*60 + mins}.normalize()
}

// String creates a string representation of the associated clock
func (c Clock) String() string {
	h, m := c.hoursAndMinutes()

	return fmt.Sprintf("%02d:%02d", h, m)
}

// normalize handles stuff like 61 minutes or negative hours
func (c Clock) normalize() Clock {
	hours, mins := c.hoursAndMinutes()

	// if minutes is negative, we need to borrow from the hours component
	if mins < 0 {
		hours, mins = hours-1, mins+60
	}

	// if we need to rollover
	if hours < 0 {
		hours += 24
	}

	return Clock{hours*60 + mins}
}

// hoursAndMinutes returns the component parts of a clock (hours, minutes)
func (c Clock) hoursAndMinutes() (hours, minutes int) {
	c.time = c.time % minsInDay

	minutes = c.time % 60
	hours = c.time / 60

	return hours, minutes
}

// Add adds the provided number of minutes to the associated Clock (and then
// normalizes it just in case)
func (c Clock) Add(mins int) Clock {
	c.time += mins

	return c.normalize()
}
