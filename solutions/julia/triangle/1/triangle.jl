# Helper function to check if the side lengths in the collection form a valid triangle
"""
    is_valid_triangle(sides::Vector{<:Real})::Bool

Checks if the given `sides` (a vector of lengths) can form a valid triangle.
Returns `true` if valid, `false` otherwise.
"""
function is_valid_triangle(sides::Vector{<:Real})::Bool
    # A triangle must have exactly three sides.
    if length(sides) != 3
        return false
    end

    # Assign sides to variables for clarity.
    a, b, c = sides[1], sides[2], sides[3]

    # 1. All sides must be of length > 0
    if a <= 0 || b <= 0 || c <= 0
        return false
    end

    # 2. Triangle Inequality Theorem: The sum of any two sides must be
    #    greater than or equal to the third side.
    if !(a + b >= c && b + c >= a && a + c >= b)
        return false
    end

    return true
end

"""
    is_equilateral(sides::Vector{<:Real})::Bool

Determines if a triangle with given `sides` is equilateral.
Returns `true` if it's a valid triangle and all three sides are equal.
"""
function is_equilateral(sides::Vector{<:Real})::Bool
    # First, ensure it's a valid triangle.
    if !is_valid_triangle(sides)
        return false
    end

    # Assign sides to variables for clarity.
    a, b, c = sides[1], sides[2], sides[3]
    
    # An equilateral triangle has all three sides equal.
    return a == b && b == c
end

"""
    is_isosceles(sides::Vector{<:Real})::Bool

Determines if a triangle with given `sides` is isosceles.
Returns `true` if it's a valid triangle and at least two sides are equal.
Note: An equilateral triangle is also considered isosceles by this definition.
"""
function is_isosceles(sides::Vector{<:Real})::Bool
    # First, ensure it's a valid triangle.
    if !is_valid_triangle(sides)
        return false
    end

    # Assign sides to variables for clarity.
    a, b, c = sides[1], sides[2], sides[3]
    
    # An isosceles triangle has at least two sides equal.
    return a == b || b == c || a == c
end

"""
    is_scalene(sides::Vector{<:Real})::Bool

Determines if a triangle with given `sides` is scalene.
Returns `true` if it's a valid triangle and all three sides are different lengths.
"""
function is_scalene(sides::Vector{<:Real})::Bool
    # First, ensure it's a valid triangle.
    if !is_valid_triangle(sides)
        return false
    end

    # Assign sides to variables for clarity.
    a, b, c = sides[1], sides[2], sides[3]
    
    # A scalene triangle has all sides of different lengths.
    return a != b && b != c && a != c
end