package raindrops

import (
	"strconv"
	"strings"
)

// Convert creates a string representation of i based on the rules in the
// README.
func Convert(i int) string {
	words := make([]string, 0, 3)

	for _, v := range factors(i) {
		switch v {
		case 3:
			words = append(words, "Pling")
		case 5:
			words = append(words, "Plang")
		case 7:
			words = append(words, "Plong")
		}
	}

	if len(words) == 0 {
		return strconv.Itoa(i)
	}

	return strings.Join(words, "")
}

// factors returns ALL the factors of input, not just the prime ones!
func factors(input int) []int {
	f := []int{input}

	for i := 1; i < input; i++ {
		if input%i == 0 {
			f = append(f, i)
		}
	}

	return f
}
