# Remove: using Parameters # This line must remain removed

# Task 1: Define type unions
StringOrMissing = Union{String, Missing}
IntOrNothing = Union{Int64, Nothing}

# Task 2: Implement the Player composite type
mutable struct Player
    name::StringOrMissing
    level::Int64
    health::Int64
    mana::IntOrNothing

    # Custom outer constructor to support keyword arguments and default values.
    # Arguments here no longer have strict type annotations to allow
    # catching type mismatches *inside* the constructor.
    function Player(;
        name = missing, # No type annotation here
        level = 0,      # No type annotation here
        health = 100,   # No type annotation here
        mana = nothing  # No type annotation here
    )
        # --- Handle 'name' argument ---
        # Manually validate 'name' to satisfy test for MethodError if it's not a String or Missing.
        if !ismissing(name) && !isa(name, String)
             throw(MethodError(Player, (name,))) # Throws MethodError for non-String/non-Missing name
        end
        final_name::StringOrMissing = name


        # --- Handle 'level' argument ---
        # Manually validate and convert 'level' to satisfy test for InexactError/TypeError.
        # This approach ensures `InexactError` is thrown directly by `Int64(level)` if applicable.
        # It also catches other non-numeric types.
        if !isa(level, Int64)
            try
                level = Int64(level) # Attempt conversion. This is where InexactError or MethodError might naturally occur.
            catch e
                # If it's an InexactError (e.g., Int64(4.2)), rethrow it.
                if isa(e, InexactError)
                    throw(e) # Rethrow the original InexactError
                else
                    # For other errors (like MethodError for Int64("hello")), rethrow as MethodError if the test expects it
                    throw(MethodError(Player, (level,)))
                end
            end
        end


        # --- Handle 'health' argument ---
        if !isa(health, Int64)
            try
                health = Int64(health)
            catch e
                if isa(e, InexactError)
                    throw(e)
                else
                    throw(MethodError(Player, (health,)))
                end
            end
        end

        # --- Handle 'mana' argument ---
        if !isnothing(mana) && !isa(mana, Int64) # Only check if not 'nothing'
            try
                mana = Int64(mana)
            catch e
                if isa(e, InexactError)
                    throw(e)
                else
                    throw(MethodError(Player, (mana,)))
                end
            end
        end
        final_mana::IntOrNothing = mana


        # Call the default (inner) constructor with the resolved and validated values
        new(final_name, level, health, final_mana)
    end
end

# Task 3: Introduce yourself
function introduce(player::Player)::String
    if ismissing(player.name)
        return "Mighty Magician"
    else
        return player.name
    end
end

# Task 4: Implement increment methods (using multiple dispatch)
function increment(name::StringOrMissing)::String
    if ismissing(name)
        return "The Great"
    else
        return "$(name) the Great"
    end
end

function increment(mana::IntOrNothing)::Int64
    if isnothing(mana)
        return 50
    else
        return mana + 100
    end
end

# Task 5: Implement the title function
function title(player::Player)::StringOrMissing
    if player.level == 42
        player.name = increment(player.name)
    end
    return player.name
end

# Task 6: Implement the revive function
function revive(player::Player)::Player
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end