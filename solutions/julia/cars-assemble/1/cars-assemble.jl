function success_rate(speed::Int)::Float64
    if speed == 0
        return 0.0
    elseif speed >= 1 && speed <= 4
        return 1.0
    elseif speed >= 5 && speed <= 8
        return 0.9
    elseif speed == 9
        return 0.8
    elseif speed == 10
        return 0.77
    else
        return 0.0
    end
end

const carsPerHourAtSpeed1 = 221.0

function production_rate_per_hour(speed::Int)::Float64
    
    if speed == 0
            return 0.0
    end

    rawProduction = speed * carsPerHourAtSpeed1
    sRate = success_rate(speed)

    return rawProduction * sRate
end

function working_items_per_minute(speed::Int)::Int
    hourlyWorkingItems = production_rate_per_hour(speed)

    return floor(Int, hourlyWorkingItems / 60.0)
end
