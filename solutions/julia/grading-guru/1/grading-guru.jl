"""
    demote(n::Float64)::UInt8

Demotes a Float64 grade by rounding up to the nearest whole number and converting to UInt8.
"""
function demote(n::Float64)::UInt8
    return UInt8(ceil(n)) # ceil() rounds up, then convert to UInt8
end

"""
    demote(n::Integer)::Int8

Demotes an Integer grade by converting it to Int8.
"""
function demote(n::Integer)::Int8
    return Int8(n) # Directly convert to Int8
end

# This is a fallback method for any other input type not explicitly handled.
# It will be called if the input type doesn't match Float64 or Integer.
function demote(n)
    throw(MethodError(demote, (n,)))
end

"""
    preprocess(coll::Vector)::Vector{Int8} or Vector{UInt8}

Preprocesses a Vector of grades: demotes all numbers and reverses the vector.
The element type of the returned vector will depend on the type of numbers in the input vector.
"""
function preprocess(coll::Vector) # Type of elements can be mixed, so just Vector
    # Demote each number in the collection.
    # The `demote` function's multiple dispatch will handle Float64 vs Integer elements.
    # `map(demote, coll)` applies demote to each element.
    demoted_grades = map(demote, coll)

    # Reverse the demoted vector.
    return reverse(demoted_grades)
end

"""
    preprocess(coll::Set)::Vector{Int8} or Vector{UInt8}

Preprocesses a Set of grades: demotes all numbers and returns a sorted vector in descending order.
The element type of the returned vector will depend on the type of numbers in the input set.
"""
function preprocess(coll::Set) # Type of elements can be mixed, so just Set
    # Demote each number in the collection.
    demoted_grades = map(demote, collect(coll)) # collect() converts Set to Vector for map

    # Sort the demoted numbers in descending order.
    # `sort` returns a new sorted array. `rev=true` makes it descending.
    return sort(demoted_grades, rev=true)
end

# This is a fallback method for any other input type not explicitly handled.
function preprocess(coll)
    throw(MethodError(preprocess, (coll,)))
end
