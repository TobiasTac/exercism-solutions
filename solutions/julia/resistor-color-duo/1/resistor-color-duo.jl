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

function colorcode(colors::Vector{String})
    
    first_digit = COLOR_MAP[colors[1]]
    
    second_digit = COLOR_MAP[colors[2]]

    
    return first_digit * 10 + second_digit
end

function COLORS()
    
    
    
    pairs = collect(COLOR_MAP)
    
    
    sort!(pairs, by = x -> x[2])
    
    
    return [p[1] for p in pairs]
end
