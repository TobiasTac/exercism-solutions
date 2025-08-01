# No `using Parameters` needed anymore

# Task 1: Define a Point
struct Coord
    x::UInt16
    y::UInt16
end

# Task 2: Define a Plot
# Define Plot as a regular struct (immutable by default).
# We will manually define an outer constructor for keyword arguments.
struct Plot
    bottom_left::Coord
    top_right::Coord
end

# Manual outer constructor to support keyword arguments for Plot.
# This makes Plot(bottom_left=..., top_right=...) work as the tests expect.
Plot(; bottom_left::Coord, top_right::Coord) = Plot(bottom_left, top_right)


# Task 3: Check whether your claim has already been filed
function is_claim_staked(claim::Plot, register::Set{Plot})::Bool
    return claim in register
end

# Task 4: Speculators can stake their claim by specifying a plot identified by its corner coordinates
function stake_claim!(claim::Plot, register::Set{Plot})::Bool
    if is_claim_staked(claim, register)
        return false
    else
        push!(register, claim)
        return true
    end
end

# Task 5: Find the length of a plot's longer side.
function get_longest_side(claim::Plot)::UInt16
    horizontal_length = claim.top_right.x - claim.bottom_left.x
    vertical_length = claim.top_right.y - claim.bottom_left.y
    return max(horizontal_length, vertical_length)
end

# Task 6: Find the plot claimed that has the longest side, for research purposes
function get_claim_with_longest_side(register::Set{Plot})::Set{Plot}
    if isempty(register)
        return Set{Plot}()
    end

    max_longest_side = UInt16(0)

    for claim in register
        current_longest_side = get_longest_side(claim)
        if current_longest_side > max_longest_side
            max_longest_side = current_longest_side
        end
    end

    longest_side_claims = Set{Plot}()
    for claim in register
        if get_longest_side(claim) == max_longest_side
            push!(longest_side_claims, claim)
        end
    end

    return longest_side_claims
end