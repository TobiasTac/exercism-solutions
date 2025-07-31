function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3.0
    elseif juice == "All or Nothing"
        return 5.0
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
   wedgesCut = 0
    limesCount = 0

    for lime_size in limes
        if wedgesCut >= needed
            break
        end

        wedgesCut += wedges_from_lime(lime_size)
        limesCount += 1
    end

    return limesCount
end
    
function order_times(orders)
    times = Float64[]
    for order in orders
        push!(times, time_to_mix_juice(order))
    end
    return times
end

function remaining_orders(time_left, orders)
    timeSpent = 0.0
    remaining = String[]

    for i in 1:length(orders)
        mixTime = time_to_mix_juice(orders[i])

        if timeSpent >= time_left
            append!(remaining, orders[i:end])
            break
        else
            timeSpent += mixTime
        end
    end

        return remaining
end
