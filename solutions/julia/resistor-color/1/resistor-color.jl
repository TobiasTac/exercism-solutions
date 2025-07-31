# Define a global constant for the color mapping.
# The 1-based index in this array corresponds to the value + 1.
const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

"""
    color_code(color_name::String)::Int

Looks up the numerical value associated with a particular color band.
"""
function colorcode(color_name::String)::Int
    # Find the 1-based index of the color in the COLORS array.
    # The `findfirst` function returns the index of the first occurrence
    # or `nothing` if the element is not found.
    # We subtract 1 because the color values are 0-indexed (black: 0),
    # while Julia array indices are 1-indexed.
    idx = findfirst(isequal(color_name), COLORS)
    return idx - 1
end

"""
    colors()::Vector{String}

Lists all the different band colors in their defined order.
"""
function colors()::Vector{String}
    # Returns the predefined global constant array containing all color names.
    return COLORS
end