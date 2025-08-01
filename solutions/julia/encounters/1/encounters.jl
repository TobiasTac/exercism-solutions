using Random # Make sure this is at the top of your file

# Define an abstract type Pet
abstract type Pet end

# Define concrete types Dog and Cat
struct Dog <: Pet
    name::String
end

struct Cat <: Pet
    name::String
end

# Task 5: Define Horse type for later
struct Horse <: Pet
    name::String
end

# Task 6: Define Bicycle type for later
struct Bicycle
    name::String
end

# Task 7: Define Photon type for later
struct Photon
    name::String
end

# Implement a function `name()` which returns the name of a pet.
name(p::Pet) = p.name
name(o) = o.name # Generic name function for any object with a .name field

# Define multiple methods for meets(a, b)
# Corrected: Changed "sniff" to "sniffs"
meets(a::Dog, b::Dog) = "sniffs"

# When a cat meets a dog, it hisses at the dog.
meets(a::Cat, b::Dog) = "hisses"

# When a dog meets a cat, it chases the cat.
meets(a::Dog, b::Cat) = "chases"

# Corrected: Changed "slink" to "slinks"
meets(a::Cat, b::Cat) = "slinks" # <--- CORRECTION IS HERE

# Task 5: Define a fallback reaction for encounters between pets
meets(a::Pet, b::Pet) = "is cautious"

# Task 6: Define a fallback if a pet encounters something it doesn't know
meets(a::Pet, b) = "runs away"

# Task 7: Define a generic fallback
meets(a, b) = "nothing happens"

# Implement the `encounter()` function with one method, to report what happens when two named entities meet.
encounter(a, b) = "$(name(a)) meets $(name(b)) and $(meets(a, b))."