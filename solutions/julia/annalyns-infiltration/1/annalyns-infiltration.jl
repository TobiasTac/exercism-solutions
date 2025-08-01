function can_do_fast_attack(knight_awake::Bool)::Bool
    return !knight_awake
end

function can_spy(knight_awake::Bool, archer_awake::Bool, prisoner_awake::Bool)::Bool
    return knight_awake || archer_awake || prisoner_awake
end

function can_signal_prisoner(archer_awake::Bool, prisoner_awake::Bool)::Bool
    return prisoner_awake && !archer_awake
end

function can_free_prisoner(knight_awake::Bool, archer_awake::Bool, prisoner_awake::Bool, dog_present::Bool)::Bool
    if dog_present
        return !archer_awake
    else
        return prisoner_awake && !knight_awake && !archer_awake
    end
end
