"""
    z(x::Real, y::Real)::Complex

Constructs a complex number from Cartesian coordinates (x, y).
"""
function z(x::Real, y::Real)::Complex
    return complex(x, y)
end

"""
    euler(r::Real, θ::Real)::Complex

Constructs a complex number from polar coordinates (r, θ), where θ is in radians.
Uses Euler's formula: r * e^(iθ) = r * (cos(θ) + i*sin(θ)).
"""
function euler(r::Real, θ::Real)::Complex
    # The `cis(θ)` function in Julia directly calculates cos(θ) + i*sin(θ).
    # Then we multiply by the radius `r`.
    return r * cis(θ)
end

"""
    rotate(x::Real, y::Real, θ::Real)::Tuple{Real, Real}

Rotates a point (x, y) about the origin by an angle θ (in radians) and returns the new coordinates as a tuple (x', y').
"""
function rotate(x::Real, y::Real, θ::Real)::Tuple{Real, Real}
    # 1. Represent the initial point (x, y) as a complex number.
    initial_point_complex = z(x, y)

    # 2. Represent the rotation as a complex number (e^(iθ)).
    #    Multiplying by this complex number performs the rotation.
    rotation_complex = cis(θ)

    # 3. Perform the rotation by multiplying the complex numbers.
    #    The result is a new complex number (x' + y'i).
    rotated_point_complex = initial_point_complex * rotation_complex

    # 4. Extract the new Cartesian coordinates (x', y') from the rotated complex number.
    return (real(rotated_point_complex), imag(rotated_point_complex))
end

"""
    rdisplace(x::Real, y::Real, r_displacement::Real)::Tuple{Real, Real}

Displaces the x-y coordinates along the radius by the amount r_displacement and returns the new coordinates as a tuple (x', y').
"""
function rdisplace(x::Real, y::Real, r_displacement::Real)::Tuple{Real, Real}
    # 1. Represent the initial point (x, y) as a complex number.
    initial_point_complex = z(x, y)

    # 2. Get the current magnitude (radius) and angle of the initial point.
    current_r = abs(initial_point_complex)
    current_theta = angle(initial_point_complex)

    # 3. Calculate the new magnitude after displacement.
    new_r = current_r + r_displacement

    # Handle the edge case where the point is at the origin (0,0)
    # and the displacement is added. If new_r is negative, it implies
    # moving "past" the origin, which should flip the angle.
    if new_r < 0
        new_r = abs(new_r) # Make magnitude positive
        current_theta += pi # Flip direction by adding pi to angle
    end

    # If the original point was (0,0), its angle is undefined, and `angle(0+0im)` returns 0.0.
    # If `new_r` is now 0, it stays at the origin.
    # If `new_r` is positive from origin (e.g., r_displacement was positive),
    # it should move purely along the x-axis unless current_theta was already defined.
    # The `euler` function (r * cis(theta)) inherently handles the case where `r` is 0,
    # resulting in `0.0 + 0.0im`.

    # 4. Construct the new complex number using the new magnitude and original angle.
    displaced_point_complex = euler(new_r, current_theta)

    # 5. Extract the new Cartesian coordinates (x', y').
    return (real(displaced_point_complex), imag(displaced_point_complex))
end

"""
    findsong(needle_x::Real, needle_y::Real, r_displacement::Real, theta_displacement::Real)::Tuple{Real, Real}

Calculates the new coordinates of the needle given its current position and the radial and angular displacements to the desired song.
Returns the new coordinates as a tuple (x', y').
"""
function findsong(needle_x::Real, needle_y::Real, r_displacement::Real, theta_displacement::Real)::Tuple{Real, Real}
    # 1. Represent the current needle position (x, y) as a complex number.
    current_needle_pos = z(needle_x, needle_y)

    # 2. Apply the angular displacement (rotation).
    #    This rotates the needle's current position by theta_displacement.
    rotated_needle_pos = current_needle_pos * cis(theta_displacement)

    # 3. Apply the radial displacement.
    #    Get the magnitude and angle of the rotated position.
    current_r_rotated = abs(rotated_needle_pos)
    current_theta_rotated = angle(rotated_needle_pos)

    #    Calculate the new magnitude after radial displacement.
    new_r_after_displace = current_r_rotated + r_displacement

    # Handle cases where the new effective radius becomes negative,
    # meaning it crosses the origin and flips direction.
    if new_r_after_displace < 0
        new_r_after_displace = abs(new_r_after_displace) # Positive magnitude
        current_theta_rotated += pi # Flip angle by 180 degrees
    end

    # 4. Construct the final complex number using the new magnitude and the updated angle.
    final_pos_complex = euler(new_r_after_displace, current_theta_rotated)

    # 5. Extract the final Cartesian coordinates.
    return (real(final_pos_complex), imag(final_pos_complex))
end