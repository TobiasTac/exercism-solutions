using Dates # Garanta que este import esteja no topo do seu arquivo

# Task 1: Parse all-number appointment date
function schedule_appointment(appointment_str::String)::DateTime
    return DateTime(appointment_str, "mm/dd/yyyy HH:MM:SS")
end

# Task 2: Check if an appointment has already passed
function has_passed(appointment::DateTime)::Bool
    return appointment < now()
end

# Task 3: Check if appointment is in the afternoon
function is_afternoon_appointment(appointment::DateTime)::Bool
    hour_of_appointment = hour(appointment)
    return hour_of_appointment >= 12 && hour_of_appointment < 18
end

# Task 4: Describe the time and date of the appointment
function describe(appointment::DateTime)::String
    # Extrai o nome completo do dia da semana (ex: "Wednesday")
    weekday_name = Dates.format(appointment, "EEEE")
    
    # Extrai o nome completo do mês (ex: "March")
    month_name = Dates.monthname(appointment)
    
    # Extrai o dia do mês (ex: 29) - `day()` retorna um Int
    day_of_month = day(appointment)
    
    # Extrai o ano (ex: 2023)
    year_val = year(appointment)
    
    # Formata a hora e minuto (ex: "15:00")
    time_formatted = Dates.format(appointment, "HH:MM")

    # Constrói a string final usando interpolação
    return "You have an appointment on $(weekday_name), $(month_name) $(day_of_month), $(year_val) at $(time_formatted)"
end

# Task 5: Return the anniversary date
function anniversary_date()::Date
    current_year = year(now())
    return Date(current_year, 9, 15)
end