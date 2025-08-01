using Dates

const GIGASECOND = 1_000_000_000

function add_gigasecond(date::DateTime)::DateTime
    return date + Second(GIGASECOND)
end
