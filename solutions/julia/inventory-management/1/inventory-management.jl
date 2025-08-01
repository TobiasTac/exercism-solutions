# create_inventory(items) creates an inventory from an input vector of items.
# It returns a Dict containing each item name paired with their respective quantity.
function create_inventory(items)
    inventory = Dict{String, Int}() # Always create a String, Int dictionary
    for item in items
        inventory[item] = get(inventory, item, 0) + 1
    end
    return inventory
end

# add_items method for Dict{String, Int} (the most common and specific case)
function add_items(inventory_dict::Dict{String, Int}, item_vector::Vector{String})
    for item in item_vector
        inventory_dict[item] = get(inventory_dict, item, 0) + 1
    end
    return inventory_dict
end

# add_items method for Dict{Any, Any} (to handle more generic inputs from tests)
function add_items(inventory_dict::Dict{Any, Any}, item_vector::Vector{String})
    for item in item_vector
        # Ensure the key is treated as a String and the value for arithmetic as an Int
        current_count = get(inventory_dict, item, 0)
        if !isa(current_count, Integer) # If it's not an Integer, treat it as 0 for safety
            current_count = 0
        end
        inventory_dict[item] = Int(current_count) + 1 # Convert to Int for assignment
    end
    return inventory_dict
end

# decrement_items method for Dict{String, Int}
function decrement_items(inventory_dict::Dict{String, Int}, items_vector::Vector{String})
    for item in items_vector
        if haskey(inventory_dict, item) && inventory_dict[item] > 0
            inventory_dict[item] -= 1
        end
    end
    return inventory_dict
end

# decrement_items method for Dict{Any, Any}
function decrement_items(inventory_dict::Dict{Any, Any}, items_vector::Vector{String})
    for item in items_vector
        if haskey(inventory_dict, item)
            current_count = inventory_dict[item]
            if isa(current_count, Integer) && current_count > 0
                inventory_dict[item] = Int(current_count) - 1
            end
        end
    end
    return inventory_dict
end

# remove_item method for Dict{String, Int}
function remove_item(inventory_dict::Dict{String, Int}, item::String)
    if haskey(inventory_dict, item)
        pop!(inventory_dict, item)
    end
    return inventory_dict
end

# remove_item method for Dict{Any, Any}
function remove_item(inventory_dict::Dict{Any, Any}, item::String)
    if haskey(inventory_dict, item)
        pop!(inventory_dict, item)
    end
    return inventory_dict
end

# list_inventory method for Dict{String, Int}
function list_inventory(inventory_dict::Dict{String, Int})
    available_items = [item => quantity for (item, quantity) in inventory_dict if quantity > 0]
    sort!(available_items, by = p -> p.first)
    return available_items
end

# list_inventory method for Dict{Any, Any}
function list_inventory(inventory_dict::Dict{Any, Any})
    available_items = Pair{String, Int}[]
    
    for (item, quantity) in inventory_dict
        if isa(item, String) && isa(quantity, Integer) && quantity > 0
            push!(available_items, item => Int(quantity))
        end
    end
    
    sort!(available_items, by = p -> p.first)
    
    return available_items
end
