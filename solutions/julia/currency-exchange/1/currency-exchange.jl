function exchange_money(budget::Real, exchange_rate::Real)::Real
    return budget / exchange_rate
end

function get_change(budget::Real, exchanging_value::Real)::Real
    return budget - exchanging_value
end

function get_value_of_bills(denomination::Real, number_of_bills::Real)::Real
    return denomination * number_of_bills
end

function get_number_of_bills(amount::Real, denomination::Real)::Real
    return floor(Int, amount / denomination)
end

function get_leftover_of_bills(amount::Real, denomination::Real)::Real
    num_bills = get_number_of_bills(amount, denomination)
    value_returned = get_value_of_bills(denomination, num_bills)
    
    return amount - value_returned
end

function exchangeable_value(budget::Real, exchange_rate::Real, spread, denomination::Real)::Real
    spread_decimal = spread / 100.0

    actual_exchange_rate = exchange_rate + (exchange_rate * spread_decimal)

    total_foreign_currency_value = exchange_money(budget, actual_exchange_rate)

    num_bills = get_number_of_bills(total_foreign_currency_value, denomination)

    return get_value_of_bills(denomination, num_bills)
end
