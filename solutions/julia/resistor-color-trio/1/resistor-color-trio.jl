
const COLOR_MAP = Dict(
    "black"  => 0,
    "brown"  => 1,
    "red"    => 2,
    "orange" => 3,
    "yellow" => 4,
    "green"  => 5,
    "blue"   => 6,
    "violet" => 7,
    "grey"   => 8,
    "white"  => 9,
)

function label(colors::Vector{String})
    
    base_value = COLOR_MAP[colors[1]] * 10 + COLOR_MAP[colors[2]]

    
    multiplier = 10^COLOR_MAP[colors[3]]

    
    total_ohms = base_value * multiplier

    
    local value_num, unit
    if total_ohms >= 1_000_000_000
        
        value_num = total_ohms / 1_000_000_000
        unit = "gigaohms"
    elseif total_ohms >= 1_000_000
        value_num = total_ohms / 1_000_000
        unit = "megaohms"
    elseif total_ohms >= 1_000
        value_num = total_ohms / 1_000
        unit = "kiloohms"
    else
        value_num = total_ohms
        unit = "ohms"
    end

    
    
    
    local value_str
    if value_num == floor(value_num)
        value_str = string(Int(value_num))
    else
        value_str = string(value_num)
    end

    
    return "$value_str $unit"
end
