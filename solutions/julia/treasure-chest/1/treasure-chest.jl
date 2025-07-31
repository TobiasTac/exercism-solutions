"""
    TreasureChest{T}(password::String, treasure::T)

A parametric type representing a treasure chest.

# Fields
- `password::String`: The password to open the chest.
- `treasure::T`: The treasure stored inside, with a generic type `T`.
"""
struct TreasureChest{T}
    password::String
    treasure::T
end

"""
    get_treasure(password_attempt::String, chest::TreasureChest)

Checks the provided password attempt against the `password` in the `TreasureChest`.
If the passwords match, returns the treasure. Otherwise, returns `nothing`.
"""
function get_treasure(password_attempt::String, chest::TreasureChest)
    if password_attempt == chest.password
        return chest.treasure
    else
        return nothing
    end
end

"""
    multiply_treasure(multiplier::Int, chest::TreasureChest{T})::TreasureChest{Vector{T}} where T

Returns a new `TreasureChest` with the same password and the original treasure
repeated `multiplier` times as a `Vector{T}`.
"""
function multiply_treasure(multiplier::Int, chest::TreasureChest{T})::TreasureChest{Vector{T}} where T
    # Create a new vector containing the original treasure repeated 'multiplier' times.
    # `fill(chest.treasure, multiplier)` creates a vector where `chest.treasure`
    # is repeated `multiplier` times.
    multiplied_treasure = fill(chest.treasure, multiplier)

    # Return a new TreasureChest.
    # Note the type of the new chest is TreasureChest{Vector{T}}
    return TreasureChest{Vector{T}}(chest.password, multiplied_treasure)
end