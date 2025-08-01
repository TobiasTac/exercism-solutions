package expenses

import "errors"

type Record struct {
	Day      int
	Amount   float64
	Category string
}

type DaysPeriod struct {
	From int
	To   int
}

func Filter(in []Record, predicate func(Record) bool) []Record {
	var filteredRecords []Record
	for _, r := range in {
		if predicate(r) {
			filteredRecords = append(filteredRecords, r)
		}
	}
	return filteredRecords
}

func ByDaysPeriod(p DaysPeriod) func(Record) bool {
	return func(r Record) bool {
		return r.Day >= p.From && r.Day <= p.To
	}
}

func ByCategory(c string) func(Record) bool {
	return func(r Record) bool {
		return r.Category == c
	}
}

func TotalByPeriod(in []Record, p DaysPeriod) float64 {
	filteredByPeriod := Filter(in, ByDaysPeriod(p))
	var total float64
	for _, r := range filteredByPeriod {
		total += r.Amount
	}
	return total
}

func CategoryExpenses(in []Record, p DaysPeriod, c string) (float64, error) {
	categoryExistsInAnyRecord := false
	for _, r := range in {
		if r.Category == c {
			categoryExistsInAnyRecord = true
			break
		}
	}

	if !categoryExistsInAnyRecord {
		return 0, errors.New("unknown category " + c)
	}

	filteredByPeriod := Filter(in, ByDaysPeriod(p))
	filteredByCategoryAndPeriod := Filter(filteredByPeriod, ByCategory(c))

	var total float64
	for _, r := range filteredByCategoryAndPeriod {
		total += r.Amount
	}

	return total, nil
}
