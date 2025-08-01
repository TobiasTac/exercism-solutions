using Random # Required for shuffle, randstring, etc.

using Random # Make sure this is at the top of your file

# Task 1: Generate a random planet
"""
    random_planet()::Char

Returns one of the possible planetary classes (D, H, J, K, L, M, N, R, T, Y) at random.
"""
function random_planet()::Char # Renamed from random_planet_class
    # Define the possible planetary classes as a vector of characters.
    planetary_classes = ['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y']

    # Use `rand()` with a collection to pick a random element.
    return rand(planetary_classes)
end


function random_ship_registry_number()::String
    # Generate a random integer between 1000 and 9999.
    registry_number = rand(1000:9999)
    
    # Format it into the "NCC-XXXX" string.
    return "NCC-$(registry_number)"
end

# Task 3: Generate a random stardate
"""
    random_stardate()::Float64

Returns a floating-point stardate between 41000.0 (inclusive) and 42000.0.
"""
function random_stardate()::Float64
    # rand() without arguments gives a Float64 in [0.0, 1.0).
    # To get a value in [min, max), we use min + rand() * (max - min).
    # For inclusive max, we typically get [min, max].
    return 41000.0 + rand() * (42000.0 - 41000.0)
end

# Task 4: Generate a rounded stardate
"""
    random_stardate_v2()::Float64

Returns a floating-point stardate between 41000.0 and 42000.0 (inclusive),
with a single decimal place.
"""
function random_stardate_v2()::Float64
    # To get a single decimal place, we can generate a random integer
    # over a larger range and then divide by 10.
    # The range 41000.0 to 42000.0 has a span of 1000.0.
    # To get one decimal place, we need 1000.0 * 10 = 10000 possible values.
    # So, generate an integer between 410000 and 420000 and divide by 10.0.
    random_int_scaled = rand(410000:420000)
    return random_int_scaled / 10.0
end

# Task 5: Pick some random starships from a list.
"""
    pick_starships(starships::Vector{String}, number_needed::Int)::Vector{String}

Takes a vector of unique starship registry numbers and returns a vector
of length `number_needed` chosen randomly without duplicates.
"""
function pick_starships(starships::Vector{String}, number_needed::Int)::Vector{String}
    # `shuffle` randomly reorders the elements of the vector.
    # Then we take the first `number_needed` elements.
    # This guarantees no duplicates since the original `starships` vector has unique entries.
    return shuffle(starships)[1:number_needed]
end

function pick_starships(starships, number_needed::Int)::Vector
    # Convert any iterable to a vector first if it's not already.
    # `collect` converts an iterable to an array (Vector in this case).
    starships_vec = collect(starships)
    return shuffle(starships_vec)[1:number_needed]
end