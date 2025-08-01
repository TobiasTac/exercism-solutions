"""
    is_valid_command(msg::String)::Bool

Checks if the message is a valid command (starts with "Chatbot", case-insensitive).
"""
function is_valid_command(msg::String)::Bool
    # r"..."i creates a case-insensitive regex.
    # "^" asserts the position at the start of the string.
    return occursin(r"^Chatbot"i, msg)
end

"""
    remove_emoji(msg::String)::String

Removes all "emoji" followed by its ID number from the message.
"""
function remove_emoji(msg::String)::String
    # r"emoji\d+" matches "emoji" literally followed by one or more digits (\d+).
    # Replace the matched pattern with an empty string.
    return replace(msg, r"emoji\d+" => "")
end

"""
    check_phone_number(number::String)::String

Checks if the phone number matches the format "(+##) ###-###-###".
Returns a confirmation message or an invalid message.
"""
function check_phone_number(number::String)::String
    # r"..." matches the exact pattern.
    # \d{2} matches exactly two digits.
    # \d{3} matches exactly three digits.
    # The whole pattern is anchored with ^ and $ to ensure the entire string matches.
    if !isnothing(match(r"^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$", number))
        return "Thanks! You can now download me to your phone."
    else
        return "Oops, it seems like I can't reach out to $(number)"
    end
end

"""
    getURL(msg::String)::Vector{String}

Extracts website links (simple domain names) from a message and returns them as an array of strings.
"""
function getURL(msg::String)::Vector{String}
    # This regex looks for common domain patterns.
    # (\w+\.)+ matches one or more word characters followed by a dot (like "exercism.")
    # \w{2,6} matches 2 to 6 word characters for the top-level domain (like "org").
    # The parentheses create a capture group for the entire URL.
    # `collect` converts the RegexMatchIterator to a Vector.
    # `m.match` extracts the full matched string for each RegexMatch object.
    matches = collect(eachmatch(r"(\w+\.)+\w{2,6}", msg))
    return [m.match for m in matches]
end

"""
    nice_to_meet_you(full_name_str::String)::String

Takes a string with the full name in "Lastname, Firstname" format
and returns "Nice to meet you, Firstname Lastname".
"""
function nice_to_meet_you(full_name_str::String)::String
    # This regex has two capture groups:
    # 1. (\w+) matches the last name (one or more word characters)
    # 2. (\w+) matches the first name (one or more word characters)
    # It assumes the format "Lastname, Firstname".
    # s"\2 \1" swaps the order of the captured groups: group 2 (Firstname) then group 1 (Lastname).
    reformatted_name = replace(full_name_str, r"(\w+), (\w+)" => s"\2 \1")
    return "Nice to meet you, $(reformatted_name)"
end