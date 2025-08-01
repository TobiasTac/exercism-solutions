function today(birds_per_day::Vector{Int})
    return birds_per_day[end]
end

function increment_todays_count(birds_per_day::Vector{Int})
    birds_per_day[end] += 1
    return birds_per_day
end

function has_day_without_birds(birds_per_day::Vector{Int})
    return any(count -> count == 0, birds_per_day)
end

function count_for_first_days(birds_per_day::Vector{Int}, num_days::Int)
    actual_days = min(num_days, length(birds_per_day))
    return sum(birds_per_day[1:actual_days])
end

function busy_days(birds_per_day::Vector{Int})
    return count(count -> count >= 5, birds_per_day)
end

function average_per_day(week1::Vector{Int}, week2::Vector{Int})
    return (week1 .+ week2) ./ 2.0
end
