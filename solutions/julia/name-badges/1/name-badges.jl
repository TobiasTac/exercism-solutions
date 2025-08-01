"""
    print_name_badge(id, name::String, department)::String

Creates an employee badge label based on ID, name, and department.

- If `id` is `missing`, the badge has no ID prefix.
- If `department` is `nothing`, the badge belongs to the owner.
- Department name is always in uppercase.
"""
function print_name_badge(id, name::String, department)::String
    prefix = ""
    # Task 2: Handle missing ID
    if ismissing(id)
        # No ID prefix needed
    else
        # Task 1: Regular employee with ID
        prefix = "[$(id)] - "
    end

    dept_string = ""
    # Task 3: Handle owner (department is nothing)
    if isnothing(department)
        dept_string = "OWNER"
    else
        # Task 1: Regular department, convert to uppercase
        dept_string = uppercase(department)
    end

    return "$(prefix)$(name) - $(dept_string)"
end

"""
    salaries_no_id(ids::Vector, salaries::Vector)::Real

Calculates the total salary of employees with no ID.

# Arguments
- `ids`: A vector of employee IDs, which may contain `missing` values.
- `salaries`: A corresponding vector of employee salaries.

# Returns
The sum of salaries for employees whose IDs are `missing`.
"""
function salaries_no_id(ids::Vector, salaries::Vector)::Real
    total_salary = 0.0 # Use float to be safe with sums

    # Iterate through the IDs and salaries simultaneously using `zip`.
    # `zip` creates an iterator that yields tuples of (id, salary) pairs.
    for (id, salary) in zip(ids, salaries)
        # Check if the current ID is missing.
        if ismissing(id)
            total_salary += salary
        end
    end

    return total_salary
end