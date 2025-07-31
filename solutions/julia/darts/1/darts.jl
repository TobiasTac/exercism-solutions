using LinearAlgebra 

function score(x::Real, y::Real)

    distance = norm([x, y])

    if distance <= 1.0
        # Inner circle
        return 10
    elseif distance <= 5.0
        # Middle circle
        return 5
    elseif distance <= 10.0
        # Outer circle
        return 1
    else
        # Outside the target
        return 0
    end
end
