function triangle(n::Int)::Vector{Vector{Int}}
    # Handle invalid input
    if n < 0
        throw(DomainError("Number of rows cannot be negative."))
    end

    # Base case: 0 rows
    if n == 0
        return Vector{Vector{Int}}() # Return an empty vector of vectors
    end

    # Initialize the triangle with the first row
    pascal_triangle = Vector{Vector{Int}}()
    push!(pascal_triangle, [1]) # First row is [1]

    # Generate subsequent rows
    for row_num in 2:n
        prev_row = pascal_triangle[row_num - 1]
        current_row = Vector{Int}(undef, row_num) # A row has `row_num` elements

        # The first element of the current row is always 1
        current_row[1] = 1

        # Calculate middle elements by summing adjacent elements from the previous row
        # We go up to row_num - 1 because the last element is also 1
        for i in 2:(row_num - 1)
            current_row[i] = prev_row[i-1] + prev_row[i]
        end

        # The last element of the current row is always 1
        current_row[row_num] = 1

        # Add the completed current row to the triangle
        push!(pascal_triangle, current_row)
    end

    return pascal_triangle
end