function get_vector_of_wagons(args...)
    return collect(args)
end

function fix_vector_of_wagons(each_wagons_id::Vector{Int}, missing_wagons::Vector{Int})
    first_wagon = each_wagons_id[1]
    second_wagon = each_wagons_id[2]

    locomotive_idx = findfirst(isequal(1), each_wagons_id)

    new_vector = Int[]

    push!(new_vector, 1)

    append!(new_vector, missing_wagons)

    # Filter out the first_wagon and second_wagon from the rest of the original list
    for i in (locomotive_idx + 1):length(each_wagons_id)
        current_wagon_id = each_wagons_id[i]
        if current_wagon_id != first_wagon && current_wagon_id != second_wagon
            push!(new_vector, current_wagon_id)
        end
    end
    
    push!(new_vector, first_wagon)
    push!(new_vector, second_wagon)

    return new_vector
end

# This function must handle an input Dict{String, String} and produce a Dict{String, Any}
function add_missing_stops(route::Dict{String, String}, stops_pairs::Pair{String, String}...)
    # Create a new Dict{String, Any} and copy elements from the original route.
    # This allows adding a Vector{String} value for "stops".
    new_route_dict = Dict{String, Any}(route)
    
    added_stops_list = String[]
    for (_, city) in stops_pairs
        push!(added_stops_list, city)
    end
    
    new_route_dict["stops"] = added_stops_list 
    return new_route_dict
end

# This function must handle an input Dict{String, String} and produce a Dict{Any, String}
function extend_route_information(route::Dict{String, String}; more_route_information...)
    # Create a new Dict{Any, String} and copy elements from the original route.
    # This allows adding Symbol keys (from keyword arguments) alongside String keys.
    extended_route_dict = Dict{Any, String}()
    for (k, v) in route
        extended_route_dict[k] = v
    end

    for (key, value) in pairs(more_route_information)
        # Add the Symbol key directly to the new dictionary
        extended_route_dict[key] = value
    end
    return extended_route_dict
end

