using Logging # Required for @info, @warn, @error macros

# Task 1: Check the humidity level of the room
"""
    humiditycheck(pct_humidity::Real)

Monitors the humidity level of the production room.
Throws an `ErrorException` if `pct_humidity` exceeds 70%.
Otherwise, adds an Info log: "humidity level check passed: h%".
"""
function humiditycheck(pct_humidity::Real)
    if pct_humidity > 70
        throw(ErrorException("humidity check failed: $(pct_humidity)%"))
    else
        @info "humidity level check passed: $(pct_humidity)%"
    end
end

# Task 2: Check for overheating
"""
    temperaturecheck(temperature)

Monitors the machine's internal temperature.
- If `temperature` is `nothing` (sensor broken), throws an `ArgumentError`.
- If `temperature` exceeds 500°C, throws a `DomainError`.
- Otherwise, adds an Info log: "temperature check passed: t °C".
"""
function temperaturecheck(temperature)
    if isnothing(temperature)
        throw(ArgumentError("sensor is broken"))
    elseif temperature > 500
        throw(DomainError(temperature, "overheating detected"))
    else
        @info "temperature check passed: $(temperature) °C"
    end
end

# Task 3: Define custom error
"""
    MachineError <: Exception

A custom general error type for machine monitoring failures.
"""
struct MachineError <: Exception
    message::String
    details::Dict{String, Any} # Optional: to hold more info if needed

    # Constructor with default message
    MachineError(msg::String="One or more machine checks failed.", details::Dict=Dict()) = new(msg, details)
end

# Task 4: Monitor the machine
"""
    machinemonitor(humidity::Real, temperature)

Checks both humidity and temperature. Logs errors and warnings based on specific failures.
Throws a `MachineError` if any check fails.
"""
function machinemonitor(humidity::Real, temperature)
    # Flags to track if any check failed
    overall_failure = false

    # --- Humidity Check ---
    try
        humiditycheck(humidity)
    catch e
        if isa(e, ErrorException)
            # Match the exact message format expected by the test
            @error "humidity level check failed: $(humidity)%"
            overall_failure = true
        else
            rethrow() # Re-throw any unexpected error type
        end
    end

    # --- Temperature Check ---
    try
        temperaturecheck(temperature)
    catch e
        if isa(e, ArgumentError)
            @warn "sensor is broken"
            overall_failure = true
        elseif isa(e, DomainError)
            # Match the exact message format expected by the test
            @error "overheating detected: $(temperature) °C"
            overall_failure = true
        else
            rethrow() # Re-throw any unexpected error type
        end
    end

    # --- Final Outcome ---
    if overall_failure
        # If any check failed, throw the custom MachineError
        throw(MachineError())
    end
    # If no checks failed, the logs from humiditycheck and temperaturecheck
    # would have already been printed, and the function simply finishes.
end